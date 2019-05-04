/// @description Insert description here
// You can write your code in this editor
if (run_obj.inAction)
{
if (hp == 0) instance_destroy();
if (instance_exists(player_obj))
	image_alpha = 1;
else
	image_alpha = 0.5;
speed = 1;
direction = random(360);
if (instance_exists(player_obj) && !player_obj.flDead && !player_obj.flMeet)
	if (x + sprite_width < 0) instance_destroy();
	else x -= 4 + run_obj.constSpeed/2;
else if (instance_exists(player_man_obj) && !player_man_obj.flDead && !player_man_obj.flMeet)
	if (x + sprite_width < 0) instance_destroy();
	else x -= 4 + run_obj.constSpeed/2;
	
}
else speed = 0;

/*
if (instance_exists(player_obj))
	draw_sprite(trap_spr, 0, x, y);
else
	draw_sprite_ext(trap_spr, 0, x, y, 1, 1, 0, c_white, 0.5);
	*/