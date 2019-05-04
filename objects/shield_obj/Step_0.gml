/// @description Insert description here
// You can write your code in this editor
if (hp == 0) instance_destroy();
if (!audio_is_playing(sound_shield))
{
	audio_play_sound(sound_shield, 3, false);
}