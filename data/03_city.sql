-- Использование базы данных "СистемаУчетаБилетов"
USE СистемаУчетаБилетов;
GO

-- Получение идентификаторов стран
DECLARE @ИдентификаторБеларуси INT, @ИдентификаторРоссии INT, @ИдентификаторПольши INT;
SELECT @ИдентификаторБеларуси = ИдентификаторСтраны FROM Страны WHERE Название = N'Беларусь';
SELECT @ИдентификаторРоссии = ИдентификаторСтраны FROM Страны WHERE Название = N'Россия';
SELECT @ИдентификаторПольши = ИдентификаторСтраны FROM Страны WHERE Название = N'Польша';

-- Добавление записей в таблицу "Города"
INSERT INTO Города (Название, ИдентификаторСтраны)
VALUES
    (N'Минск', @ИдентификаторБеларуси),
    (N'Гродно', @ИдентификаторБеларуси),
    (N'Брест', @ИдентификаторБеларуси),
    (N'Витебск', @ИдентификаторБеларуси),
    (N'Гомель', @ИдентификаторБеларуси),
    (N'Могилев', @ИдентификаторБеларуси),
    (N'Москва', @ИдентификаторРоссии),
    (N'Санкт-Петербург', @ИдентификаторРоссии),
    (N'Новосибирск', @ИдентификаторРоссии),
    (N'Екатеринбург', @ИдентификаторРоссии),
    (N'Нижний Новгород', @ИдентификаторРоссии),
    (N'Казань', @ИдентификаторРоссии),
    (N'Варшава', @ИдентификаторПольши),
    (N'Краков', @ИдентификаторПольши),
    (N'Вроцлав', @ИдентификаторПольши),
    (N'Гданьск', @ИдентификаторПольши);
-- Продолжайте добавлять остальные города в соответствии с вашими требованиями
