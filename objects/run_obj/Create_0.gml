/// @description Insert description here
// You can write your code in this editor

note1 = 0;
note2 = 0;
note3 = 0;
note4 = 0;
note5 = 0;
note6 = 0;
note7 = 0;
note8 = 0;
note9 = 0;
note10 = 0;
note11 = 0;

if (file_exists("data.txt"))
{
	var fil;
	fil = file_text_open_read(program_directory + "data.txt");
	highscore = int64(file_text_read_real(fil));
	file_text_readln(fil);
	journal = int64(file_text_read_real(fil));
	for (var i=0;i<journal;++i)
	{
		file_text_readln(fil);
		var temp = int64(file_text_read_real(fil));
		switch (temp) {
			case 1:
				note1 = 1;
				break;
			case 2:
				note2 = 1;
				break;
			case 3:
				note3 = 1;
				break;
			case 4:
				note4 = 1;
				break;
			case 5:
				note5 = 1;
				break;
			case 6:
				note6 = 1;
				break;
			case 7:
				note7 = 1;
				break;
			case 8:
				note8 = 1;
				break;
			case 9:
				note9 = 1;
				break;
			case 10:
				note10 = 1;
				break;
			case 11:
				note11 = 1;
		}
	}
	file_text_close(fil);
}
else
{
	highscore = 0;
	journal = 0;
}
constTimer = 10;
gameTimer = constTimer;
score = 0;
lives = 3;
constHp = 250;
spiritHp = constHp;
manHp = constHp;
inAction = true;
scoring = false;
help = false;

constSpeed = 0;
flTrap = false;
flWall = false;
flEnemy = false;
pl_spr_right = player_spr_right;
pl_spr_left = player_spr_left;
pl_man_spr_right = player_man_spr_right;
pl_man_spr_left = player_man_spr_left;
en_spr_left = enemy_spr_left;
en_mem_spr_left = enemy_mem_spr_left;
flr_spr = floor_spr;
wll_spr = wall_spr;
tr_spr = trap_spr;

flBegin = true;
flEnemy = false;
flBodyWall = false;
flBodyShift = false;
flBodySpace = false;
flSoulShift = false;
flSoulSpace = false;
flMemEnemy = false;
flLearnEnd = false;
success = false;

body_count = 0; // Кол-во позаимствованых тел
pause_count = 0; // Кол-во пауз
pentagramm_count = 0; // Кол-во пентаграмм

//journal = 0; // Сколько записей открыли
journalMax = 11;
saved = false;

tim = 150; // Таймер для ачивок
