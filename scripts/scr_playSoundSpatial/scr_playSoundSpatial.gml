// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playSoundSpatial(emitter,soundID)
{
	audio_play_sound_on(emitter,soundID, false,10 ,obj_control.sfxVolume);
}