/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_tab)) {
	switch(room) {
	case menu_rm:
		room_goto(journal_rm);
	break;
	
	case journal_rm:
		room_goto(menu_rm);
	break;
	}
}

if (keyboard_check_pressed(vk_enter)) {
	switch(room) {
		case menu_rm:
			room_goto(game_rm);
		break;

		case gameover_rm:
			room_goto(game_rm);
		break;
	}
}
if (keyboard_check_pressed(vk_escape)) {
	switch(room) {
		case menu_rm:
			game_end();
			break;
		case howtoplay_rm:
			room_goto(menu_rm);
			break;
		case journal_rm:
			room_goto(menu_rm);
			break;
		case note1_rm:
			room_goto(journal_rm);
			break;
		case note2_rm:
			room_goto(journal_rm);
			break;
		case note3_rm:
			room_goto(journal_rm);
			break;
		case note4_rm:
			room_goto(journal_rm);
			break;
		case note5_rm:
			room_goto(journal_rm);
			break;
		case note6_rm:
			room_goto(journal_rm);
			break;
		case note7_rm:
			room_goto(journal_rm);
			break;
		case note8_rm:
			room_goto(journal_rm);
			break;
		case note9_rm:
			room_goto(journal_rm);
			break;
		case note10_rm:
			room_goto(journal_rm);
			break;
		case note11_rm:
			room_goto(journal_rm);
			break;
		case customize_rm:
			room_goto(menu_rm);
			break;
		case modes_rm:
			room_goto(menu_rm);
			break;
		case game_rm:
			audio_stop_sound(sound_game);
			room_goto(menu_rm);
			break;
		case gameover_rm:
			room_goto(menu_rm);
			break;
	}
}

if (mouse_check_button_released(mb_left))
{
	switch(room) {
		case note1_rm:
			room_goto(journal_rm);
			break;
		case note2_rm:
			room_goto(journal_rm);
			break;
		case note3_rm:
			room_goto(journal_rm);
			break;
		case note4_rm:
			room_goto(journal_rm);
			break;
		case note5_rm:
			room_goto(journal_rm);
			break;
		case note6_rm:
			room_goto(journal_rm);
			break;
		case note7_rm:
			room_goto(journal_rm);
			break;
		case note8_rm:
			room_goto(journal_rm);
			break;
		case note9_rm:
			room_goto(journal_rm);
			break;
		case note10_rm:
			room_goto(journal_rm);
			break;
		case note11_rm:
			room_goto(journal_rm);
			break;
	}
}


if (room == menu_rm)
{
	/*
	if (!audio_is_playing(sound_menu))
	{
		audio_stop_all();
		audio_play_sound(sound_menu, 2, true);
	}
	*/
	if (mouse_check_button_pressed(mb_left))
	{
		if (mouse_x >= room_width/2-96 && mouse_x <= room_width/2+96 && mouse_y >= 100 && mouse_y <= 164)
			flBegin = true;
		if (mouse_x >= room_width/2-96 && mouse_x <= room_width/2+96 && mouse_y >= 200 && mouse_y <= 264)
			flLearn = true;
		if (mouse_x >= room_width/2-96 && mouse_x <= room_width/2+96 && mouse_y >= 300 && mouse_y <= 364)
			flJournal = true;
		if (mouse_x >= room_width/2-96 && mouse_x <= room_width/2+96 && mouse_y >= 400 && mouse_y <= 464)
			flCustom = true;
		if (mouse_x >= room_width/2-96 && mouse_x <= room_width/2+96 && mouse_y >= 500 && mouse_y <= 564)
			flModes = true;
		if (mouse_x >= room_width/2-96 && mouse_x <= room_width/2+96 && mouse_y >= 600 && mouse_y <= 664)
			flExit = true;
	}
	if (mouse_check_button_released(mb_left))
	{
		if (flBegin && mouse_x >= room_width/2-96 && mouse_x <= room_width/2+96 && mouse_y >= 100 && mouse_y <= 164)
		{
			audio_stop_all();
			audio_play_sound(sound_game, 2, true);
			room_goto(game_rm);
		}
		else if (flLearn && mouse_x >= room_width/2-96 && mouse_x <= room_width/2+96 && mouse_y >= 200 && mouse_y <= 264)
		{
			room_goto(howtoplay_rm);
		}
		else if (flJournal && mouse_x >= room_width/2-96 && mouse_x <= room_width/2+96 && mouse_y >= 300 && mouse_y <= 364)
		{
			flJournal = false;
			room_goto(journal_rm);
		}
		else if (flCustom && mouse_x >= room_width/2-96 && mouse_x <= room_width/2+96 && mouse_y >= 400 && mouse_y <= 464)
		{
			flCustom = false;
			room_goto(customize_rm);
		}
		else if (flModes && mouse_x >= room_width/2-96 && mouse_x <= room_width/2+96 && mouse_y >= 500 && mouse_y <= 564)
		{
			flModes = false;
			room_goto(modes_rm);
		}
		else if (flExit && mouse_x >= room_width/2-96 && mouse_x <= room_width/2+96 && mouse_y >= 600 && mouse_y <= 664)
		{
			game_end();
		}
		else
		{
			flBegin = false;
			flExit = false;
			flCustom = false;
			flLearn = false;
			flModes = false;
			flJournal = false;
		}
	}
}

