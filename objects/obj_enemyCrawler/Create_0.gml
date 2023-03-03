/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();
scr_emitterSetup();

//unique stuff
team = "bug";
airborne = false;
wireframe = spr_crawlerWireframe;

//stats
maxHp = 30;
hp = maxHp;
moveSpeed = 1;

attackCD = 0;
attackSpeed = 60;
attackDamage = 3;

agroRange = 600;
target = noone;

facing = 0;
moving = false;