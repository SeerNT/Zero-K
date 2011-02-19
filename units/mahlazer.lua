unitDef = {
  unitname                      = [[mahlazer]],
  name                          = [[Starlight]],
  description                   = [[Planetary Energy Chisel]],
  acceleration                  = 0,
  activateWhenBuilt             = true,
  antiweapons                   = [[1]],
  brakeRate                     = 0,
  buildAngle                    = 32700,
  buildCostEnergy               = 35000,
  buildCostMetal                = 35000,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 11,
  buildingGroundDecalSizeY      = 11,
  buildingGroundDecalType       = [[mahlazer_aoplane.dds]],
  buildPic                      = [[mahlazer.png]],
  buildTime                     = 35000,
  canAttack                     = true,
  canstop                       = [[1]],
  category                      = [[SINK]],
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[120 120 120]],
  collisionVolumeTest           = 1,
  collisionVolumeType           = [[ellipsoid]],
  corpse                        = [[DEAD]],

  customParams                  = {
    description_fr = [[Lazer ? Charge ?liptique]],
    helptext       = [[This large scale tool is used to shape terrain for terraforming projects. Also useful as a cleanser of obstacles such as pesky enemy units and bases.]],
    helptext_fr    = [[Le MAH Lazer est un b?timent abritant un puissant g?n?rateur de faisceau laser ?liptique, dont l'impact est param?trable. Sa puissance est telle qu'il coupe tout sur son passage, y compris les alli?s. Pensez ? pr?voir un espace d?gag? autour de lui pour ?viter que le laser ne coupe votre base en deux en d?marrant.]],
  },

  energyUse                     = 300,
  explodeAs                     = [[ATOMIC_BLAST]],
  footprintX                    = 8,
  footprintZ                    = 8,
  iconType                      = [[mahlazer]],
  idleAutoHeal                  = 5,
  idleTime                      = 1800,
  mass                          = 2013,
  maxDamage                     = 12000,
  maxSlope                      = 18,
  maxVelocity                   = 0,
  maxWaterDepth                 = 0,
  minCloakDistance              = 150,
  noChaseCategory               = [[FIXEDWING LAND SHIP SATELLITE SWIM GUNSHIP SUB HOVER]],
  objectName                    = [[lazer.3do]],
  onoffable                     = true,
  seismicSignature              = 4,
  selfDestructAs                = [[ATOMIC_BLAST]],

  sfxtypes                      = {

    explosiongenerators = {
      [[custom:IMMA_LAUNCHIN_MAH_LAZER]],
    },

  },

  side                          = [[ARM]],
  sightDistance                 = 660,
  smoothAnim                    = true,
  TEDClass                      = [[FORT]],
  turnRate                      = 0,
  useBuildingGroundDecal        = true,
  workerTime                    = 0,
  yardMap                       = [[oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]],

  weapons                       = {

    {
      def                = [[LAZER]],
      badTargetCategory  = [[FIXEDWING GUNSHIP SATELLITE]],
      onlyTargetCategory = [[SWIM LAND SINK FLOAT SHIP HOVER FIXEDWING GUNSHIP SATELLITE]],
    },


    {
      def                = [[TARGETER]],
      onlyTargetCategory = [[NONE]],
    },


    {
      def                = [[RELAY]],
      onlyTargetCategory = [[NONE]],
    },

  },


  weaponDefs                    = {

    LAZER    = {
      name                    = [[Craterpuncher]],
      accuracy                = 0,
      alwaysVisible           = 0,
      areaOfEffect            = 140,
      avoidFeature            = false,
      avoidNeutral            = false,
      beamTime                = 1,
      coreThickness           = 0.5,
      craterBoost             = 4,
      craterMult              = 8,
      cylinderTargetting      = 1,

      damage                  = {
        default = 3000,
        planes  = 3000,
        subs    = 150,
      },

      explosionGenerator      = [[custom:megapartgun]],
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      largeBeamLaser          = true,
      laserFlareSize          = 10,
      lineOfSight             = true,
      minIntensity            = 1,
      noSelfDamage            = true,
      range                   = 9000,
      reloadtime              = 20,
      renderType              = 0,
      rgbColor                = [[0.25 0 1]],
      soundStart              = [[weapon/laser/heavy_laser4]],
      texture1                = [[largelaser]],
      texture2                = [[flare]],
      texture3                = [[flare]],
      texture4                = [[smallflare]],
      thickness               = 48,
      tolerance               = 1000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[BeamLaser]],
      weaponVelocity          = 1400,
    },


    RELAY    = {
      name                    = [[MAH RELAY LAZER (fake weapon)]],
      alwaysVisible           = 18,
      areaOfEffect            = 32,
      avoidFeature            = false,
      avoidNeutral            = false,
      beamTime                = 0.001,
      canattackground         = false,
      coreThickness           = 0.5,
      craterBoost             = 1,
      craterMult              = 2,
      cylinderTargetting      = 8192,

      damage                  = {
        default = 100,
        planes  = 100,
        subs    = 5,
      },

      endsmoke                = [[0]],
      explosionGenerator      = [[custom:NONE]],
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0,
      interceptedByShieldType = 1,
      largeBeamLaser          = true,
      laserFlareSize          = 12,
      lineOfSight             = true,
      minIntensity            = 1,
      noSelfDamage            = true,
      range                   = 9000,
      reloadtime              = 7,
      renderType              = 0,
      rgbColor                = [[0.25 0 1]],
      soundTrigger            = true,
      startsmoke              = [[0]],
      texture1                = [[largelaser]],
      texture2                = [[flare]],
      texture3                = [[flare]],
      texture4                = [[smallflare]],
      thickness               = 16,
      tolerance               = 10000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[BeamLaser]],
      weaponVelocity          = 1400,
    },


    TARGETER = {
      name                    = [[Groovecutter]],
      alwaysVisible           = 18,
      areaOfEffect            = 56,
      avoidFeature            = false,
      avoidNeutral            = false,
      beamTime                = 0.001,
      canattackground         = false,
      coreThickness           = 0.5,
      craterBoost             = 2,
      craterMult              = 4,
      cylinderTargetting      = 8192,

      damage                  = {
        default = 100,
        planes  = 100,
        subs    = 5,
      },

      explosionGenerator      = [[custom:FLASHLAZER]],
      impulseBoost            = 0,
      impulseFactor           = 0,
      interceptedByShieldType = 1,
      largeBeamLaser          = true,
      laserFlareSize          = 12,
      lineOfSight             = true,
      minIntensity            = 1,
      noSelfDamage            = true,
      range                   = 9000,
      reloadtime              = 7,
      renderType              = 0,
      rgbColor                = [[0.25 0 1]],
      soundStart              = [[weapon/laser/laser_burn6]],
      soundStartVolume        = 1,
      soundTrigger            = true,
      texture1                = [[largelaser]],
      texture2                = [[flare]],
      texture3                = [[flare]],
      texture4                = [[smallflare]],
      thickness               = 16,
      tolerance               = 10000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[BeamLaser]],
      weaponVelocity          = 1400,
    },

  },


  featureDefs                   = {

    DEAD  = {
      description      = [[Wreckage - Starlight]],
      blocking         = true,
      category         = [[corpses]],
      damage           = 12000,
      energy           = 0,
      featureDead      = [[DEAD2]],
      featurereclamate = [[SMUDGE01]],
      footprintX       = 3,
      footprintZ       = 3,
      height           = [[40]],
      hitdensity       = [[100]],
      metal            = 14000,
      object           = [[wreck7x7a.s3o]],
      reclaimable      = true,
      reclaimTime      = 14000,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },


    DEAD2 = {
      description      = [[Debris - Starlight]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 12000,
      energy           = 0,
      featureDead      = [[HEAP]],
      featurereclamate = [[SMUDGE01]],
      footprintX       = 3,
      footprintZ       = 3,
      height           = [[4]],
      hitdensity       = [[100]],
      metal            = 14000,
      object           = [[debris3x3c.s3o]],
      reclaimable      = true,
      reclaimTime      = 14000,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },


    HEAP  = {
      description      = [[Debris - Starlight]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 12000,
      energy           = 0,
      featurereclamate = [[SMUDGE01]],
      footprintX       = 3,
      footprintZ       = 3,
      height           = [[4]],
      hitdensity       = [[100]],
      metal            = 7000,
      object           = [[debris3x3c.s3o]],
      reclaimable      = true,
      reclaimTime      = 7000,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },

  },

}

return lowerkeys({ mahlazer = unitDef })