if (room == journal_rm)
{
	if (mouse_check_button_pressed(mb_left))
	{
		if (mouse_x >= room_width/4-100 && mouse_x <= room_width/4+100 && mouse_y >= 100 && mouse_y <= 164)
			flToMenu = true;
		if (run_obj.note1 && mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 100 && mouse_y <= 164)
			flNote1 = true;
		if (run_obj.note2 && mouse_x >= 3*room_width/4-100 && mouse_x <= 3*room_width/4+100 && mouse_y >= 100 && mouse_y <= 164)
			flNote2 = true;
		if (run_obj.note3 && mouse_x >= room_width/4-100 && mouse_x <= room_width/4+100 && mouse_y >= 200 && mouse_y <= 264)
			flNote3 = true;
		if (run_obj.note4 && mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 200 && mouse_y <= 264)
			flNote4 = true;
		if (run_obj.note5 && mouse_x >= 3*room_width/4-100 && mouse_x <= 3*room_width/4+100 && mouse_y >= 200 && mouse_y <= 264)
			flNote5 = true;
		if (run_obj.note6 && mouse_x >= room_width/4-100 && mouse_x <= room_width/4+100 && mouse_y >= 300 && mouse_y <= 364)
			flNote6 = true;
		if (run_obj.note7 && mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 300 && mouse_y <= 364)
			flNote7 = true;
		if (run_obj.note8 && mouse_x >= 3*room_width/4-100 && mouse_x <= 3*room_width/4+100 && mouse_y >= 300 && mouse_y <= 364)
			flNote8 = true;
		if (run_obj.note9 && mouse_x >= room_width/4-100 && mouse_x <= room_width/4+100 && mouse_y >= 400 && mouse_y <= 464)
			flNote9 = true;
		if (run_obj.note10 && mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 400 && mouse_y <= 464)
			flNote10 = true;
		if (run_obj.note11 && mouse_x >= 3*room_width/4-100 && mouse_x <= 3*room_width/4+100 && mouse_y >= 400 && mouse_y <= 464)
			flNote11 = true;
	}
	if (mouse_check_button_released(mb_left))
	{
		if (flToMenu && mouse_x >= room_width/4-100 && mouse_x <= room_width/4+100 && mouse_y >= 100 && mouse_y <= 164)
		{
			flToMenu = false;
			room_goto(menu_rm);
		}
		else if (flNote1 && mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 100 && mouse_y <= 164)
		{
			flNote1 = false;
			room_goto(note1_rm);
		}
		if (flNote2 && mouse_x >= 3*room_width/4-100 && mouse_x <= 3*room_width/4+100 && mouse_y >= 100 && mouse_y <= 164)
		{
			flNote2 = false;
			room_goto(note2_rm);
		}
		if (flNote3 && mouse_x >= room_width/4-100 && mouse_x <= room_width/4+100 && mouse_y >= 200 && mouse_y <= 264)
		{
			flNote3 = false;
			room_goto(note3_rm);
		}
		if (flNote4 && mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 200 && mouse_y <= 264)
		{
			flNote4 = false;
			room_goto(note4_rm);
		}
		if (flNote5 && mouse_x >= 3*room_width/4-100 && mouse_x <= 3*room_width/4+100 && mouse_y >= 200 && mouse_y <= 264)
		{
			flNote5 = false;
			room_goto(note5_rm);
		}
		if (flNote6 && mouse_x >= room_width/4-100 && mouse_x <= room_width/4+100 && mouse_y >= 300 && mouse_y <= 364)
		{
			flNote6 = false;
			room_goto(note6_rm);
		}
		if (flNote7 && mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 300 && mouse_y <= 364)
		{
			flNote7 = false;
			room_goto(note7_rm);
		}
		if (flNote8 && mouse_x >= 3*room_width/4-100 && mouse_x <= 3*room_width/4+100 && mouse_y >= 300 && mouse_y <= 364)
		{
			flNote8 = false;
			room_goto(note8_rm);
		}
		if (flNote9 && mouse_x >= room_width/4-100 && mouse_x <= room_width/4+100 && mouse_y >= 400 && mouse_y <= 464)
		{
			flNote9 = false;
			room_goto(note9_rm);
		}
		if (flNote10 && mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 400 && mouse_y <= 464)
		{
			flNote10 = false;
			room_goto(note10_rm);
		}
		if (flNote11 && mouse_x >= 3*room_width/4-100 && mouse_x <= 3*room_width/4+100 && mouse_y >= 400 && mouse_y <= 464)
		{
			flNote11 = false;
			room_goto(note11_rm);
		}
	}
}

