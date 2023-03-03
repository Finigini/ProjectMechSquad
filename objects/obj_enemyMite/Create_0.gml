/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();
scr_emitterSetup();

//unique stuff
team = "bug";
airborne = false;
wireframe = spr_crawlerWireframe;
lunge = 33;

//stats
maxHp = 5;
hp = maxHp;
moveSpeed = 4;

attackCD = 0;
attackSpeed = 60;
attackDamage = 1;

agroRange = 400;
target = noone;

facing = 0;
moving = false;