-- Использование базы данных "СистемаУчетаБилетов"
USE СистемаУчетаБилетов;
GO

-- Тригер для гинерации билетов при создании рейса
DROP TRIGGER IF EXISTS trg_ГенерацияБилетов;
GO

CREATE TRIGGER trg_ГенерацияБилетов
    ON Рейсы
    AFTER INSERT
    AS
BEGIN
    -- Получаем информацию о вновь вставленном рейсе
    DECLARE @РейсИдентификатор int;
    DECLARE @АвтобусИдентификатор int;
    DECLARE @КоличествоБилетов int;
    DECLARE @ЦенаБилета int;

    SELECT @РейсИдентификатор = ИдентификаторРейса
    FROM inserted;

    SELECT @АвтобусИдентификатор = ИдентификаторАвтобуса
    FROM inserted;

    SELECT @КоличествоБилетов = КоличествоМест
    FROM Автобусы
    WHERE ИдентификаторАвтобуса = @АвтобусИдентификатор;

    SELECT @ЦенаБилета = ЦенаБилета
    FROM inserted;

    DECLARE @Counter INT
    SET @Counter = 1
    WHILE (@Counter <= @КоличествоБилетов)
        BEGIN
            INSERT INTO Билеты (ИдентификаторРейса, Цена, НомерМеста) VALUES (@РейсИдентификатор, @ЦенаБилета, @Counter)
            SET @Counter = @Counter + 1
        END
END
GO

-- покупка билета
-- При пронировании или покупке билета создаем запись в таблице Поездки
DROP TRIGGER IF EXISTS TRG_Покупка_Бронировение_Билеат;
GO

CREATE TRIGGER TRG_Покупка_Бронировение_Билеат
    ON Билеты
    AFTER UPDATE
    AS
BEGIN
    DECLARE @Пассажир INT;
    DECLARE @Билет INT;
    DECLARE @БилетЗабронирован DATETIME;
    DECLARE @БилетКуплен DATETIME;
    DECLARE @Поездка INT;

    SELECT @Пассажир = ИдентификаторПассажира FROM inserted
    SELECT @Билет = ИдентификаторБилета FROM inserted
    SELECT @БилетЗабронирован = ДатаБронирования FROM inserted
    SELECT @БилетКуплен = ДатаПокупки FROM inserted

    --  ОБновляем бронироваение если билет покупается сразу
    IF (@БилетЗабронирован IS NULL) AND (@БилетКуплен IS NOT NULL)
        UPDATE Билеты SET ДатаБронирования = @БилетКуплен WHERE ИдентификаторБилета = @Билет

    IF (@Пассажир IS NOT NULL) AND ((@БилетЗабронирован IS NOT NULL) OR (@БилетКуплен IS NOT NULL))
        SELECT @Поездка AS ИдентификаторПоездки FROM Поездки WHERE ИдентификаторБилетаТуда = @Билет
        IF (@Поездка IS NULL)
            INSERT INTO Поездки(ИдентификаторБилетаТуда) VALUES (@Билет)
END
GO

