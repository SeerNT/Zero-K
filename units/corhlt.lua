unitDef = {
  unitname                      = [[corhlt]],
  name                          = [[Stinger]],
  description                   = [[High-Energy Laser Tower]],
  acceleration                  = 0,
  brakeRate                     = 0,
  buildAngle                    = 4096,
  buildCostEnergy               = 400,
  buildCostMetal                = 400,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 4,
  buildingGroundDecalSizeY      = 4,
  buildingGroundDecalType       = [[corhlt_aoplane.dds]],
  buildPic                      = [[CORHLT.png]],
  buildTime                     = 400,
  canAttack                     = true,
  canstop                       = [[1]],
  category                      = [[FLOAT]],
  collisionVolumeOffsets        = [[0 -38 0]],
  collisionVolumeScales         = [[36 110 36]],
  collisionVolumeTest           = 1,
  collisionVolumeType           = [[CylY]],
  corpse                        = [[DEAD]],

  customParams                  = {
    description_fr = [[Tourelle Laser Moyenne HLT]],
    helptext       = [[The Stinger is a medium laser turret. Its three rotating laser guns can kill almost any small unit, but its low rate of fire makes it vulnerable to swarms when unassisted.]],
    helptext_fr    = [[Le Gaat Gun est compos? de trois canons lasers rotatifs lourd. Oblig?s de se refroidir apr?s chaque tir, il n'en d?livrent pas moins une forte puissance de feu instann?e. Tr?s utile sur des grosses cibles, elle aura besoin d'assistance en cas de nombreux ennemis.]],
  },

  explodeAs                     = [[MEDIUM_BUILDINGEX]],
  floater                       = true,
  footprintX                    = 3,
  footprintZ                    = 3,
  iconType                      = [[defenseheavy]],
  idleAutoHeal                  = 5,
  idleTime                      = 1800,
  levelGround                   = false,
  mass                          = 267,
  maxDamage                     = 2475,
  maxSlope                      = 36,
  maxVelocity                   = 0,
  minCloakDistance              = 150,
  modelCenterOffset             = [[0 55 0]],
  noAutoFire                    = false,
  noChaseCategory               = [[FIXEDWING LAND SHIP SATELLITE SWIM GUNSHIP SUB HOVER]],
  objectName                    = [[hlt.s3o]],
  seismicSignature              = 4,
  selfDestructAs                = [[MEDIUM_BUILDINGEX]],

  sfxtypes                      = {

    explosiongenerators = {
      [[custom:HLTRADIATE0]],
      [[custom:beamlaser_hit_blue]],
    },

  },

  side                          = [[CORE]],
  sightDistance                 = 660,
  smoothAnim                    = true,
  sweepfire                     = [[1]],
  TEDClass                      = [[FORT]],
  turnRate                      = 0,
  useBuildingGroundDecal        = true,
  workerTime                    = 0,
  yardMap                       = [[oooo]],

  weapons                       = {

    {
      def                = [[LASER]],
      badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING LAND SINK SHIP SWIM FLOAT GUNSHIP HOVER]],
    },

  },


  weaponDefs                    = {

    LASER = {
      name                    = [[High-Energy Laserbeam]],
      areaOfEffect            = 14,
      beamTime                = 0.8,
      coreThickness           = 0.5,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
        default = 850,
        planes  = 850,
        subs    = 45,
      },

      explosionGenerator      = [[custom:FLASH1blue]],
      fireStarter             = 90,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      largeBeamLaser          = true,
      laserFlareSize          = 10.4,
      lineOfSight             = true,
      minIntensity            = 1,
      noSelfDamage            = true,
      range                   = 620,
      reloadtime              = 4.5,
      renderType              = 0,
      rgbColor                = [[0 0 1]],
      scrollSpeed             = 5,
      soundStart              = [[weapon/laser/heavy_laser3]],
      sweepfire               = false,
      targetMoveError         = 0.2,
      texture1                = [[largelaser]],
      texture2                = [[flare]],
      texture3                = [[flare]],
      texture4                = [[smallflare]],
      thickness               = 10.4024486300101,
      tileLength              = 300,
      tolerance               = 10000,
      turret                  = true,
      weaponType              = [[BeamLaser]],
      weaponVelocity          = 2250,
    },

  },


  featureDefs                   = {

    DEAD  = {
      description      = [[Wreckage - Stinger]],
      blocking         = true,
      category         = [[corpses]],
      damage           = 2475,
      energy           = 0,
      featureDead      = [[DEAD2]],
      featurereclamate = [[SMUDGE01]],
      footprintX       = 3,
      footprintZ       = 3,
      height           = [[20]],
      hitdensity       = [[100]],
      metal            = 180,
      object           = [[corhlt_d.s3o]],
      reclaimable      = true,
      reclaimTime      = 180,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },


    DEAD2 = {
      description      = [[Debris - Stinger]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 2475,
      energy           = 0,
      featureDead      = [[HEAP]],
      featurereclamate = [[SMUDGE01]],
      footprintX       = 3,
      footprintZ       = 3,
      height           = [[4]],
      hitdensity       = [[100]],
      metal            = 180,
      object           = [[debris3x3a.s3o]],
      reclaimable      = true,
      reclaimTime      = 180,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },


    HEAP  = {
      description      = [[Debris - Stinger]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 2475,
      energy           = 0,
      featurereclamate = [[SMUDGE01]],
      footprintX       = 3,
      footprintZ       = 3,
      height           = [[4]],
      hitdensity       = [[100]],
      metal            = 90,
      object           = [[debris3x3a.s3o]],
      reclaimable      = true,
      reclaimTime      = 90,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },

  },

}

return lowerkeys({ corhlt = unitDef })
