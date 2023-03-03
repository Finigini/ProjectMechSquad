// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_emitterSetup()
{
	emitter = audio_emitter_create();
	audio_emitter_position(emitter, x, y, 0);
	audio_falloff_set_model(audio_falloff_exponent_distance_clamped);
	audio_emitter_falloff(emitter,200,600,1);
}