unitDef = {
  unitname          = [[armtboat]],
  name              = [[Surfboard]],
  description       = [[Transport Platform]],
  acceleration      = 0.102,
  brakeRate         = 0.115,
  buildAngle        = 16384,
  buildCostEnergy   = 220,
  buildCostMetal    = 220,
  builder           = false,
  buildPic          = [[armtboat.png]],
  buildTime         = 220,
  canAttack         = false,
  canGuard          = true,
  canload           = [[1]],
  canMove           = true,
  canPatrol         = true,
  canstop           = [[1]],
  category          = [[SHIP UNARMED]],
  corpse            = [[DEAD]],

  customParams      = {
    description_fr = [[Barge de Transport]],
    helptext       = [[The Surfboard serves as a naval transport and firing platform--that is, any unit on the Surfboard can fire off of it.]],
    helptext_fr    = [[Le Surfboard est un navire de transport et une plateforme de tir, il peut donc transporter des unit?s sans les emp?cher de tirer.]],
  },

  explodeAs         = [[BIG_UNITEX]],
  floater           = true,
  footprintX        = 4,
  footprintZ        = 4,
  holdSteady        = true,
  iconType          = [[shiptransport]],
  idleAutoHeal      = 5,
  idleTime          = 1800,
  isFirePlatform    = true,
  mass              = 175,
  maxDamage         = 1101,
  maxVelocity       = 3.54,
  minCloakDistance  = 75,
  minWaterDepth     = 10,
  movementClass     = [[BOAT4]],
  noAutoFire        = false,
  noChaseCategory   = [[TERRAFORM SATELLITE FIXEDWING GUNSHIP HOVER SHIP SWIM SUB LAND FLOAT SINK]],
  objectName        = [[ARMTBOAT]],
  seismicSignature  = 4,
  selfDestructAs    = [[BIG_UNITEX]],
  side              = [[ARM]],
  sightDistance     = 325,
  smoothAnim        = true,
  TEDClass          = [[SHIP]],
  transportByEnemy  = false,
  transportCapacity = 1,
  transportenemy    = [[0]],
  transportSize     = 3,
  turnRate          = 539,
  workerTime        = 0,

  featureDefs       = {

    DEAD  = {
      description      = [[Wreckage - Surfboard]],
      blocking         = false,
      category         = [[corpses]],
      damage           = 1101,
      energy           = 0,
      featureDead      = [[DEAD2]],
      footprintX       = 3,
      footprintZ       = 3,
      height           = [[4]],
      hitdensity       = [[100]],
      metal            = 88,
      object           = [[wreck3x3a.s3o]],
      reclaimable      = true,
      reclaimTime      = 88,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },


    DEAD2 = {
      description      = [[Debris - Surfboard]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 1101,
      energy           = 0,
      featureDead      = [[HEAP]],
      featurereclamate = [[SMUDGE01]],
      footprintX       = 3,
      footprintZ       = 3,
      hitdensity       = [[100]],
      metal            = 88,
      object           = [[debris3x3a.s3o]],
      reclaimable      = true,
      reclaimTime      = 88,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },


    HEAP  = {
      description      = [[Debris - Surfboard]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 1101,
      energy           = 0,
      featurereclamate = [[SMUDGE01]],
      footprintX       = 3,
      footprintZ       = 3,
      hitdensity       = [[100]],
      metal            = 44,
      object           = [[debris3x3a.s3o]],
      reclaimable      = true,
      reclaimTime      = 44,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },

  },

}

return lowerkeys({ armtboat = unitDef })
