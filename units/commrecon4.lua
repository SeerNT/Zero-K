unitDef = {
  unitname          = [[commrecon4]],
  name              = [[Advanced Recon Commander]],
  description       = [[High Mobility Commander, Builds at 12 m/s]],
  acceleration      = 0.25,
  activateWhenBuilt = true,
  amphibious        = [[1]],
  autoHeal          = 5,
  brakeRate         = 0.45,
  buildCostEnergy   = 2400,
  buildCostMetal    = 2400,
  buildDistance     = 120,
  builder           = true,

  buildoptions      = {
  },

  buildPic          = [[commrecon.png]],
  buildTime         = 2400,
  canAttack         = true,
  canDGun           = true,
  canGuard          = true,
  canMove           = true,
  canPatrol         = true,
  canstop           = [[1]],
  category          = [[LAND FIREPROOF]],
  cloakCost         = 3,
  cloakCostMoving   = 12,
  commander         = true,
  corpse            = [[DEAD]],

  customParams      = {
    canjump   = [[1]],
    fireproof = [[1]],
    helptext  = [[The Recon Commander revolves around mobility and guile; this lightly armored platform can mount many special weapons and modules. Its base weapon is a slowing beam, while its special is a disruptor bomb with a wide AoE. It also features jumpjets.]],
    jumpclass = [[commrecon2]],
    level     = [[4]],
    statsname = [[commadvrecon]],
  },

  energyMake        = 3,
  energyStorage     = 0,
  energyUse         = 0,
  explodeAs         = [[ESTOR_BUILDINGEX]],
  footprintX        = 2,
  footprintZ        = 2,
  hideDamage        = true,
  iconType          = [[armcommander]],
  idleAutoHeal      = 5,
  idleTime          = 1800,
  immunetoparalyzer = [[1]],
  mass              = 983,
  maxDamage         = 4800,
  maxSlope          = 36,
  maxVelocity       = 1.55,
  maxWaterDepth     = 5000,
  metalMake         = 3,
  metalStorage      = 0,
  minCloakDistance  = 100,
  movementClass     = [[AKBOT2]],
  noChaseCategory   = [[TERRAFORM SATELLITE FIXEDWING GUNSHIP HOVER SHIP SWIM SUB LAND FLOAT SINK]],
  norestrict        = [[1]],
  objectName        = [[commrecon.s3o]],
  onoffable         = true,
  radarDistance     = 1400,
  script            = [[commrecon.lua]],
  seismicSignature  = 16,
  selfDestructAs    = [[ESTOR_BUILDINGEX]],

  sfxtypes          = {

    explosiongenerators = {
      [[custom:NONE]],
      [[custom:NONE]],
      [[custom:RAIDMUZZLE]],
      [[custom:NONE]],
      [[custom:VINDIBACK]],
      [[custom:FLASH64]],
    },

  },

  showNanoSpray     = false,
  showPlayerName    = true,
  side              = [[ARM]],
  sightDistance     = 500,
  smoothAnim        = true,
  sonarDistance     = 300,
  stealth           = true,
  TEDClass          = [[COMMANDER]],
  terraformSpeed    = 600,
  turnRate          = 1350,
  upright           = true,
  workerTime        = 12,

  weapons           = {

    [1] = {
      def                = [[FAKELASER]],
      badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING LAND SINK SHIP SWIM FLOAT GUNSHIP HOVER]],
    },


    [3] = {
      def                = [[SLOWBOMB]],
      onlyTargetCategory = [[FIXEDWING LAND SINK SHIP SWIM FLOAT GUNSHIP HOVER]],
    },


    [4] = {
      def                = [[SLOWBEAM]],
      badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING LAND SINK SHIP SWIM FLOAT GUNSHIP HOVER]],
    },

  },


  weaponDefs        = {

    FAKELASER = {
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
      range                   = 350,
      reloadtime              = 0.11,
      renderType              = 0,
      rgbColor                = [[0 1 0]],
      soundStart              = [[weapon/laser/laser_burn5]],
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


    SLOWBEAM  = {
      name                    = [[Slowing Beam]],
      areaOfEffect            = 8,
      beamDecay               = 0.9,
      beamTime                = 0.1,
      beamttl                 = 50,
      coreThickness           = 0,
      craterBoost             = 0,
      craterMult              = 0,

      customParams            = {
        timeslow_preset = [[commrecon2_slowbeam]],
      },


      damage                  = {
        default = 150,
      },

      explosionGenerator      = [[custom:flash2purple]],
      fireStarter             = 30,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      largeBeamLaser          = true,
      laserFlareSize          = 6,
      lineOfSight             = true,
      minIntensity            = 1,
      noSelfDamage            = true,
      range                   = 350,
      reloadtime              = 1.5,
      renderType              = 0,
      rgbColor                = [[0.4 0 0.5]],
      soundStart              = [[weapon/laser/pulse_laser2]],
      soundStartVolume        = 0.9,
      soundTrigger            = true,
      sweepfire               = false,
      texture1                = [[largelaser]],
      texture2                = [[flare]],
      texture3                = [[flare]],
      texture4                = [[smallflare]],
      thickness               = 8,
      tolerance               = 18000,
      turret                  = true,
      weaponType              = [[BeamLaser]],
      weaponVelocity          = 500,
    },


    SLOWBOMB  = {
      name                    = [[Disruptor Bomb]],
      accuracy                = 256,
      areaOfEffect            = 512,
      commandFire             = true,
      craterBoost             = 0,
      craterMult              = 0,

      customParams            = {
        timeslow_preset = [[commrecon2_slowbomb]],
      },


      damage                  = {
        default = 300,
        planes  = 300,
        subs    = 15,
      },

      explosionGenerator      = [[custom:riotballplus]],
      fireStarter             = 100,
      impulseBoost            = 0,
      impulseFactor           = 0,
      interceptedByShieldType = 2,
      lineOfSight             = true,
      model                   = [[wep_b_fabby.s3o]],
      noSelfDamage            = true,
      range                   = 450,
      reloadtime              = 12,
      renderType              = 4,
      smokeTrail              = true,
      soundHit                = [[weapon/aoe_aura]],
      soundHitVolume          = 8,
      soundStart              = [[weapon/cannon/cannon_fire3]],
      startsmoke              = [[1]],
      startVelocity           = 350,
      trajectoryHeight        = 0.3,
      turret                  = true,
      weaponType              = [[MissileLauncher]],
      weaponVelocity          = 350,
    },

  },


  featureDefs       = {

    DEAD = {
      description      = [[Wreckage - Recon Commander]],
      blocking         = true,
      category         = [[corpses]],
      damage           = 2400,
      energy           = 0,
      featureDead      = [[HEAP]],
      featurereclamate = [[SMUDGE01]],
      footprintX       = 2,
      footprintZ       = 2,
      height           = [[20]],
      hitdensity       = [[100]],
      metal            = 960,
      object           = [[commrecon_dead.s3o]],
      reclaimable      = true,
      reclaimTime      = 960,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },


    HEAP = {
      description      = [[Debris - Recon Commander]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 2400,
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

return lowerkeys({ commrecon4 = unitDef })
