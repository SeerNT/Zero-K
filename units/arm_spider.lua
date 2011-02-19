unitDef = {
  unitname               = [[arm_spider]],
  name                   = [[Weaver]],
  description            = [[Construction Spider, Builds at 9 m/s]],
  acceleration           = 0.15,
  brakeRate              = 0.16,
  buildCostEnergy        = 200,
  buildCostMetal         = 200,
  buildDistance          = 120,
  builder                = true,

  buildoptions           = {
  },

  buildPic               = [[arm_spider.png]],
  buildTime              = 200,
  canAttack              = false,
  canGuard               = true,
  canMove                = true,
  canPatrol              = true,
  canstop                = [[1]],
  category               = [[LAND UNARMED]],
  collisionVolumeOffsets = [[0 0 0]],
  collisionVolumeScales  = [[40 30 40]],
  collisionVolumeTest    = 1,
  collisionVolumeType    = [[ellipsoid]],
  corpse                 = [[DEAD]],

  customParams           = {
    description_bp = [[Aranha e de construç?o, Constrói a 6 m/s]],
    description_de = [[Konstruktionsspinne, Baut mit 6 M/s]],
    description_es = [[Ara?a de construcción, construye a 6 m/s]],
    description_fi = [[Rakentaja/kaikuluotainkiipeilij?, rakentaa 6m/s nopeudella]],
    description_fr = [[Araign?e de Construction, Construit ? 6 m/s]],
    description_it = [[Ragno do costruzione occultante, costruisce a 6 m/s]],
    description_pl = [[Paj?k konstruktor, buduje z pr?dko?ci? 6m/s]],
    helptext       = [[The Weaver is a constructor that can climb over any obstacle and build defenses on high ground.]],
    helptext_bp    = [[Weaver é o construtor escalador camuflável de NOVA. Pode subir qualquer obstáculo, mas constrói mais devagar que construtores normais.]],
    helptext_de    = [[Der Weaver ist eine bauende Einheit, die Hindernisse überwinden und somit Verteidigungsanlagen auf Erhöhungen bauen kann.]],
    helptext_es    = [[El Weaver es el constructor que puede treparse sobre qualquier obstáculo y construir defensas en terreno alto]],
    helptext_fi    = [[Weaver pystyy liikkumaan vaikeakulkuisimmassakin maastossa ja rakentamaan vaivatta my?s useimmille muille rakentajille saavuttamattomiin paikkoihin.]],
    helptext_fr    = [[Le weaver est un robot de construction tout terrain qui peut batir des d?fenses en terrain ?lev?.]],
    helptext_it    = [[Il Weaver é un costruttore che puo arrampicarsi su qualunque ostacolo e costruire difese nel terreno alto]],
    helptext_pl    = [[Weaver jest konstruktorem mog?cym wspina? si? po ka?dej powierzchni oraz posiadaj?cym mo?liwo?? maskowania si?]],
  },

  energyMake             = 0.15,
  energyUse              = 0,
  explodeAs              = [[BIG_UNITEX]],
  footprintX             = 3,
  footprintZ             = 3,
  iconType               = [[builder]],
  mass                   = 155,
  maxDamage              = 750,
  maxSlope               = 72,
  maxVelocity            = 1.8,
  maxWaterDepth          = 22,
  metalMake              = 0.15,
  minCloakDistance       = 75,
  movementClass          = [[TKBOT3]],
  noAutoFire             = false,
  noChaseCategory        = [[TERRAFORM SATELLITE FIXEDWING GUNSHIP HOVER SHIP SWIM SUB LAND FLOAT SINK]],
  objectName             = [[ARMMLSPD]],
  seismicSignature       = 16,
  selfDestructAs         = [[BIG_UNITEX]],
  showNanoSpray          = false,
  side                   = [[ARM]],
  sightDistance          = 295,
  smoothAnim             = true,
  TEDClass               = [[CNSTR]],
  terraformSpeed         = 450,
  threed                 = [[1]],
  turninplace            = 0,
  turnRate               = 1025,
  workerTime             = 9,
  zbuffer                = [[1]],

  featureDefs            = {

    DEAD  = {
      description      = [[Wreckage - Weaver]],
      blocking         = true,
      category         = [[arm_corpses]],
      damage           = 850,
      featureDead      = [[DEAD2]],
      featurereclamate = [[smudge01]],
      footprintX       = 3,
      footprintZ       = 3,
      height           = [[40]],
      hitdensity       = [[100]],
      metal            = 92,
      object           = [[ARMMLSPD_dead]],
      reclaimable      = true,
      reclaimTime      = 92,
      seqnamereclamate = [[tree1reclamate]],
      world            = [[All Worlds]],
    },


    DEAD2 = {
      description      = [[Debris - Weaver]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 850,
      featureDead      = [[HEAP]],
      featurereclamate = [[smudge01]],
      footprintX       = 3,
      footprintZ       = 3,
      height           = [[4]],
      hitdensity       = [[100]],
      metal            = 92,
      object           = [[debris3x3b.s3o]],
      reclaimable      = true,
      reclaimTime      = 92,
      seqnamereclamate = [[tree1reclamate]],
      world            = [[All Worlds]],
    },


    HEAP  = {
      description      = [[Debris - Weaver]],
      blocking         = false,
      category         = [[heaps]],
      damage           = 850,
      featurereclamate = [[smudge01]],
      footprintX       = 3,
      footprintZ       = 3,
      height           = [[4]],
      hitdensity       = [[100]],
      metal            = 46,
      object           = [[debris3x3b.s3o]],
      reclaimable      = true,
      reclaimTime      = 46,
      seqnamereclamate = [[tree1reclamate]],
      world            = [[All Worlds]],
    },

  },

}

return lowerkeys({ arm_spider = unitDef })
