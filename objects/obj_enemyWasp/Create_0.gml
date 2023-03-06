/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();
scr_emitterSetup();

depth = -100;
//unique stuff
team = "bug";
airborne = true;
wireframe = spr_waspWireframe;

//stats
maxHp = 15;
hp = maxHp;
moveSpeed = 4;

attackCD = 0;
attackSpeed = 60;
attackDamage = 5;

agroRange = 400;
shootRange = 100;
target = noone;

facing = 0;
moving = false;