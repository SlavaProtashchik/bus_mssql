DROP DATABASE IF EXISTS СистемаУчетаБилетов;
GO

-- Создание базы данных "СистемаУчетаБилетов"
CREATE
    DATABASE СистемаУчетаБилетов;
GO

-- Использование базы данных "СистемаУчетаБилетов"
USE СистемаУчетаБилетов;
GO


-- Создание таблицы "Организации"
CREATE TABLE Организации
(
    ИдентификаторОрганизации INT IDENTITY (1,1) PRIMARY KEY,
    Название               NVARCHAR(50) NOT NULL,
    CONSTRAINT UK_Назание_Организации UNIQUE (Название),
)

-- Создание таблицы "Пассажиры"
CREATE TABLE Пассажиры
(
    ИдентификаторПассажира   INT IDENTITY (1,1) PRIMARY KEY,
    Имя                      NVARCHAR(50) NOT NULL,
    Фамилия                  NVARCHAR(50) NOT NULL,
    НомерПаспорта            NVARCHAR(20) NOT NULL,
    Email                    NVARCHAR(100),
    Телефон                  NVARCHAR(20),
    ИдентификаторОрганизации INT          NOT NULL,
    CONSTRAINT UK_Пассажиры_НомерПаспорта UNIQUE (НомерПаспорта),
    FOREIGN KEY (ИдентификаторОрганизации) REFERENCES Организации (ИдентификаторОрганизации)
);
GO

-- Создание таблицы "Страны"
CREATE TABLE Страны
(
    ИдентификаторСтраны INT IDENTITY (1,1),
    Название            NVARCHAR(100) NOT NULL,
    CONSTRAINT pk_ИдентификаторСтраны PRIMARY KEY (ИдентификаторСтраны),
    CONSTRAINT UK_Страны_Название UNIQUE (Название)
);
GO

-- Создание таблицы "Города"
CREATE TABLE Города
(
    ИдентификаторГорода INT IDENTITY (1,1) PRIMARY KEY,
    Название            NVARCHAR(100) NOT NULL,
    ИдентификаторСтраны INT,
    CONSTRAINT UK_Города_Название UNIQUE (Название),
    FOREIGN KEY (ИдентификаторСтраны) REFERENCES Страны (ИдентификаторСтраны)
);
GO

-- Создание таблицы "Классы"
CREATE TABLE Классы
(
    ИдентификаторКласса INT IDENTITY (1,1) PRIMARY KEY,
    Название            NVARCHAR(50) NOT NULL,
    Описание            NVARCHAR(MAX),
    CONSTRAINT UK_Классы_Название UNIQUE (Название)
);
GO

-- Создание таблицы "Автобусы"
CREATE TABLE Автобусы
(
    ИдентификаторАвтобуса INT IDENTITY (1,1) PRIMARY KEY,
    НомерАвтобуса         NVARCHAR(20) NOT NULL,
    Марка                 NVARCHAR(50) NOT NULL,
    КоличествоМест        INT          NOT NULL,
    Описание              NVARCHAR(MAX),
    ИдентификаторКласса   INT,
    CONSTRAINT UK_Автобусы_НомерАвтобуса UNIQUE (НомерАвтобуса),
    FOREIGN KEY (ИдентификаторКласса) REFERENCES Классы (ИдентификаторКласса)
);
GO


-- Создание таблицы "Рейсы"
CREATE TABLE Рейсы
(
    ИдентификаторРейса             INT IDENTITY (1,1) PRIMARY KEY,
    НомерРейса                     NVARCHAR(20) NOT NULL,
    ВремяОтправления               DATETIME     NOT NULL,
    ВремяПрибытия                  DATETIME     NOT NULL,
    ИдентификаторАвтобуса          INT,
    ИдентификаторГородаОтправления INT,
    ИдентификаторГородаПрибытия    INT,
    ЦенаБилета                     MONEY        NOT NULL,
    CONSTRAINT UK_Рейсы_НомерРейса UNIQUE (НомерРейса),
    FOREIGN KEY (ИдентификаторАвтобуса) REFERENCES Автобусы (ИдентификаторАвтобуса),
    FOREIGN KEY (ИдентификаторГородаОтправления) REFERENCES Города (ИдентификаторГорода),
    FOREIGN KEY (ИдентификаторГородаПрибытия) REFERENCES Города (ИдентификаторГорода),
    CONSTRAINT CHK_Рейсы_Даты_Города CHECK (ВремяОтправления < ВремяПрибытия AND
                                            ИдентификаторГородаОтправления != ИдентификаторГородаПрибытия)
);
GO

-- Создание таблицы "Билеты
CREATE TABLE Билеты
(
    ИдентификаторБилета        INT IDENTITY (1,1) PRIMARY KEY,
    ИдентификаторПассажира     INT,
    ИдентификаторРейса         INT,
    Цена                       MONEY NOT NULL,
    НомерМеста                 INT   NOT NULL,
    ДатаБронирования           DATETIME,
    ДатаПокупки                DATETIME,
    ИдентификаторОбратныйБилет INT,
    FOREIGN KEY (ИдентификаторПассажира) REFERENCES Пассажиры (ИдентификаторПассажира),
    FOREIGN KEY (ИдентификаторРейса) REFERENCES Рейсы (ИдентификаторРейса),
    FOREIGN KEY (ИдентификаторОбратныйБилет) REFERENCES Билеты (ИдентификаторБилета)
);
GO
