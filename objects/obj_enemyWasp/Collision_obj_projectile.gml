/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if other.team != team and other.airborne == airborne
{
with(instance_create_depth(x+8-random(16),y+8-random(16),-100,obj_greenblood))
{
	direction = other.image_angle;
}
}