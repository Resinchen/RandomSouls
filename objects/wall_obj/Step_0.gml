/// @description Insert description here
// You can write your code in this editor
if (run_obj.inAction)
{
if (hp == 0) instance_destroy();
if (instance_exists(player_man_obj))
{
	if (place_meeting(x, y, enemy_obj) || place_meeting(x, y, trap_obj)) 
		image_alpha = 0.6;
	else image_alpha = 1;
}
else image_alpha = 0.5;
if (instance_exists(player_obj) && !player_obj.flDead && !player_obj.flMeet)
	if (x + sprite_width < 0) instance_destroy();
	else x -= 4 + run_obj.constSpeed/2;
else if (instance_exists(player_man_obj) && !player_man_obj.flDead && !player_man_obj.flMeet)
	if (x + sprite_width < 0) instance_destroy();
	else x -= 4 + run_obj.constSpeed/2;

	
}

/*
if (instance_exists(player_man_obj))
{
	if (place_meeting(x, y, enemy_obj) || place_meeting(x, y, trap_obj)) 
		draw_sprite_ext(wall_new_spr, 0, x, y, 1, 1, 0, c_white, 0.6);
	else draw_sprite(wall_new_spr, 0, x, y);
}
else
	draw_sprite_ext(wall_new_spr, 0, x, y, 1, 1, 0, c_white, 0.5);
	*/