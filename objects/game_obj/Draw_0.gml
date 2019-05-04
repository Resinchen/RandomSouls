/// @description Insert description here
// You can write your code in this editor

depth = -1000;
draw_set_font(RandomFont);

switch(room){
	case menu_rm:
		if (flBegin)
			draw_sprite(begin_spr_down, 0, room_width/2, 100+32);
		else draw_sprite(begin_spr_up, 0, room_width/2, 100+32);
		draw_set_halign(fa_center);
		draw_text_transformed_color(room_width/2, 142, "[Enter]", 0.8, 0.7, 0, c_white, c_white, c_white, c_white, 1);
		if (flLearn)
			draw_sprite(learn_spr_down, 0, room_width/2, 200+32);
		else draw_sprite(learn_spr_up, 0, room_width/2, 200+32);
		//draw_text_transformed_color(room_width/2, 242, "[Tab]", 0.8, 0.7, 0, c_white, c_white, c_white, c_white, 1);
		if (flJournal)
			draw_sprite(journal_spr_down, 0, room_width/2, 300+32);
		else draw_sprite(journal_spr_up, 0, room_width/2, 300+32);
		draw_text_transformed_color(room_width/2, 342, "[Tab]", 0.8, 0.7, 0, c_white, c_white, c_white, c_white, 1);
		if (flCustom)
			draw_sprite(custom_spr_down, 0, room_width/2, 400+32);
		else draw_sprite(custom_spr_up, 0, room_width/2, 400+32);
		if (flModes)
			draw_sprite(modes_spr_down, 0, room_width/2, 500+32);
		else draw_sprite(modes_spr_up, 0, room_width/2, 500+32);
		if (flExit)
			draw_sprite(exit_spr_down, 0, room_width/2, 600+32);
		else draw_sprite(exit_spr_up, 0, room_width/2, 600+32);
		draw_text_transformed_color(room_width/2, 642, "[Esc]", 0.8, 0.7, 0, c_white, c_white, c_white, c_white, 1);
	break;
	
	case howtoplay_rm:
		draw_roundrect_colour(0, 0, 1024, 80, c_black, c_black, false);
		draw_set_halign(fa_right);
		draw_text_color(1023, 0, "[Esc] - в меню", c_aqua, c_aqua, c_aqua, c_aqua, 1);
		draw_text_color(1023, 20, "[R] - рестарт", c_aqua, c_aqua, c_aqua, c_aqua, 1);
		draw_set_halign(fa_left);
		draw_text_color(00, 00, "Ваши очки: "+string(score), c_aqua, c_aqua, c_aqua, c_aqua, 1);
		draw_text_color(00, 20, "Ваши жизни: "+string(lives), c_aqua, c_aqua, c_aqua, c_aqua, 1);
		if (instance_exists(player_man_obj)) 
		{
			draw_text_color(00, 60, "Здоровье тела: ", c_aqua, c_aqua, c_aqua, c_aqua, 1);
			draw_healthbar(180, 60, 120+200, 80, run_obj.manHp/run_obj.constHp*100, c_gray, c_purple, c_lime, 0, true, true);
		}
		else draw_text_color(00, 60, "Здоровье тела: ", c_aqua, c_aqua, c_aqua, c_aqua, 1);
		draw_text_color(00, 40, "Здоровье души: ", c_aqua, c_aqua, c_aqua, c_aqua, 1);
		draw_healthbar(180, 40, 120+200, 60, run_obj.spiritHp/run_obj.constHp*100, c_silver, c_red, c_green, 0, true, true);
		if (instance_exists(player_man_obj))
		{
			plMan = instance_nearest(0, 0, player_man_obj);
			if (plMan.flStun)
				draw_healthbar(plMan.x - plMan.sprite_width/2, plMan.y - plMan.sprite_height/2 - 8, plMan.x + plMan.sprite_width/2, plMan.y - plMan.sprite_height/2, plMan.timer*2, c_silver, c_blue, c_aqua, 0, true, true);
		}
		if (instance_exists(player_obj))
		{
			plSpirit = instance_nearest(0, 0, player_obj);
			if (plSpirit.flStun)
				draw_healthbar(plSpirit.x - plSpirit.sprite_width/2, plSpirit.y - plSpirit.sprite_height/2 - 8, plSpirit.x + plSpirit.sprite_width/2, plSpirit.y - plSpirit.sprite_height/2, plSpirit.timer*4/3, c_gray, c_silver, c_red, 0, true, true);
		}
		
		if (!run_obj.inAction)
		{
		
		if (run_obj.success)
		{
			draw_roundrect_colour(0, 80, 1024, 200, c_black, c_black, false);
			draw_text_ext_transformed_colour(0, 100, strSuccess+"\n\nНажмите [R], чтобы попробовать снова.\n[Enter] - чтобы продолжить.", 20, 700, 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		}
		else if (run_obj.flBegin)
		{
			draw_roundrect_colour(0, 80, 1024, 200, c_black, c_black, false);
			strSuccess = "В форме души Вы постоянно теряете здоровье.";
			draw_text_ext_transformed_colour(0, 100, "Давайте посмотрим, что произойдёт, если вы оказались один в закрытой комнате.\n\nНажмите любую клавишу, чтобы начать.", 20, 700, 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		}
		else if (run_obj.flEnemy)
		{
			draw_roundrect_colour(0, 80, 1024, 200, c_black, c_black, false);
			strSuccess = "Находясь в теле, вы восстанавливаете здоровье души.";
			draw_text_ext_transformed_colour(0, 100, "Захватите тело одного из этих демонов, подлетев к нему. Управление: [W][A][S][D].\n\nНажмите любую клавишу, чтобы начать.", 20, 700, 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		}
		else if (run_obj.flBodyWall)
		{
			draw_roundrect_colour(0, 80, 1024, 200, c_black, c_black, false);
			strSuccess = "Если тело умирает от препятствия, Вы теряете жизнь. Урон от препятствия - 40% HP.";
			draw_text_ext_transformed_colour(0, 100, "Теперь пролетите сквозь препятствие.\n\nНажмите любую клавишу, чтобы начать.", 20, 700, 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		}
		else if (run_obj.flBodyShift)
		{
			draw_roundrect_colour(0, 80, 1024, 200, c_black, c_black, false);
			strSuccess = "В щите душа не восстанавливает здоровье.";
			draw_text_ext_transformed_colour(0, 100, "Зажмите [Shift] перед столкновением с препятствием, чтобы избежать урона и уменьшить время оглушения.\n\nНажмите любую клавишу, чтобы начать.", 20, 700, 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		}
		else if (run_obj.flBodySpace)
		{
			draw_roundrect_colour(0, 80, 1024, 200, c_black, c_black, false);
			strSuccess = "Когда здоровье тела плавно упадёт до нуля, душа сама выйдет из тела, не потеряв жизнь.";
			draw_text_ext_transformed_colour(0, 100, "Теперь нажмите [Space], чтобы покинуть тело.\n\nНажмите любую клавишу, чтобы начать.", 20, 700, 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		}
		else if (run_obj.flSoulShift)
		{
			draw_roundrect_colour(0, 80, 1024, 200, c_black, c_black, false);
			strSuccess = "Скорость перемещения увеличивается, время замедляется, но способность требует жизненных сил.";
			draw_text_ext_transformed_colour(0, 100, "Зажмите [Shift] и поперемещайтесь.\n\nНажмите любую клавишу, чтобы начать.", 20, 700, 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		}
		else if (run_obj.flSoulSpace)
		{
			draw_roundrect_colour(0, 80, 1024, 200, c_black, c_black, false);
			strSuccess = "Отменить высасывание жизни нельзя, а длительный паралич может напротив привести к потере жизни.";
			draw_text_ext_transformed_colour(0, 100, "Зажмите [Space] и подлетайте к врагу.\n\nНажмите любую клавишу, чтобы начать.", 20, 700, 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		}
		
		else if (run_obj.flMemEnemy)
		{
			draw_roundrect_colour(0, 80, 1024, 200, c_black, c_black, false);
			strSuccess = "Так вы получаете ценные сведения об этом мире, которые потом можно будет прочитать в разделе <Журнал>.";
			draw_text_ext_transformed_colour(0, 100, "Вселитесь в этого врага с сумкой и восстановите здоровье души до 100%.\n\nНажмите любую клавишу, чтобы начать.", 20, 700, 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		}
		
		else if (run_obj.flLearnEnd)
		{
			draw_roundrect_colour(0, 80, 1024, 200, c_black, c_black, false);
			draw_text_ext_transformed_colour(0, 100, "Обучение закончено! Нажмите любую клавишу, чтобы выйти в меню.", 20, 700, 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		}
		
		}
		/*
		draw_roundrect_colour(0, 0, 1024, 124, c_black, c_black, false);
		draw_set_halign(fa_right);
		draw_text_color(1023, 0, "[Esc] - в меню", c_aqua, c_aqua, c_aqua, c_aqua, 1);
		draw_set_halign(fa_left);
		if (!run_obj.flTrap && !run_obj.flWall && !run_obj.flEnemy) 
			draw_text_ext_transformed_colour(0, 0, "У вас есть 3 жизни и уровень здоровья тела и духа, которые тают со временем. Игра будет закончена, когда Ваши жизни достигнут нуля. Когда здоровье духа достигает нуля, Вы теряете одну жизнь. Тело восстанавливает здоровье духа.  Приблизьтесь к любому объекту, чтобы узнать подробную информацию о нём.", 20, 700, 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		else if (run_obj.flTrap)
			draw_text_ext_transformed_colour(0, 0, "Пентаграммы забирают одну из Ваших жизней, только если Вы - бестелесный призрак. Избегайте контакта. [Shift] позволяет проще маневрировать, однако при этом здоровье теряется в 2 раза быстрее. Кстати, в этой форме Вы передвигаетесь чуть быстрее, чем в теле.", 20, 700, 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		else if (run_obj.flWall)
			draw_text_ext_transformed_colour(0, 0, "В виде духа Вы проходите стены насквозь. Если Вы вселились во врага, то с разгона пробиваете собой стены, но они оглушают Вас и дамажат на 40% хп. Если при этом был зажат [Shift], тело не получит урона, а оглушение будет длиться на 70% меньше, но восстановление здоровья духа будет приостановлено. Осторожнее! Если умрёте от стены, потеряете одну жизнь.", 20, 700, 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		else if (run_obj.flEnemy)
			draw_text_ext_transformed_colour(0, 0, "В форме духа при приближении к врагу, вы вселяетесь в него. Другие враги забирают одну из Ваших жизней, если Вы уже вселились в кого-то. Нажмите [Space], чтобы покинуть тело.\nЕсли хотите прибрать душу врага к своим жизням, в форме духа подлетайте к нему с зажатым [Space]. Аккуратнее, это занимает время и может быть опасно!", 20, 700, 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		*/
	break;
	
	case customize_rm:
		if (flOriginal)
			draw_sprite(original_spr_down, 0, room_width/2, 100+32);
		else draw_sprite(original_spr_up, 0, room_width/2, 100+32);
		draw_sprite(player_spr_right, 0, room_width/2-100+204, 100);
		if (flClassic)
			draw_sprite(classic_spr_down, 0, room_width/2, 200+32);
		else draw_sprite(classic_spr_up, 0, room_width/2, 200+32);
		draw_sprite(player_spr_right_classic, 0, room_width/2-100+204, 200);
		draw_text_transformed_color(room_width/2, 242, "Рекорд >= 300", 0.8, 0.7, 0, c_white, c_white, c_white, c_white, 1);
		if (flNecro)
			draw_sprite(necro_spr_down, 0, room_width/2, 300+32);
		else draw_sprite(necro_spr_up, 0, room_width/2, 300+32);
		draw_sprite(player_spr_right_necro, 0, room_width/2-100+204, 300);
		draw_text_transformed_color(room_width/2, 342, "Рекорд >= 600", 0.8, 0.7, 0, c_white, c_white, c_white, c_white, 1);
	break;
	
	case modes_rm:
		if (flOriginalMode)
			draw_sprite(original_spr_down, 0, room_width/2, 100+32);
		else draw_sprite(original_spr_up, 0, room_width/2, 100+32);
		if (flClassicMode)
			draw_sprite(classic_spr_down, 0, room_width/2, 200+32);
		else draw_sprite(classic_spr_up, 0, room_width/2, 200+32);
		draw_text_transformed_color(room_width/2, 242, "Рекорд >= 200", 0.8, 0.7, 0, c_white, c_white, c_white, c_white, 1);
	break;
	
	case journal_rm:
		if (flToMenu)
			draw_sprite(tomenu_spr_down, 0, room_width/4, 100+32);
		else draw_sprite(tomenu_spr_up, 0, room_width/4, 100+32);
		if (run_obj.note1)
		{
			if (flNote1)
				draw_sprite(note1_down, 0, room_width/2, 100+32);
			else draw_sprite(note1_up, 0, room_width/2, 100+32);
		}
		else draw_sprite(unavailable_spr, 0, room_width/2, 100+32);
		if (run_obj.note2)
		{
			if (flNote2)
				draw_sprite(note2_down, 0, 3*room_width/4, 100+32);
			else draw_sprite(note2_up, 0, 3*room_width/4, 100+32);
		}
		else draw_sprite(unavailable_spr, 0, 3*room_width/4, 100+32);
		if (run_obj.note3)
		{
			if (flNote3)
				draw_sprite(note3_down, 0, room_width/4, 200+32);
			else draw_sprite(note3_up, 0, room_width/4, 200+32);
		}
		else draw_sprite(unavailable_spr, 0, room_width/4, 200+32);
		if (run_obj.note4)
		{
			if (flNote4)
				draw_sprite(note4_down, 0, room_width/2, 200+32);
			else draw_sprite(note4_up, 0, room_width/2, 200+32);
		}
		else draw_sprite(unavailable_spr, 0, room_width/2, 200+32);
		if (run_obj.note5)
		{
			if (flNote5)
				draw_sprite(note5_down, 0, 3*room_width/4, 200+32);
			else draw_sprite(note5_up, 0, 3*room_width/4, 200+32);
		}
		else draw_sprite(unavailable_spr, 0, 3*room_width/4, 200+32);
		if (run_obj.note6)
		{
			if (flNote6)
				draw_sprite(note6_down, 0, room_width/4, 300+32);
			else draw_sprite(note6_up, 0, room_width/4, 300+32);
		}
		else draw_sprite(unavailable_spr, 0, room_width/4, 300+32);
		if (run_obj.note7)
		{
			if (flNote7)
				draw_sprite(note7_down, 0, room_width/2, 300+32);
			else draw_sprite(note7_up, 0, room_width/2, 300+32);
		}
		else draw_sprite(unavailable_spr, 0, room_width/2, 300+32);
		if (run_obj.note8)
		{
			if (flNote8)
				draw_sprite(note8_down, 0, 3*room_width/4, 300+32);
			else draw_sprite(note8_up, 0, 3*room_width/4, 300+32);
		}
		else draw_sprite(unavailable_spr, 0, 3*room_width/4, 300+32);
		if (run_obj.note9)
		{
			if (flNote9)
				draw_sprite(note9_down, 0, room_width/4, 400+32);
			else draw_sprite(note9_up, 0, room_width/4, 400+32);
		}
		else draw_sprite(unavailable_spr, 0, room_width/4, 400+32);
		if (run_obj.note10)
		{
			if (flNote10)
				draw_sprite(note10_down, 0, room_width/2, 400+32);
			else draw_sprite(note10_up, 0, room_width/2, 400+32);
		}
		else draw_sprite(unavailable_spr, 0, room_width/2, 400+32);
		if (run_obj.note11)
		{
			if (flNote11)
				draw_sprite(note11_down, 0, 3*room_width/4, 400+32);
			else draw_sprite(note11_up, 0, 3*room_width/4, 400+32);
		}
		else draw_sprite(unavailable_spr, 0, 3*room_width/4, 400+32);
	break;
	
	case game_rm:
		draw_roundrect_colour(0, 0, 1024, 80, c_black, c_black, false);
		draw_set_halign(fa_right);
		draw_text_color(1023, 0, "[Esc] - в меню", c_aqua, c_aqua, c_aqua, c_aqua, 1);
		draw_text_color(1023, 20, "[P] - пауза", c_aqua, c_aqua, c_aqua, c_aqua, 1);
		if (!run_obj.inAction) draw_text_color(1023, 40, "[O] - управление", c_aqua, c_aqua, c_aqua, c_aqua, 1);
		draw_set_halign(fa_center);
		draw_text_color(room_width/2, 0, "Рекорд: "+string(run_obj.highscore), c_aqua, c_aqua, c_aqua, c_aqua, 1);
		draw_text_color(room_width/2, 20, "Записей: "+string(run_obj.journal), c_aqua, c_aqua, c_aqua, c_aqua, 1);
		draw_set_halign(fa_left);
		draw_text_color(00, 00, "Ваши очки: "+string(score), c_aqua, c_aqua, c_aqua, c_aqua, 1);
		draw_text_color(00, 20, "Ваши жизни: "+string(lives), c_aqua, c_aqua, c_aqua, c_aqua, 1);
		if (instance_exists(player_man_obj)) 
		{
			draw_text_color(00, 60, "Здоровье тела: ", c_aqua, c_aqua, c_aqua, c_aqua, 1);
			draw_healthbar(180, 60, 120+200, 80, run_obj.manHp/run_obj.constHp*100, c_gray, c_purple, c_lime, 0, true, true);
		}
		else draw_text_color(00, 60, "Здоровье тела: ", c_aqua, c_aqua, c_aqua, c_aqua, 1);
		draw_text_color(00, 40, "Здоровье души: ", c_aqua, c_aqua, c_aqua, c_aqua, 1);
		draw_healthbar(180, 40, 120+200, 60, run_obj.spiritHp/run_obj.constHp*100, c_silver, c_red, c_green, 0, true, true);
		if (!run_obj.inAction) 
		{
			draw_roundrect_colour(room_width/2 - 100, room_height/2 - 128, room_width/2 - 52, room_height/2 + 128, c_aqua, c_aqua, false);
			draw_roundrect_colour(room_width/2 + 52, room_height/2 - 128, room_width/2 + 100, room_height/2 + 128, c_aqua, c_aqua, false);
		}
		if (instance_exists(player_man_obj))
		{
			plMan = instance_nearest(0, 0, player_man_obj);
			if (plMan.flStun)
				draw_healthbar(plMan.x - plMan.sprite_width/2, plMan.y - plMan.sprite_height/2 - 8, plMan.x + plMan.sprite_width/2, plMan.y - plMan.sprite_height/2, plMan.timer*2, c_silver, c_blue, c_aqua, 0, true, true);
		}
		if (instance_exists(player_obj))
		{
			plSpirit = instance_nearest(0, 0, player_obj);
			if (plSpirit.flStun)
				draw_healthbar(plSpirit.x - plSpirit.sprite_width/2, plSpirit.y - plSpirit.sprite_height/2 - 8, plSpirit.x + plSpirit.sprite_width/2, plSpirit.y - plSpirit.sprite_height/2, plSpirit.timer*4/3, c_gray, c_silver, c_red, 0, true, true);
		}
		if (!run_obj.inAction && run_obj.help)
		{
			draw_roundrect_colour(0, 80, 1024, 200, c_black, c_black, false);
			draw_text_ext_transformed_colour(0, 100, "Управление:\nПередвижение - [W][A][S][D]\n[Shift] - ускорение (дух)/щит (тело).\n[Space] - высасывание жизни (дух)/выход из тела (тело).", 20, 700, 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		}
	break;

	case gameover_rm:
		draw_text_color(100, 100, "Ваш итоговый счёт: "+string(score), c_white, c_white, c_white, c_white, 1);
		draw_text_color(100, 120, "Рекорд: "+string(run_obj.highscore), c_white, c_white, c_white, c_white, 1);
		draw_text_color(100, 200, "Ваше бегство окончено, нажмите [Enter], чтобы начать новый забег.", c_white, c_white, c_white, c_white, 1);
		draw_text_color(100, 300, "[Escape], чтобы выйти в меню.", c_white, c_white, c_white, c_white, 1);
	break;
}