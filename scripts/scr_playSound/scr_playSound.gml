// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playSound(soundID)
{
	audio_play_sound(soundID,10,false,obj_control.sfxVolume);
}