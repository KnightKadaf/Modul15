
Функция PingПроверкаПодключения(Запрос)
	Ответ = Новый HTTPСервисОтвет(200);   
	Ответ.УстановитьТелоИзСтроки("Ok");
	Возврат Ответ;
КонецФункции

Функция OrderПолучитьЗаказы(Запрос)   
	ЗапросОтбора = Новый Запрос;
	ЗапросОтбора.Текст = "ВЫБРАТЬ
	               |	КОЛИЧЕСТВО(ЗаказПокупателя.Ссылка) КАК КоличествоЗаказов
	               |ИЗ
	               |	Документ.ЗаказПокупателя КАК ЗаказПокупателя
	               |ГДЕ
	               |	ЗаказПокупателя.Ответственный = &Ответственный";
	ЗапросОтбора.УстановитьПараметр("Ответственный",ПараметрыСеанса.ТекущийПользователь);
	Выборка = ЗапросОтбора.Выполнить().Выбрать();  
	Выборка.Следующий();
	КоличествоЗаказов = Выборка.КоличествоЗаказов;
	
	Ответ = Новый HTTPСервисОтвет(200);                    
	//.Наименование
  
	Ответ.УстановитьТелоИзСтроки(Строка(КоличествоЗаказов));  
	Возврат Ответ;
КонецФункции

