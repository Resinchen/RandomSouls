/// @description Insert description here
// You can write your code in this editor
if (run_obj.inAction)
{
	if (instance_exists(player_obj) && !player_obj.flDead && !player_obj.flMeet)
	{
		if (x + sprite_width <= 0) x += 1024+64+64;
		x -= 4 + run_obj.constSpeed/2;
	}
	else if (instance_exists(player_man_obj) && !player_man_obj.flDead && !player_man_obj.flMeet)
	{
		if (x + sprite_width <= 0) x += 1024+64+64;
		x -= 4 + run_obj.constSpeed/2;
	}
}