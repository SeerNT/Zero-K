unitDef = {
  unitname               = [[armrectr]],
  name                   = [[Rector]],
  description            = [[Cloaking Construction Bot, Builds at 6 m/s]],
  acceleration           = 0.24,
  activateWhenBuilt      = true,
  brakeRate              = 0.5,
  buildCostEnergy        = 140,
  buildCostMetal         = 140,
  buildDistance          = 90,
  builder                = true,

  buildoptions           = {
  },

  buildPic               = [[ARMRECTR.png]],
  buildTime              = 140,
  canAssist              = true,
  canBuild               = true,
  canMove                = true,
  canPatrol              = true,
  canstop                = [[1]],
  category               = [[LAND UNARMED]],
  cloakCost              = 0.1,
  cloakCostMoving        = 0.5,
  collisionVolumeOffsets = [[0 0 0]],
  collisionVolumeScales  = [[34 51 34]],
  collisionVolumeTest    = 1,
  collisionVolumeType    = [[ellipsoid]],
  corpse                 = [[DEAD]],

  customParams           = {
    description_bp = [[Robô de contru??o e captura, constrói a 6 m/s]],
    description_de = [[Getarnter Konstruktionsroboter, Baut mit 6 M/s]],
    description_es = [[Robot de Construccion/Captura, Construye a 6 m/s]],
    description_fi = [[Rakentaja/kaappaajarobotti, rakentaa 6m/s  nopeudella]],
    description_fr = [[Robot de Construction/Capture, Construit ? 6 m/s]],
    description_it = [[Robot da Costruzzione/Cattura, Costruisce a 6 m/s]],
    helptext       = [[The Rector packs a short-ranged jammer and a cloaking device for stealthy expansion and base maintenance.]],
    helptext_bp    = [[]],
    helptext_de    = [[Der Rector besitzt einen Störsender mit kurzer Reichweite und ein Tarngerät, um geheim und unerkannt expandieren zu können.]],
    helptext_fi    = [[Pystyy rakentamisen lis?ksi kaappaamaan yksik?t koodaamalla ne nurin.]],
    helptext_fr    = [[]],
  },

  energyMake             = 0.15,
  explodeAs              = [[BIG_UNITEX]],
  footprintX             = 2,
  footprintZ             = 2,
  iconType               = [[builder]],
  idleAutoHeal           = 5,
  idleTime               = 1800,
  mass                   = 123,
  maxDamage              = 450,
  maxSlope               = 36,
  maxVelocity            = 1.9,
  maxWaterDepth          = 22,
  metalMake              = 0.15,
  minCloakDistance       = 75,
  movementClass          = [[KBOT2]],
  noAutoFire             = false,
  noChaseCategory        = [[TERRAFORM SATELLITE FIXEDWING GUNSHIP HOVER SHIP SWIM SUB LAND FLOAT SINK]],
  objectName             = [[spherecon.s3o]],
  radarDistanceJam       = 256,
  repairSpeed            = 7.2,
  resurrect              = [[1]],
  seismicSignature       = 4,
  selfDestructAs         = [[BIG_UNITEX]],
  showNanoSpray          = false,
  side                   = [[ARM]],
  sightDistance          = 375,
  smoothAnim             = true,
  TEDClass               = [[KBOT]],
  terraformSpeed         = 300,
  turninplace            = 0,
  turnRate               = 1122,
  upright                = true,
  workerTime             = 6,

  featureDefs            = {

    DEAD  = {
      description      = [[Wreckage - Rector]],
      blocking         = true,
      category         = [[corpses]],
      damage           = 760,
      energy           = 0,
      featureDead      = [[DEAD2]],
      featurereclamate = [[SMUDGE01]],
      footprintX       = 2,
      footprintZ       = 2,
      height           = [[40]],
      hitdensity       = [[100]],
      metal            = 48,
      object           = [[spherejeth_dead.s3o]],
      reclaimable      = true,
      reclaimTime      = 48,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },


    DEAD2 = {
      description      = [[Debris - Rector]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 760,
      energy           = 0,
      featureDead      = [[HEAP]],
      featurereclamate = [[SMUDGE01]],
      footprintX       = 2,
      footprintZ       = 2,
      height           = [[4]],
      hitdensity       = [[100]],
      metal            = 48,
      object           = [[debris2x2c.s3o]],
      reclaimable      = true,
      reclaimTime      = 48,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },


    HEAP  = {
      description      = [[Debris - Rector]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 760,
      energy           = 0,
      featurereclamate = [[SMUDGE01]],
      footprintX       = 2,
      footprintZ       = 2,
      height           = [[4]],
      hitdensity       = [[100]],
      metal            = 24,
      object           = [[debris2x2c.s3o]],
      reclaimable      = true,
      reclaimTime      = 24,
      seqnamereclamate = [[TREE1RECLAMATE]],
      world            = [[All Worlds]],
    },

  },

}

return lowerkeys({ armrectr = unitDef })