if (room == customize_rm)
{
	if (mouse_check_button_pressed(mb_left))
	{
		if (mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 100 && mouse_y <= 164)
			flOriginal = true;
		if (mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 200 && mouse_y <= 264)
			flClassic = true;
		if (mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 300 && mouse_y <= 364)
			flNecro = true;
	}
	if (mouse_check_button_released(mb_left))
	{
		if (flOriginal && mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 100 && mouse_y <= 164)
		{
			run_obj.pl_spr_right = player_spr_right;
			run_obj.pl_spr_left = player_spr_left;
			run_obj.pl_man_spr_right = player_man_spr_right;
			run_obj.pl_man_spr_left = player_man_spr_left;
			run_obj.en_spr_left = enemy_spr_left;
			run_obj.en_mem_spr_left = enemy_mem_spr_left;
			room_goto(menu_rm);
		}
		else if (flClassic && run_obj.highscore >= 300 && mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 200 && mouse_y <= 264)
		{
			run_obj.pl_spr_right = player_spr_right_classic;
			run_obj.pl_spr_left = player_spr_left_classic;
			run_obj.pl_man_spr_right = player_man_spr_right_classic;
			run_obj.pl_man_spr_left = player_man_spr_left_classic;
			run_obj.en_spr_left = enemy_spr_left_violet;
			run_obj.en_mem_spr_left = enemy_mem_spr_left_violet;
			room_goto(menu_rm);
		}
		else if (flNecro && run_obj.highscore >= 600 && mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 300 && mouse_y <= 364)
		{
			run_obj.pl_spr_right = player_spr_right_necro;
			run_obj.pl_spr_left = player_spr_left_necro;
			run_obj.pl_man_spr_right = player_man_spr_right_necro;
			run_obj.pl_man_spr_left = player_man_spr_left_necro;
			run_obj.en_spr_left = enemy_spr_left_violet;
			run_obj.en_mem_spr_left = enemy_mem_spr_left_violet;
			room_goto(menu_rm);
		}
		else
		{
			flOriginal = false;
			flClassic = false;
			flNecro = false;
		}
	}
}

if (room == modes_rm)
{
	if (mouse_check_button_pressed(mb_left))
	{
		if (mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 100 && mouse_y <= 164)
			flOriginalMode = true;
		if (mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 200 && mouse_y <= 264)
			flClassicMode = true;
	}
	if (mouse_check_button_released(mb_left))
	{
		if (flOriginalMode && mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 100 && mouse_y <= 164)
		{
			run_obj.flr_spr = floor_spr;
			run_obj.wll_spr = wall_spr;
			run_obj.tr_spr = trap_spr;
			room_goto(menu_rm);
		}
		else if (flClassicMode && run_obj.highscore >= 200 && mouse_x >= room_width/2-100 && mouse_x <= room_width/2+100 && mouse_y >= 200 && mouse_y <= 264)
		{
			run_obj.flr_spr = floor_spr_new;
			run_obj.wll_spr = wall_spr_new;
			run_obj.tr_spr = trap_spr_new;
			room_goto(menu_rm);
		}
		else
		{
			flOriginalMode = false;
			flClassicMode = false;
		}
	}
}

