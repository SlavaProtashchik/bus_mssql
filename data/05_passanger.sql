-- Использование базы данных "СистемаУчетаБилетов"
USE СистемаУчетаБилетов;
GO

INSERT INTO Пассажиры (Имя, Фамилия, НомерПаспорта, Email, Телефон)
VALUES
    (N'Александр', N'Иванов', 'AB123456', 'alex.ivanov@example.com', '+79123456789'),
    (N'Екатерина', N'Смирнова', 'CD789012', 'ekaterina.smirnova@example.com', '+79234567890'),
    (N'Максим', N'Петров', 'EF345678', 'maxim.petrov@example.com', '+79345678901'),
    (N'Анна', N'Сидорова', 'GH901234', 'anna.sidorova@example.com', '+79456789012'),
    (N'Дмитрий', N'Кузнецов', 'IJ567890', 'dmitry.kuznetsov@example.com', '+79567890123'),
    (N'Мария', N'Васильева', 'KL234567', 'maria.vasilieva@example.com', '+79678901234'),
    (N'Алексей', N'Зайцев', 'MN789012', 'alexey.zaytsev@example.com', '+79789012345'),
    (N'Елена', N'Павлова', 'OP123456', 'elena.pavlova@example.com', '+79890123456'),
    (N'Иван', N'Смирнов', 'QR567890', 'ivan.smirnov@example.com', '+79901234567'),
    (N'Ольга', N'Морозова', 'ST901234', 'olga.morozova@example.com', '+71012345678'),
    (N'Сергей', N'Новиков', 'UV234567', 'sergei.novikov@example.com', '+71123456789'),
    (N'Татьяна', N'Козлова', 'WX789012', 'tatiana.kozlova@example.com', '+71234567890'),
    (N'Павел', N'Лебедев', 'YZ012345', 'pavel.lebedev@example.com', '+71345678901'),
    (N'Анастасия', N'Соколова', 'AB567890', 'anastasia.sokolova@example.com', '+71456789012'),
    (N'Роман', N'Попов', 'CD901234', 'roman.popov@example.com', '+71567890123');
