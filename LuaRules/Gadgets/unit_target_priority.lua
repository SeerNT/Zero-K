--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
if not gadgetHandler:IsSyncedCode() then
	return
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
	name 	= "Target Priority",
	desc	= "Controls target priority because the engine seems to be based on random numbers.",
	author	= "Google Frog",
	date	= "September 25 2011", --update: 9 January 2014
	license	= "GNU GPL, v2 or later",
	layer	= 0,
	enabled = true,
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local spGetUnitLosState = Spring.GetUnitLosState
local spGetUnitDefID = Spring.GetUnitDefID
local spGetUnitHealth = Spring.GetUnitHealth
local spGetUnitAllyTeam = Spring.GetUnitAllyTeam
local spGetTeamInfo = Spring.GetTeamInfo
local spGetUnitIsStunned = Spring.GetUnitIsStunned 
local spGetAllUnits = Spring.GetAllUnits
local spGetUnitRulesParam = Spring.GetUnitRulesParam
local spGetUnitSeparation = Spring.GetUnitSeparation

local targetTable, captureWeaponDefs, gravityWeaponDefs, proximityWeaponDefs, velocityPenaltyDefs, radarWobblePenalty, transportMult = 
	include("LuaRules/Configs/target_priority_defs.lua")

-- Low return number = more worthwhile target
-- This seems to override everything, will need to reimplement emp things, badtargetcats etc...
-- Callin occurs every 16 frames

--// Values that reset every slow update
-- Priority added based on health and capture for non-capture weapons
local remNormalPriorityModifier = {} 
local remSpeed = {}

 -- Priority added based on health and capture for capture weapons
 -- The disinction is because capture weapons need to prioritize partially captured things
local remCapturePriorityModifer = {}

-- UnitDefID of unit carried in a transport. Used to override transporter unitDefID
local remTransportiee = {}

-- Priority to add based on disabled state.
local remStunned = {}
local remBuildProgress = {}

-- Whether the enemy unit is visible.
local remVisible = {}

-- Remebered mass of the target, negative if it is immune to impulse (nanoframes)
local remScaledMass = {}

-- The number of radar wobble reductions that apply to each ally team.
local allyTeamTargetUpgrades = {}
local targetUpgradeUnitList = {}

--// Fairly unchanging values
local remAllyTeam = {}
local remUnitDefID = {}
local remStatic = {}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Utility Functions

local function GetUnitSpeed(unitID)
	if not remSpeed[unitID] then
		local _,_,_,vl = Spring.GetUnitVelocity(unitID)
		remSpeed[unitID] = vl
	end
	return remSpeed[unitID]
end

local function GetUnitVisibility(unitID, allyTeam)
	if not (remVisible[allyTeam] and remVisible[allyTeam][unitID]) then
		if not remVisible[allyTeam] then
			remVisible[allyTeam] = {}
		end
		local visibilityTable = spGetUnitLosState(unitID,allyTeam,false)
		if visibilityTable then
			if visibilityTable.los then
				remVisible[allyTeam][unitID] = 2 -- In LoS
			elseif visibilityTable.typed then
				remVisible[allyTeam][unitID] = 1 -- Known type
			else
				remVisible[allyTeam][unitID] = 0
			end
		else
			remVisible[allyTeam][unitID] = 0
		end
	end
	
	return remVisible[allyTeam][unitID]
end

local function GetUnitTransportieeDefID(unitID)
	if not remTransportiee[unitID] then
		local carryList = Spring.GetUnitIsTransporting(unitID)
		local carryID = carryList and carryList[1]
		if carryID and remUnitDefID[carryID] then
			remTransportiee[unitID] = remUnitDefID[carryID]
		else
			remTransportiee[unitID] = -1
		end
	end
	return remTransportiee[unitID] 
end

local function GetUnitStunnedOrInBuild(unitID)
	if not remStunned[unitID] then
		local bla, stunned, nanoframe = spGetUnitIsStunned(unitID)
		
		if stunned then
			remStunned[unitID] = 1
		else
			local disarmed = (spGetUnitRulesParam(unitID, "disarmed") == 1)
			local disarmExpected = GG.OverkillPrevention_IsDisarmExpected(unitID)
			if disarmed or disarmExpected then
				remStunned[unitID] = 0.5
			else
				remStunned[unitID] = 0
			end
		end
		
		if nanoframe or remStunned[unitID] >= 1 then
			local _, maxHealth, paralyzeDamage, _, buildProgress = spGetUnitHealth(unitID)
			remBuildProgress[unitID] = buildProgress
			if remStunned[unitID] >= 1 then
				-- Long paralysis is a much worse target than one that is almost worn off.
				local paraFactor = math.min(7.5, (paralyzeDamage/maxHealth)^4)
				remStunned[unitID] = paraFactor
			end
		else
			remBuildProgress[unitID] = 1
		end
	end
	
	return remStunned[unitID], remBuildProgress[unitID]
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Weapon type specific priority modifiers

