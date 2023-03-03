/// @description initialize
scr_emitterSetup();
depth = -10;
facingLegs = 0;
facingBody = 0;
shieldDirection = 0;
shieldFrame = 14;

//team
team = "none";

//visual
wireframe = spr_mechBasicWireframe;

//stats
bodyType = spr_mechFrameBasicBody;
legsType = spr_mechFrameBasicLegs;
weaponTypeLeft = spr_mechWeaponCannon;
weaponTypeRight = spr_mechWeaponCannon;
weaponFlashLeft = spr_mechWeaponCannonFlash;
weaponFlashRight = weaponFlashLeft;
movespeedBase = 1.2;
movespeed = 1.2;
turnspeedBase = 7;
turnspeed = 7;
targetingRange = 200;
maxHull = 100;
hull = maxHull;
maxShield = 25;
shield = maxShield;
weightCapacity = 12;
weightTotal = 10; //5 from each cannon

//orders
waypointsX = ds_list_create();
waypointsY = ds_list_create();
primaryTarget = noone;
//status
selected = false;
moving = false;
airborne = false;
weaponLeftCD = 0;
weaponRightCD = 0;
weaponEffectLeft = 0;
weaponEffectRight = 0;