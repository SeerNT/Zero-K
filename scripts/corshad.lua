local base = piece 'base'
local fuselage = piece 'fuselage' 
local wingl1 = piece 'wingl1' 
local wingr1 = piece 'wingr1' 
local wingl2 = piece 'wingl2' 
local wingr2 = piece 'wingr2' 
local engines = piece 'engines' 
local fins = piece 'fins' 
local rflap = piece 'rflap' 
local lflap = piece 'lflap' 
local predrop = piece 'predrop' 
local drop1 = piece 'drop1' 
local drop2 = piece 'drop2' 
local drop3 = piece 'drop3' 
local drop4 = piece 'drop4' 
local engines = piece 'engines' 
local thrustl = piece 'thrustl' 
local thrustr = piece 'thrustr' 
local wingtipl = piece 'wingtipl' 
local wingtipr = piece 'wingtipr' 
local xp,zp = piece("x","z")


smokePiece = {fuselage, thrustr, thrustl}

local bombs = 1

include "bombers.lua"
include "fakeUpright.lua"
include "constants.lua"

function script.StartMoving()
	Spring.Echo("StartMoving")
	Turn( fins , z_axis, math.rad(-(-30)), math.rad(50) )
	Move( wingr1 , x_axis, 500, 10)
	Move( wingr2 , x_axis, 500, 50)
	Move( wingl1 , x_axis, -500, 10)
	Move( wingl2 , x_axis, -500, 50)
end

function script.StopMoving()
	Spring.Echo("StopMoving")
	Turn( fins , z_axis, math.rad(-(0)), math.rad(80) )
	Move( wingr1 , x_axis, -500, 10)
	Move( wingr2 , x_axis, -500, 30)
	Move( wingl1 , x_axis, 500, 10)
	Move( wingl2 , x_axis, 500, 30)
	
end

local function Lights()
	while select(5, Spring.GetUnitHealth(unitID)) < 1  do
		Sleep(400)
	end
	while true do
		EmitSfx( wingtipr, 1024 )
		EmitSfx( wingtipl, 1025 )
		Sleep(2000)
	end
end

function script.Create()
	--FakeUprightInit(xp, zp, drop)
	StartThread(SmokeUnit)
	--StartThread(Lights)
end

function script.QueryWeapon(num)
	--FakeUprightTurn(unitID, xp, zp, base, predrop)
	return drop1
end

function script.AimWeapon(num, heading, pitch)
	return (Spring.GetUnitFuel(unitID) >= 1 and Spring.GetUnitRulesParam(unitID, "noammo") ~= 1)
end

function script.BlockShot(num)
	return num == 1
end

function script.FireWeapon(num)
	if num == 2 then
		--FakeUprightTurn(unitID, xp, zp, base, predrop)
		GG.Bomber_Dive_fired(unitID)
		Reload()
	elseif num == 3 then
		GG.Bomber_Dive_fake_fired(unitID)
	end
end

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage/maxHealth
	if  severity <= .25  then
		Explode(fuselage, sfxNone)
		Explode(enginel, sfxNone)
		Explode(enginer, sfxNone)
		Explode(wingl1, sfxNone)
		Explode(wingr2, sfxNone)
		return 1
	elseif severity <= .50  then
		Explode(fuselage, sfxNone)
		Explode(enginel, sfxNone)
		Explode(enginer, sfxNone)
		Explode(wingl2, sfxNone)
		Explode(wingr1, sfxNone)
		return 1
	elseif severity <= 99  then
		Explode(fuselage, sfxNone)
		Explode(enginel, sfxFall + sfxSmoke  + sfxFire )
		Explode(enginer, sfxFall + sfxSmoke  + sfxFire )
		Explode(wingl1, sfxFall + sfxSmoke  + sfxFire )
		Explode(wingr2, sfxFall + sfxSmoke  + sfxFire )
		return 2
	else
		Explode(fuselage, sfxNone)
		Explode(enginel, sfxFall + sfxSmoke  + sfxFire )
		Explode(enginer, sfxFall + sfxSmoke  + sfxFire )
		Explode(wingl1, sfxFall + sfxSmoke  + sfxFire )
		Explode(wingl2, sfxFall + sfxSmoke  + sfxFire )
		return 2
	end
end
