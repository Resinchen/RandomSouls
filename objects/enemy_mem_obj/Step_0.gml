/// @description Insert description here
// You can write your code in this editor
if (run_obj.inAction)
{

if (hp <= 0) instance_destroy();
if (!flMeet)
{
	speed = 0.4;
	direction += random(30);
	if (instance_exists(player_obj) && !player_obj.flDead && !player_obj.flMeet)
		if (x + sprite_width < 0) instance_destroy();
		else x -= 4 + run_obj.constSpeed/2;
	else if (instance_exists(player_man_obj) && !player_man_obj.flDead && !player_man_obj.flMeet)
		if (x + sprite_width < 0) instance_destroy();
		else x -= 4 + run_obj.constSpeed/2;
}
else {
	speed = 0;
	--hp;
}

	
}
else speed = 0;