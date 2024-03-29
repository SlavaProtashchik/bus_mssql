-- Использование базы данных "СистемаУчетаБилетов"
USE СистемаУчетаБилетов;
GO

INSERT INTO Организации (Название)
VALUES (N'ООО "Авангард"'),
       (N'ЗАО "Прогресс"'),
       (N'ИП "Созвездие"'),
       (N'АО "Успех"'),
       (N'НКО "Перспектива"');
GO

INSERT INTO Пассажиры (Имя, Фамилия, НомерПаспорта, Email, Телефон, ИдентификаторОрганизации)
VALUES (N'Александр', N'Иванов', 'AB123456', 'alex.ivanov@example.com', '+79123456789',
        (SELECT ИдентификаторОрганизации FROM Организации WHERE Название = N'ООО "Авангард"')),
       (N'Екатерина', N'Смирнова', 'CD789012', 'ekaterina.smirnova@example.com', '+79234567890',
        (SELECT ИдентификаторОрганизации FROM Организации WHERE Название = N'ЗАО "Прогресс"')),
       (N'Максим', N'Петров', 'EF345678', 'maxim.petrov@example.com', '+79345678901',
        (SELECT ИдентификаторОрганизации FROM Организации WHERE Название = N'ЗАО "Прогресс"')),
       (N'Анна', N'Сидорова', 'GH901234', 'anna.sidorova@example.com', '+79456789012',
        (SELECT ИдентификаторОрганизации FROM Организации WHERE Название = N'ИП "Созвездие"')),
       (N'Дмитрий', N'Кузнецов', 'IJ567890', 'dmitry.kuznetsov@example.com', '+79567890123',
        (SELECT ИдентификаторОрганизации FROM Организации WHERE Название = N'ИП "Созвездие"')),
       (N'Мария', N'Васильева', 'KL234567', 'maria.vasilieva@example.com', '+79678901234',
        (SELECT ИдентификаторОрганизации FROM Организации WHERE Название = N'ИП "Созвездие"')),
       (N'Алексей', N'Зайцев', 'MN789012', 'alexey.zaytsev@example.com', '+79789012345',
        (SELECT ИдентификаторОрганизации FROM Организации WHERE Название = N'АО "Успех"')),
       (N'Елена', N'Павлова', 'OP123456', 'elena.pavlova@example.com', '+79890123456',
        (SELECT ИдентификаторОрганизации FROM Организации WHERE Название = N'АО "Успех"')),
       (N'Иван', N'Смирнов', 'QR567890', 'ivan.smirnov@example.com', '+79901234567',
        (SELECT ИдентификаторОрганизации FROM Организации WHERE Название = N'АО "Успех"')),
       (N'Ольга', N'Морозова', 'ST901234', 'olga.morozova@example.com', '+71012345678',
        (SELECT ИдентификаторОрганизации FROM Организации WHERE Название = N'НКО "Перспектива"')),
       (N'Сергей', N'Новиков', 'UV234567', 'sergei.novikov@example.com', '+71123456789',
        (SELECT ИдентификаторОрганизации FROM Организации WHERE Название = N'НКО "Перспектива"')),
       (N'Татьяна', N'Козлова', 'WX789012', 'tatiana.kozlova@example.com', '+71234567890',
        (SELECT ИдентификаторОрганизации FROM Организации WHERE Название = N'НКО "Перспектива"')),
       (N'Павел', N'Лебедев', 'YZ012345', 'pavel.lebedev@example.com', '+71345678901',
        (SELECT ИдентификаторОрганизации FROM Организации WHERE Название = N'НКО "Перспектива"')),
       (N'Анастасия', N'Соколова', 'AB567890', 'anastasia.sokolova@example.com', '+71456789012',
        (SELECT ИдентификаторОрганизации FROM Организации WHERE Название = N'НКО "Перспектива"')),
       (N'Роман', N'Попов', 'CD901234', 'roman.popov@example.com', '+71567890123',
        (SELECT ИдентификаторОрганизации FROM Организации WHERE Название = N'НКО "Перспектива"'));
