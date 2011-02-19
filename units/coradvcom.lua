unitDef = {
  unitname          = [[coradvcom]],
  name              = [[Advanced Battle Commander]],
  description       = [[Heavy Combat Commander, Builds at 12 m/s]],
  acceleration      = 0.18,
  activateWhenBuilt = true,
  amphibious        = [[1]],
  autoHeal          = 5,
  brakeRate         = 0.375,
  buildCostEnergy   = 2400,
  buildCostMetal    = 2400,
  buildDistance     = 120,
  builder           = true,

  buildoptions      = {
  },

  buildPic          = [[corcom.png]],
  buildTime         = 2400,
  canAttack         = true,
  canCloak          = false,
  canDGun           = true,
  canGuard          = true,
  canMove           = true,
  canPatrol         = true,
  canstop           = [[1]],
  category          = [[LAND FIREPROOF]],
  commander         = true,
  corpse            = [[DEAD]],

  customParams      = {
    fireproof = [[1]],
    helptext  = [[The Battle Commander emphasizes firepower and armor, at the expense of speed and support equipment. Its base weapon is a riot cannon, while its special weapon fires cluster bombs in a line ahead.]],
    level     = [[3]],
    statsname = [[coradvcom]],
  },

  energyMake        = 3.5,
  energyStorage     = 0,
  energyUse         = 0,
  explodeAs         = [[ESTOR_BUILDINGEX]],
  footprintX        = 2,
  footprintZ        = 2,
  hideDamage        = true,
  iconType          = [[corcommander]],
  idleAutoHeal      = 5,
  idleTime          = 1800,
  immunetoparalyzer = [[1]],
  mass              = 1027,
  maxDamage         = 5000,
  maxSlope          = 36,
  maxVelocity       = 1.3,
  maxWaterDepth     = 5000,
  metalMake         = 3.5,
  metalStorage      = 0,
  minCloakDistance  = 100,
  movementClass     = [[AKBOT2]],
  noChaseCategory   = [[TERRAFORM SATELLITE FIXEDWING GUNSHIP HOVER SHIP SWIM SUB LAND FLOAT SINK]],
  norestrict        = [[1]],
  objectName        = [[corcom.s3o]],
  onoffable         = true,
  script            = [[corcom.lua]],
  seismicSignature  = 16,
  selfDestructAs    = [[ESTOR_BUILDINGEX]],

  sfxtypes          = {

    explosiongenerators = {
      [[custom:RAIDMUZZLE]],
      [[custom:LEVLRMUZZLE]],
      [[custom:RAIDMUZZLE]],
    },

  },

  showNanoSpray     = false,
  showPlayerName    = true,
  side              = [[CORE]],
  sightDistance     = 500,
  smoothAnim        = true,
  sonarDistance     = 300,
  TEDClass          = [[COMMANDER]],
  terraformSpeed    = 600,
  turnRate          = 1148,
  upright           = true,
  workerTime        = 12,

  weapons           = {

    [1] = {
      def                = [[FAKELASER]],
      badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING LAND SINK SHIP SWIM FLOAT GUNSHIP HOVER]],
    },


    [3] = {
      def                = [[CLUSTERBOMB]],
      onlyTargetCategory = [[FIXEDWING LAND SINK SHIP SWIM FLOAT GUNSHIP HOVER]],
    },


    [5] = {
      def                = [[SHOCK_CANNON]],
      badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING LAND SINK SHIP SWIM FLOAT GUNSHIP HOVER]],
    },

  },


  weaponDefs        = {

    CLUSTERBOMB    = {
      name                    = [[Cluster Bomb]],
      accuracy                = 200,
      areaOfEffect            = 160,
      commandFire             = true,
      craterBoost             = 1,
      craterMult              = 2,

      damage                  = {
        default = 300,
        planes  = 300,
        subs    = 15,
      },

      explosionGenerator      = [[custom:MEDMISSILE_EXPLOSION]],
      fireStarter             = 100,
      impulseBoost            = 0,
      impulseFactor           = 0.2,
      interceptedByShieldType = 2,
      lineOfSight             = true,
      metalpershot            = 15,
      model                   = [[bomb]],
      noSelfDamage            = true,
      projectiles             = 8,
      range                   = 320,
      reloadtime              = 12,
      renderType              = 4,
      smokeTrail              = true,
      soundHit                = [[explosion/ex_med6]],
      soundHitVolume          = 8,
      soundStart              = [[weapon/cannon/cannon_fire3]],
      soundStartVolume        = 2,
      sprayangle              = 2048,
      startsmoke              = [[1]],
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 400,
    },


    COR_SHIELD_COM = {
      name                    = [[Energy Shield]],
      craterMult              = 0,

      damage                  = {
        default = 10,
      },

      exteriorShield          = true,
      impulseFactor           = 0,
      interceptedByShieldType = 1,
      isShield                = true,
      shieldAlpha             = 0.4,
      shieldBadColor          = [[1 0.1 0.1]],
      shieldGoodColor         = [[0.1 0.1 1]],
      shieldInterceptType     = 3,
      shieldPower             = 3500,
      shieldPowerRegen        = 60,
      shieldPowerRegenEnergy  = 6,
      shieldRadius            = 300,
      shieldRepulser          = false,
      smartShield             = true,
      texture1                = [[wakelarge]],
      visibleShield           = true,
      visibleShieldHitFrames  = 4,
      visibleShieldRepulse    = true,
      weaponType              = [[Shield]],
    },


    FAKELASER      = {
      name                    = [[Fake Laser]],
      areaOfEffect            = 12,
      beamTime                = 0.1,
      coreThickness           = 0.5,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
        default = 0,
        subs    = 0,
      },

      duration                = 0.11,
      edgeEffectiveness       = 0.99,
      explosionGenerator      = [[custom:flash1green]],
      fireStarter             = 70,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      largeBeamLaser          = true,
      laserFlareSize          = 5.53,
      lineOfSight             = true,
      minIntensity            = 1,
      noSelfDamage            = true,
      range                   = 320,
      reloadtime              = 0.11,
      renderType              = 0,
      rgbColor                = [[0 1 0]],
      soundStart              = [[weapon/laser/pulse_laser3]],
      soundTrigger            = true,
      targetMoveError         = 0.05,
      texture1                = [[largelaser]],
      texture2                = [[flare]],
      texture3                = [[flare]],
      texture4                = [[smallflare]],
      thickness               = 5.53,
      tolerance               = 10000,
      turret                  = true,
      weaponType              = [[BeamLaser]],
      weaponVelocity          = 900,
    },


    SHOCK_CANNON   = {
      name                    = [[Shock Cannon]],
      areaOfEffect            = 144,
      avoidFeature            = true,
      avoidFriendly           = true,
      burnblow                = true,
      craterBoost             = 1,
      craterMult              = 2,

      damage                  = {
        default = 300,
        planes  = 300,
        subs    = 15,
      },

      edgeEffectiveness       = 0.75,
      explosionGenerator      = [[custom:FLASH64]],
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      lineOfSight             = true,
      noSelfDamage            = true,
      range                   = 330,
      reloadtime              = 2,
      renderType              = 4,
      soundHit                = [[weapon/cannon/generic_cannon]],
      soundStart              = [[weapon/cannon/outlaw_gun]],
      soundStartVolume        = 3,
      startsmoke              = [[1]],
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 750,
    },

  },


  featureDefs       = {

    DEAD = {
      description      = [[Wreckage - Advanced Battle Commander]],
      blocking         = true,
      category         = [[corpses]],
      damage           = 3600,
      energy           = 0,
      featureDead      = [[HEAP]],
      featurereclamate = [[SMUDGE01]],
      footprintX       = 2,
      footprintZ       = 2,
      height           = [[20]],
      hitdensity       = [[100]],
      metal            = 960,
      object           = [[corcom_dead.s3o]],
      reclaimable      = true,
      reclaimTime      = 960,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },


    HEAP = {
      description      = [[Debris - Advanced Battle Commander]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 3600,
      energy           = 0,
      featurereclamate = [[SMUDGE01]],
      footprintX       = 2,
      footprintZ       = 2,
      hitdensity       = [[100]],
      metal            = 480,
      object           = [[debris2x2c.s3o]],
      reclaimable      = true,
      reclaimTime      = 480,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },

  },

}

return lowerkeys({ coradvcom = unitDef })
