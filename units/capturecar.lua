unitDef = {
  unitname         = [[capturecar]],
  name             = [[Dominatrix]],
  description      = [[Capture Vehicle]],
  acceleration     = 0.0444,
  brakeRate        = 0.0385,
  buildCostEnergy  = 420,
  buildCostMetal   = 420,
  builder          = false,
  buildPic         = [[capturecar.png]],
  buildTime        = 420,
  canAttack        = false,
  canGuard         = true,
  canMove          = true,
  canPatrol        = true,
  canstop          = [[1]],
  category         = [[LAND UNARMED]],
  corpse           = [[DEAD]],

  customParams     = {
    helptext = [[The Dominatrix captures enemies, turning then against their former allies. Multiple Dominatrix can capture a single target faster, although only one becomes the controller. After taking control of a unit the Dominatrix cannot fire for 5 seconds. If a Dominatrix is destroyed all units it controls are freed.]],
  },

  energyUse        = 1.5,
  explodeAs        = [[BIG_UNITEX]],
  footprintX       = 3,
  footprintZ       = 3,
  iconType         = [[vehiclespecial]],
  idleAutoHeal     = 5,
  idleTime         = 1800,
  leaveTracks      = true,
  mass             = 205,
  maxDamage        = 820,
  maxSlope         = 18,
  maxVelocity      = 2,
  maxWaterDepth    = 22,
  minCloakDistance = 75,
  movementClass    = [[TANK3]],
  moveState        = 0,
  noAutoFire       = false,
  noChaseCategory  = [[TERRAFORM SATELLITE FIXEDWING GUNSHIP]],
  objectName       = [[corvrad_big.s3o]],
  radarDistance    = 1200,
  script           = [[capturecar.lua]],
  seismicSignature = 4,
  selfDestructAs   = [[BIG_UNITEX]],
  side             = [[CORE]],
  sightDistance    = 550,
  smoothAnim       = true,
  TEDClass         = [[TANK]],
  trackOffset      = -7,
  trackStrength    = 5,
  trackStretch     = 1,
  trackType        = [[StdTank]],
  trackWidth       = 26,
  turninplace      = 0,
  turnRate         = 416,
  workerTime       = 0,

  weapons          = {

    {
      def                = [[CAPTURERAY]],
      badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING LAND SINK SHIP SWIM FLOAT GUNSHIP HOVER]],
    },

  },


  weaponDefs       = {

    CAPTURERAY = {
      name                    = [[Capture Ray]],
      areaOfEffect            = 8,
      beamdecay               = 0.9,
      beamTime                = 0.1,
      beamttl                 = 1,
      coreThickness           = 0,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
        default = -0.001,
        planes  = -0.001,
        subs    = -0.001,
      },

      explosionGenerator      = [[custom:NONE]],
      fireStarter             = 30,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 0,
      largeBeamLaser          = true,
      laserFlareSize          = 0,
      lineOfSight             = true,
      minIntensity            = 1,
      noSelfDamage            = true,
      range                   = 450,
      reloadtime              = 0.1,
      renderType              = 0,
      rgbColor                = [[0 0.8 0.2]],
      scrollSpeed             = 2,
      soundStart              = [[weapon/laser/pulse_laser2]],
      soundStartVolume        = 0.5,
      soundTrigger            = true,
      sweepfire               = false,
      targetMoveError         = 0,
      texture1                = [[dosray]],
      texture2                = [[flare]],
      texture3                = [[flare]],
      texture4                = [[smallflare]],
      thickness               = 4.2,
      tolerance               = 5000,
      turret                  = true,
      weaponType              = [[BeamLaser]],
      weaponVelocity          = 500,
    },

  },


  featureDefs      = {

    DEAD = {
      description      = [[Wreckage - Dreamweaver]],
      blocking         = true,
      category         = [[corpses]],
      damage           = 720,
      energy           = 0,
      featureDead      = [[HEAP]],
      featurereclamate = [[SMUDGE01]],
      footprintX       = 2,
      footprintZ       = 2,
      height           = [[20]],
      hitdensity       = [[100]],
      metal            = 168,
      object           = [[corvrad_big_dead.s3o]],
      reclaimable      = true,
      reclaimTime      = 168,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },


    HEAP = {
      description      = [[Debris - Dreamweaver]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 720,
      energy           = 0,
      featurereclamate = [[SMUDGE01]],
      footprintX       = 2,
      footprintZ       = 2,
      height           = [[4]],
      hitdensity       = [[100]],
      metal            = 84,
      object           = [[debris2x2c.s3o]],
      reclaimable      = true,
      reclaimTime      = 84,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },

  },

}

return lowerkeys({ capturecar = unitDef })
