/// @description Insert description here
// You can write your code in this editor






// Inherit the parent event
event_inherited();

if other.team != team and (other.airborne == airborne or other.canHitGround == true)
{
	audio_sound_pitch(sou_mechDamaged,choose(1,1.1,0.9));
	scr_playSoundSpatial(emitter,sou_mechDamaged);
}