local function GetCaptureWeaponPriorityModifier(unitID)
	if not remCapturePriorityModifer[unitID] then
		
		local stunned, buildProgress = GetUnitStunnedOrInBuild(unitID)
		
		local priority = stunned*2 + (15 * (1 - buildProgress))
		if buildProgress < 1 then
			priority = priority + 3
		end
		
		local overkill = GG.OverkillPrevention_IsDoomed(unitID)
		if overkill then
			priority = priority + 60
		end
		
		--// Get priority modifier for health and capture progress.
		local armored = Spring.GetUnitArmored(unitID)	
		local hp, maxHP, paralyze, capture = spGetUnitHealth(unitID)
		if hp and maxHP then
			priority = priority - (hp/maxHP)*0.1 -- Capture healthy units
		end
		
		if armored then
			priority = priority + 1
		end
		
		if capture > 0 then
			-- Really prioritize partially captured units
			priority = priority - 6*capture
		end
		
		remCapturePriorityModifer[unitID] = priority
	end
	
	return remCapturePriorityModifer[unitID]
end

local function GetNormalWeaponPriorityModifier(unitID)
	if not remNormalPriorityModifier[unitID] then
		
		local stunned, buildProgress = GetUnitStunnedOrInBuild(unitID)
		
		local priority = stunned*2 + (15 * (1 - buildProgress))
		if buildProgress < 1 then
			priority = priority + 3
		end
		
		local overkill = GG.OverkillPrevention_IsDoomed(unitID)
		if overkill then
			priority = priority + 60
		end
	
		local armored = Spring.GetUnitArmored(unitID)	
		local hp, maxHP, paralyze, capture = spGetUnitHealth(unitID)
		if hp and maxHP then
			priority = priority + (hp/maxHP)
		end
		
		if armored then
			priority = priority + 2
		end
		
		if capture > 0 then
			-- Deprioritize partially captured units.
			priority = priority + 0.2*capture
		end
		remNormalPriorityModifier[unitID] = priority
	end
	
	return remNormalPriorityModifier[unitID]
end

local function GetGravityWeaponPriorityModifier(unitID)
	if not remScaledMass[unitID] then
		local _,_,inbuild = spGetUnitIsStunned(unitID)
		if inbuild then
			remScaledMass[unitID] = -1
		else
			-- Glaive = 1.46, Zeus = 5.24, Reaper = 9.48
			remScaledMass[unitID] = 0.02 * UnitDefs[remUnitDefID[unitID]].mass
		end
	end
	if remScaledMass[unitID] > 0 then
		return remScaledMass[unitID] + GetNormalWeaponPriorityModifier(unitID) * 0.3
	else
		return false
	end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Priority callin

