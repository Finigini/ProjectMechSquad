/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if other.team != team and (other.airborne == airborne or other.canHitGround == true)
{
	event_inherited();

	scr_playSoundSpatial(emitter,sou_crawlerDamaged);
	with(instance_create_depth(x+8-random(16),y+8-random(16),-100,obj_greenblood))
	{
		direction = other.image_angle;
	}
}