if (room == howtoplay_rm)
{
	if (!run_obj.inAction)
	{
		if (keyboard_check_pressed(vk_anykey))
		{
			if (run_obj.flLearnEnd) 
			{
				run_obj.flLearnEnd = false;
				run_obj.flBegin = true;
				room_goto(menu_rm);
			}
			if (run_obj.success)
			{
				if (keyboard_check_pressed(ord("R")))
				{
					run_obj.success = false;
					room_restart();
				}	
				else if (keyboard_check_pressed(vk_enter))
				{
					run_obj.success = false;
					if (run_obj.flBegin)
					{
						run_obj.flBegin = false;
						run_obj.flEnemy = true;
					}
					else if (run_obj.flEnemy)
					{
						run_obj.flEnemy = false;
						run_obj.flBodyWall = true;
					}
					else if (run_obj.flBodyWall)
					{
						run_obj.flBodyWall = false;
						run_obj.flBodyShift = true;
					}
					else if (run_obj.flBodyShift)
					{
						run_obj.flBodyShift = false;
						run_obj.flBodySpace = true;
					}
					else if (run_obj.flBodySpace)
					{
						run_obj.flBodySpace = false;
						run_obj.flSoulShift = true;
					}
					else if (run_obj.flSoulShift)
					{
						run_obj.flSoulShift = false;
						run_obj.flSoulSpace = true;
					}
					else if (run_obj.flSoulSpace)
					{
						run_obj.flSoulSpace = false;
						run_obj.flMemEnemy = true;
						//run_obj.flLearnEnd = true;
					}
					
					else if (run_obj.flMemEnemy)
					{
						run_obj.flMemEnemy = false;
						run_obj.flLearnEnd = true;
					}
					room_restart();
				}
			}
			else run_obj.inAction = true;
		}
	}
	else
	{
		if (keyboard_check_pressed(ord("R"))) room_restart();
		if (run_obj.flBegin)
		{
			if (lives == 2)
			{
				run_obj.success = true;
				run_obj.inAction = false;
			}
		}
		else if (run_obj.flEnemy)
		{
			if (lives == 2) room_restart();
			if (instance_exists(player_man_obj) && run_obj.spiritHp == 250)
			{
				run_obj.success = true;
				run_obj.inAction = false;
			}
		}
		else if (run_obj.flBodyWall)
		{
			if (instance_exists(player_obj))
			{
				run_obj.success = true;
				run_obj.inAction = false;
			}
		}
		else if (run_obj.flBodyShift)
		{
			if (instance_exists(player_obj) && lives == 2) room_restart();
			if (instance_exists(player_obj) && lives == 3)
			{
				run_obj.success = true;
				run_obj.inAction = false;
			}
		}
		else if (run_obj.flBodySpace)
		{
			if (lives == 2) room_restart();
			if (instance_exists(player_man_obj) && lives == 3 && score >= 9)
			{
				run_obj.success = true;
				run_obj.inAction = false;
			}
		}
		else if (run_obj.flSoulShift)
		{
			if (lives == 2 && score >= 18) room_restart();
			else if (lives == 2)
			{
				run_obj.success = true;
				run_obj.inAction = false;
			}
		}
		else if (run_obj.flSoulSpace)
		{
			if (lives == 2 || instance_exists(player_man_obj)) room_restart();
			if (lives == 4)
			{
				run_obj.success = true;
				run_obj.inAction = false;
			}
		}
		else if (run_obj.flMemEnemy)
		{
			if (lives == 2) room_restart();
			if (instance_exists(player_man_obj) && run_obj.spiritHp == 250)
			{
				run_obj.success = true;
				run_obj.inAction = false;
			}
		}
	}
}
			
			
if (room == game_rm) {
	if (!instance_exists(player_obj) && !instance_exists(player_man_obj)){
		run_obj.scoring = false;
		room_goto(gameover_rm);
	}
}