function gadget:AllowWeaponTarget(unitID, targetID, attackerWeaponNum, attackerWeaponDefID, defPriority)

	--Spring.Echo("TARGET CHECK")
	
	if (not targetID) or (not unitID) or (not attackerWeaponDefID) then
		return true, 25
	end
	
	local allyTeam = remAllyTeam[unitID]
	
	if (not allyTeam) then
		return true, 25
	end
	
	local enemyUnitDef = remUnitDefID[targetID]
	
	--// Get Velocity target penalty
	local velocityAdd = 0
	local velocityPenaltyDef = velocityPenaltyDefs[attackerWeaponDefID]
	if velocityPenaltyDef then
		local unitSpeed = GetUnitSpeed(targetID)
		if unitSpeed > velocityPenaltyDef[1] then
			velocityAdd = velocityPenaltyDef[2] + unitSpeed*velocityPenaltyDef[3]
		end
	end
	
	--// Radar dot handling. Radar dots are not handled by subsequent areas because a unit which is
	-- identified but not visible cannot have priority based on health or other status effects.
	local visiblity = GetUnitVisibility(targetID, allyTeam)

	if visiblity ~= 2 then
		local wobbleAdd = 0
		-- Mobile units get a penalty for radar wobble. Identified statics experience no wobble.
		if radarWobblePenalty[attackerWeaponDefID] and (visibility == 0 or not remStatic[enemyUnitDef]) then
			if (not allyTeamTargetUpgrades[allyTeam]) or allyTeamTargetUpgrades[allyTeam] > 0 then
				wobbleAdd = radarWobblePenalty[attackerWeaponDefID]
			end
		end
		
		if visiblity == 0 then
			return true, 25 + wobbleAdd + velocityAdd
		elseif visiblity == 1 then
			-- If the unit type is accessible then it can be included in the priority calculation.
			return true, (targetTable[enemyUnitDef][attackerWeaponDefID] or 5) + wobbleAdd + velocityAdd + 1.5
		end
	end
	
	--// Get default priority for weapon type vs unit type. Includes transportation
	local defPrio
	if transportMult[enemyUnitDef] then
		local transportiee = GetUnitTransportieeDefID(targetID)
		if transportiee then
			defPrio = targetTable[enemyUnitDef][attackerWeaponDefID] or 5
		else
			defPrio = (targetTable[transportiee][attackerWeaponDefID] or 5)*transportMult[enemyUnitDef]
		end
	else
		defPrio = targetTable[enemyUnitDef][attackerWeaponDefID] or 5
	end

	--// Get priority modifier based on broad weapon type and generic unit status
	if captureWeaponDefs[attackerWeaponDefID] then
		defPrio = defPrio + GetCaptureWeaponPriorityModifier(targetID)
	elseif gravityWeaponDefs[attackerWeaponDefID] then
		local gravityPriority = GetGravityWeaponPriorityModifier(targetID)
		if not gravityPriority then
			return false
		end
		defPrio = defPrio + gravityPriority
	else
		defPrio = defPrio + GetNormalWeaponPriorityModifier(targetID)
	end
	
	--// Proximity weapon special handling (heatrays).
	-- Prioritize nearby units.
	if proximityWeaponDefs[attackerWeaponDefID] then
		local unitSeparation = spGetUnitSeparation(unitID,targetID,true)
		local distAdd = 20 * (unitSeparation/WeaponDefs[attackerWeaponDefID].range)
		defPrio = defPrio + distAdd
	end
	
	--Spring.Utilities.UnitEcho(targetID, defPrio .. "  " .. velocityAdd)
	return true, defPrio + velocityAdd -- bigger value have lower priority
end

function gadget:GameFrame(f)
	if f%16 == 8 then -- f%16 == 0 happens just before AllowWeaponTarget
		remNormalPriorityModifier = {}
		remSpeed = {}
		remCapturePriorityModifer = {}
		remTransportiee = {}
		remVisible = {}
		remScaledMass = {}
		remStunned = {}
		remBuildProgress = {}
		
		-- update radar wobble status
		-- first zero all half-wobble counts
		for key, value in pairs(allyTeamTargetUpgrades) do
			allyTeamTargetUpgrades[key] = 0
		end
	
		--then sort through extant radar upgrade units and add those which are complete to the ally teams they belong to
		for unitID, _ in pairs(targetUpgradeUnitList) do
			local valid = Spring.ValidUnitID(unitID)
			if not valid then
				targetUpgradeUnitList[unitID] = nil
			else
				local stunned_or_inbuild,_,_ = spGetUnitIsStunned(unitID) -- determine if it's still under construction
				local disarmed = (spGetUnitRulesParam(unitID, "disarmed") == 1)
				local allyTeam = spGetUnitAllyTeam(unitID)
				if not stunned_or_inbuild and not disarmed then
					allyTeamTargetUpgrades[allyTeam] = (allyTeamTargetUpgrades[allyTeam] or 0) + 1
				end
			end
		end
	end
end

function gadget:UnitCreated(unitID, unitDefID)
	remUnitDefID[unitID] = unitDefID
	local allyTeam = spGetUnitAllyTeam(unitID)
	remAllyTeam[unitID] = allyTeam
	remStatic[unitID] = (unitDefID and not Spring.Utilities.getMovetype(UnitDefs[unitDefID]))
	
	if UnitDefs[unitDefID].targfac then
		targetUpgradeUnitList[unitID] = true
	end
end

function gadget:UnitDestroyed(unitID, unitDefID)
	remUnitDefID[unitID] = nil
	remStatic[unitID] = nil
	remAllyTeam[unitID] = nil
	targetUpgradeUnitList[unitID] = nil
end

function gadget:UnitGiven(unitID, unitDefID, teamID, oldTeamID)
	local _,_,_,_,_,newAllyTeam = spGetTeamInfo(teamID)
	remAllyTeam[unitID] = newAllyTeam
end

function gadget:Initialize()
	for _, unitID in ipairs(spGetAllUnits()) do
		local unitDefID = spGetUnitDefID(unitID)
		gadget:UnitCreated(unitID, unitDefID)
	end
	-- Hopefully not all weapon callins will need to be watched
	-- in some future version.
	for weaponID,_ in pairs(WeaponDefs) do
		Script.SetWatchWeapon(weaponID, true)
	end
end
