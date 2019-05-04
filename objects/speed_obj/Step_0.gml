/// @description Insert description here
// You can write your code in this editor
if (hp == 0 || lives == 0) instance_destroy();
if (!audio_is_playing(sound_speed))
{
	audio_play_sound(sound_speed, 3, false);
}