UPDATE Билеты SET ДатаБронирования = GETDATE() WHERE ИдентификаторБилета = 1;
UPDATE Билеты SET ДатаПокупки = GETDATE() WHERE ИдентификаторБилета = 2;