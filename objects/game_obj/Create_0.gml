/// @description Insert description here
// You can write your code in this editor

if (room == gameover_rm && !audio_is_playing(sound_game_over))
{
	audio_play_sound(sound_game_over, 2, false);
	if (run_obj.highscore < score) run_obj.highscore = score;
	var file;
	file = file_text_open_write(program_directory + "data.txt");
	file_text_write_real(file, real(run_obj.highscore));
	file_text_writeln(file);
	file_text_write_real(file, real(run_obj.journal));
	if (run_obj.note1)
	{
		file_text_writeln(file);
		file_text_write_real(file, real(1));
	}
	if (run_obj.note2)
	{
		file_text_writeln(file);
		file_text_write_real(file, real(2));
	}
	if (run_obj.note3)
	{
		file_text_writeln(file);
		file_text_write_real(file, real(3));
	}
	if (run_obj.note4)
	{
		file_text_writeln(file);
		file_text_write_real(file, real(4));
	}
	if (run_obj.note5)
	{
		file_text_writeln(file);
		file_text_write_real(file, real(5));
	}
	if (run_obj.note6)
	{
		file_text_writeln(file);
		file_text_write_real(file, real(6));
	}
	if (run_obj.note7)
	{
		file_text_writeln(file);
		file_text_write_real(file, real(7));
	}
	if (run_obj.note8)
	{
		file_text_writeln(file);
		file_text_write_real(file, real(8));
	}
	if (run_obj.note9)
	{
		file_text_writeln(file);
		file_text_write_real(file, real(9));
	}
	if (run_obj.note10)
	{
		file_text_writeln(file);
		file_text_write_real(file, real(10));
	}
	if (run_obj.note11)
	{
		file_text_writeln(file);
		file_text_write_real(file, real(11));
	}
	file_text_close(file);
}
if (room = game_rm)
{
	audio_stop_all();
	audio_play_sound(sound_game, 2, true);
	for (var i=0; i<=1024+64; i+=64)
		for (var j=0; j<768; j+=64)
			 instance_create_depth(i, j, 0, floor_obj);
	score = 0;
	lives = 3;
	run_obj.spiritHp = run_obj.constHp;
	run_obj.manHp = run_obj.constHp;
	instance_create_depth(96, 416, -2, player_obj);
	run_obj.body_count = 0; // Кол-во позаимствованых тел
	run_obj.pause_count = 0; // Кол-во пауз
	run_obj.pentagramm_count = 0; // Кол-во пентаграмм
	run_obj.scoring = true;
	run_obj.inAction = true;
}
if (room = howtoplay_rm)
{
	//audio_stop_all();
	//audio_play_sound(sound_training, 2, true);
	if (!audio_is_playing(sound_training_new))
	{
		audio_stop_all();
		audio_play_sound(sound_training_new, 2, true);
	}
	for (var i=0; i<=1024+64; i+=64)
		for (var j=0; j<768; j+=64)
			 instance_create_depth(i, j, 0, floor_obj);
	run_obj.body_count = 0; // Кол-во позаимствованых тел
	run_obj.pause_count = 0; // Кол-во пауз
	run_obj.pentagramm_count = 0; // Кол-во пентаграмм
	run_obj.scoring = true;
	run_obj.inAction = false;
	run_obj.spiritHp = run_obj.constHp;
	run_obj.manHp = run_obj.constHp;
	score = 0;
	lives = 3;
	if (run_obj.flBegin)
	{
		run_obj.spiritHp = 150;
		instance_create_depth(96, 416, -2, player_obj);
	}
	else if (run_obj.flEnemy)
	{
		instance_create_depth(96, 416, -2, player_obj);
		for (var i=32+80+32;i<=736;i+=128) instance_create_depth(728, i, -1, enemy_obj);
	}
	else if (run_obj.flBodyWall)
	{
		instance_create_depth(96, 416, -2, player_man_obj);
		for (var i=32+80-64;i<=736+64;i+=64) instance_create_depth(350, i, -3, wall_obj);
		for (var i=32+80-64;i<=736+64;i+=64) instance_create_depth(550, i, -3, wall_obj);
	}
	else if (run_obj.flBodyShift)
	{
		run_obj.manHp = 125;
		run_obj.spiritHp = 125;
		instance_create_depth(96, 416, -2, player_man_obj);
		for (var i=32+80-64;i<=736+64;i+=64) instance_create_depth(250, i, -3, wall_obj);
		for (var i=32+80-64;i<=736+64;i+=64) instance_create_depth(325, i, -3, wall_obj);
		for (var i=32+80-64;i<=736+64;i+=64) instance_create_depth(450, i, -3, wall_obj);
	}
	else if (run_obj.flBodySpace)
	{
		instance_create_depth(96, 416, -2, player_man_obj);
		for (var i=32+80-64;i<=736+64;i+=64) instance_create_depth(300, i, -3, wall_obj);
		for (var i=32+80-64;i<=736+64;i+=64) instance_create_depth(365, i, -1, enemy_obj);
	}
	else if (run_obj.flSoulShift)
	{
		instance_create_depth(96, 416, -2, player_obj);
		for (var i=32+80-64;i<=736+64;i+=64) instance_create_depth(300+irandom(room_width-300), i, -3, wall_obj);
	}
	else if (run_obj.flSoulSpace)
	{
		instance_create_depth(96, 416, -2, player_obj);
		for (var i=32+80-64;i<=736+64;i+=64) instance_create_depth(300, i, -1, enemy_obj);
		for (var i=32+80-64+32;i<=736+64;i+=160) instance_create_depth(500, i, -1, trap_obj);
	}
	else if (run_obj.flMemEnemy)
	{
		instance_create_depth(96, 416, -2, player_obj);
		for (var i=32+80;i<=736;i+=128) instance_create_depth(728, i, -1, enemy_mem_obj);
	}
}

if (room == journal_rm)
{
	audio_stop_sound(sound_menu);
	if (!audio_is_playing(sound_training_new))
		audio_play_sound(sound_training_new, 2, true);
}

if (room == menu_rm)
{
	run_obj.scoring = false;
	run_obj.success = false;
	if (!audio_is_playing(sound_menu))
	{
		audio_stop_all();
		audio_play_sound(sound_menu, 2, true);
	}
}
flBegin = false;
flExit = false;
flCustom = false;
flLearn = false;
flJournal = false;
flModes = false;
flAchiev = false;

strSuccess = "";

flOriginal = false;
flClassic = false;
flNecro = false;

flOriginalMode = false;
flClassicMode = false;

flToMenu = false;
flNote1 = false;
flNote2 = false;
flNote3 = false;
flNote4 = false;
flNote5 = false;
flNote6 = false;
flNote7 = false;
flNote8 = false;
flNote9 = false;
flNote10 = false;
flNote11 = false;