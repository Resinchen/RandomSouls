/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(ord("P")) && room == game_rm) {
	inAction = !inAction;
	pause_count += 1;	
}

if (keyboard_check_pressed(ord("O")) && room == game_rm && !inAction && !help)
{
	help = true;
}
else if (keyboard_check_pressed(ord("O"))) help = false;

if (inAction && scoring)
{
	help = false;
	if (gameTimer == 0)
	{
		gameTimer = constTimer;
		++score;
	}
	else --gameTimer;
	if (spiritHp > constHp) spiritHp = constHp;
	if (instance_exists(player_obj) && player_obj.keyShift) constSpeed = -2;
	else constSpeed = score/100 - 1;
}

if (body_count >= 10 && tim >= 0 && !global.achiv_eater_bodies && room == game_rm) {
	if (instance_number(oBox) < 1) {
		alarm[1] = 150;
		alarm[2] = 150;
		instance_create_depth(room_width - 210, 35, -1010, oBox)
		with(oBox) {
			TEXT = "EATER BODIES!!!";
		}
		tim -= 1;
	}
}

if (lives >= 9 && tim >= 0 && !global.achiv_cat_in_pc && room == game_rm) {
	if (instance_number(oBox) < 1) {
		alarm[1] = 150;
		alarm[3] = 150;
		instance_create_depth(room_width - 210, 35, -1010, oBox)
		with(oBox) {
			TEXT = "Cat at the pc";
		}
		tim -= 1;
	}
}

if (score >= 600 && tim >= 0 && !global.achiv_worker && room == game_rm) {
	if (instance_number(oBox) < 1) {
		alarm[1] = 150;
		alarm[4] = 150;
		instance_create_depth(room_width - 210, 35, -1010, oBox)
		with(oBox) {
			TEXT = "Scoreman!";
		}
		tim -= 1;
	}
}

if ( pause_count >= 6 && tim >= 0 && !global.achiv_busy_man && room == game_rm) {
	if (instance_number(oBox) < 1) {
		alarm[1] = 150;
		alarm[5] = 150;
		instance_create_depth(room_width - 210, 35, -1010, oBox)
		with(oBox) {
			TEXT = "Busy Man!";
		}
		tim -= 1;
	}
}

if (pentagramm_count >= 5 && tim >= 0 && !global.achiv_etis_atis_animatis && room == game_rm) {
	if (instance_number(oBox) < 1) {
		alarm[1] = 150;
		alarm[7] = 150;
		instance_create_depth(room_width - 210, 35, -1010, oBox)
		with(oBox) {
			TEXT = "Etis atis Animatis...";
		}
		tim -= 1;
	}
}

