USE new.
GO

CREATE TABLE Clients (
    client_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    address VARCHAR(100) NOT NULL
);
GO

INSERT INTO Clients (client_id, name, phone_number, address)
VALUES 
    (1, 'James Harvey', '+79782500850', '123 Main St'),
    (2, 'Freddie Page', '+79930396387', '456 Elm St'),
    (3, 'Mike Johnson', '+79942310400', '789 Oak St'),
    (4, 'Cynthia Martinez', '+79012496574', '321 Pine St'),
    (5, 'Jacqueline Nichols', '+79020884351', '654 Birch St'),
    (6, 'Emily White', '+79365556051', '987 Cedar St'),
    (7, 'Diane Parks', '79838889095', '147 Maple St'),
    (8, 'Olivia Taylor', '+79920765092', '258 Walnut St'),
    (9, 'Ethan Parker', '+79913435381', '369 Cherry St'),
    (10, 'Lily Martinez', '+79361013873', '852 Oakwood St'),
    (11, 'Clarence Smith', '+79957036312', '963 Elmwood St'),
    (12, 'Grace Adams', '888888888', '741 Pinecrest St'),
    (13, 'Stella Snyder', '999999999', '654 Sunset St');
GO


CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);
GO

INSERT INTO Employees (employee_id, name, position, salary)
VALUES 
    (1, 'Tom Williams', 'Chef', 5000),
    (2, 'Sarah Adams', 'Waiter', 2000),
    (3, 'Michael Brown', 'Bartender', 2500),
	(4, 'Emma Wilson', 'Chef', 4800),
    (5, 'Ryan Garcia', 'Waiter', 1900),
    (6, 'Jessica Lee', 'Bartender', 2300),
    (7, 'Chris Johnson', 'Chef', 5200),
    (8, 'Megan Smith', 'Waiter', 2100),
    (9, 'Tyler Clark', 'Bartender', 2400),
    (10, 'Sophia Martinez', 'Chef', 5100),
    (11, 'Jake Anderson', 'Waiter', 1950),
    (12, 'Natalie Ross', 'Bartender', 2200),
    (13, 'Ethan Cooper', 'Chef', 4900);
GO

CREATE TABLE Administrators (
    admin_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);
GO

INSERT INTO Administrators (admin_id, name, username, password)
VALUES 
    (1, 'Andrey', 'admin_typical_error', 'AUHTCCKE'),
    (2, 'Ashalet', 'admin_thing_led', 'BGJWENJG'),
    (3, 'Cho po kaifu', 'admin_weird_life-cycle', 'ZKNS'), 
    (4, 'Ecaterina', 'admin_help_bringer', 'OHPOHHBVGCMC'),
    (5, 'Kyazil', 'admin_crip', '_kNKJGLM0_'),
    (6, 'Ahma', 'admin_roy pedril', 'jn4eined/49dn1'),
    (7, 'nigr', 'admin_makeeasy', ':KWHEJDmkssaq2m3');
GO

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    client_id INT,
	item_id INT,
    employee_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Clients (client_id),
    FOREIGN KEY (employee_id) REFERENCES Employees (employee_id)
);
GO

INSERT INTO Orders (order_id, client_id, employee_id, item_id, order_date, total_amount)
VALUES 
    (1, 1, 2, 1, '2021-01-01', 50.00),
    (2, 2, 3, 1,'2021-02-05', 75.00),
    (3, 3, 1, 1,'2021-03-10', 100.00),
	(4, 4, 2, 1,'2021-04-15', 120.00),
    (5, 5, 3, 5,'2021-05-20', 90.00),
    (6, 6, 1, 6,'2021-06-25', 85.00),
    (7, 7, 2, 7,'2021-07-30', 110.00),
    (8, 8, 3, 8,'2021-08-05', 70.00),
    (9, 9, 1, 9,'2021-09-10', 95.00),
    (10, 10, 2, 10, '2021-10-15', 130.00),
    (11, 11, 3, 11, '2021-11-20', 105.00),
    (12, 12, 1, 12,'2021-12-25', 115.00),
    (13, 13, 2, 13,'2022-01-01', 140.00);
GO

CREATE TABLE Menu (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
GO

INSERT INTO Menu (item_id, item_name, price)
VALUES 
    (1, 'Burger', 10.00),
    (2, 'Salad', 8.00),
    (3, 'Pasta', 12.00),
    (4, 'Pizza', 15.00),
    (5, 'Sandwich', 6.00),
    (6, 'Soup', 7.50),
    (7, 'Steak', 20.00),
    (8, 'Fish and Chips', 14.00),
    (9, 'Sushi', 18.00),
    (10, 'Tacos', 9.00),
    (11, 'Chicken Wings', 11.00),
    (12, 'Rice Bowl', 13.50),
    (13, 'Wrap', 7.00);
GO

ALTER TABLE Orders
ADD CONSTRAINT FK_Order_Item
FOREIGN KEY (item_id)
REFERENCES Menu(item_id);
go

-- Представление для отображения информации о заказах
CREATE VIEW OrderDetails AS
SELECT o.order_id, c.name AS client_name, e.name AS employee_name, o.order_date, o.total_amount
FROM Orders o
JOIN Clients c ON o.client_id = c.client_id
JOIN Employees e ON o.employee_id = e.employee_id;
go
-- Вывести информацию о заказах из представления OrderDetails
SELECT * FROM OrderDetails;
go

-- Представление для отображения меню и цен
CREATE VIEW MenuItems AS
SELECT item_id, item_name, price
FROM Menu;
go
-- Вывести меню и цены из представления MenuItems
SELECT * FROM MenuItems;
go

-- Представление для отображения информации о клиентах
CREATE VIEW ClientInfo AS
SELECT client_id, name, phone_number, address
FROM Clients;
go

-- Вывести информацию о клиентах из представления ClientInfo
SELECT * FROM ClientInfo;
go

-- Представление для отображения информации об администраторах
CREATE VIEW AdminInfo AS
SELECT admin_id, name, username
FROM Administrators;
go

-- Вывести информацию об администраторах из представления AdminInfo
SELECT * FROM AdminInfo;
go

create procedure add_client(
    @client_id int,
    @name varchar(50),
    @phone_number varchar(15),
    @address varchar(100)
)
as
begin
    insert into clients (client_id, name, phone_number, address)
    values (@client_id, @name, @phone_number, @address);
end;
go

create procedure update_client(
    @client_id int,
    @name varchar(50),
    @phone_number varchar(15),
    @address varchar(100)
)
as
begin
    update clients
    set name = @name, phone_number = @phone_number, address = @address
    where client_id = @client_id;
end;
go

create procedure delete_client(
    @client_id int
)
as
begin
    delete from clients
    where client_id = @client_id;
end;
go
---------------------

--создание функций
--Функция для подсчёта общей суммы заказов клиента
CREATE FUNCTION CalculateTotalOrdersAmount(@client_id INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @total_amount DECIMAL(10, 2);

    SELECT @total_amount = SUM(od.total_amount)
    FROM Orders od
    WHERE od.client_id = @client_id;

    RETURN @total_amount;
END;
GO
--Функция для поиска блюда по его цене:
CREATE FUNCTION SearchDishByPrice(@dish_price DECIMAL(10, 2))
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @item_name VARCHAR(50);

    SELECT @item_name = item_name
    FROM Menu
    WHERE price = @dish_price;

    RETURN @item_name;
END;
GO
--Функция для вычисления средней зарплаты сотрудников:
CREATE FUNCTION CalculateAverageSalary()
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @avg_salary DECIMAL(10, 2);

    SELECT @avg_salary = AVG(e.salary)
    FROM Employees e;

    RETURN @avg_salary;
END;
go

--Подсчитать общую сумму денег потраченных на заказы  для определенного клиента (например, клиента с ID = 13):
SELECT dbo.CalculateTotalOrdersAmount(13);
go
--Найти название блюда по его цене, например, для блюда с ценой 7.50:
SELECT dbo.SearchDishByPrice(7.50);
go
--Вычислить среднюю зарплату всех сотрудников:
SELECT dbo.CalculateAverageSalary();
go

--оператор лайк
SELECT * FROM Clients WHERE name LIKE '%Jo%';
GO
SELECT * FROM Menu WHERE price > 10.00;
GO

--Поиск значений, начинающихся с определенной строки:
SELECT * FROM Employees WHERE name LIKE 'T%'; -- Найти всех сотрудников, имена которых начинаются с буквы 'T'
GO

--Поиск значений, заканчивающихся определенной строкой:
SELECT * FROM Clients WHERE name LIKE '%Smith'; -- Найти всех клиентов, имена которых заканчиваются на 'Smith'
GO

--Поиск значений, содержащих определенную строку в середине:
SELECT * FROM Menu WHERE item_name LIKE '%Pizza%'; -- Найти блюда, название которых содержит слово 'Pizza'
GO

--создание триггеров
--Триггер для автоматического установления даты заказа при вставке новой записи:
CREATE TRIGGER SetOrderDate
ON Orders
AFTER INSERT
AS
BEGIN
    UPDATE Orders
    SET order_date = GETDATE()
    FROM Orders
    JOIN inserted ON Orders.order_id = inserted.order_id;
END;
GO
--Триггер, который добавляет нового клиента в таблицу Clients при добавлении нового заказа, если такого клиента еще нет в базе данных:
CREATE TRIGGER AddNewClient
ON Orders
AFTER INSERT
AS
BEGIN
    INSERT INTO Clients (client_id, name, phone_number, address)
    SELECT client_id, 'New Client', '111111111', '123 New St'
    FROM inserted
    WHERE client_id NOT IN (SELECT client_id FROM Clients);
END;
GO
--Триггер, который при обновлении должности сотрудника автоматически изменяет его зарплату в таблице Employees.
CREATE TRIGGER UpdateSalaryOnPositionChange
ON Employees
AFTER UPDATE
AS
BEGIN
    UPDATE e
    SET salary = 
        CASE 
            WHEN i.position = 'Chef' THEN 5000
            WHEN i.position = 'Waiter' THEN 2000
            WHEN i.position = 'Bartender' THEN 2500
            ELSE 0
        END
    FROM Employees e
    INNER JOIN inserted i ON e.employee_id = i.employee_id;
END;

--создание пользователей с разными правами и нах в одной группе
--Создать группу пользователей и предоставить права на таблицы
CREATE ROLE TableAccessGroup;
GRANT SELECT, INSERT, UPDATE, DELETE ON Administrators TO TableAccessGroup;
GRANT SELECT, INSERT, UPDATE, DELETE ON Clients TO TableAccessGroup;
GRANT SELECT, INSERT, UPDATE, DELETE ON Employees TO TableAccessGroup;
GRANT SELECT, INSERT, UPDATE, DELETE ON Orders TO TableAccessGroup;
GRANT SELECT, INSERT, UPDATE, DELETE ON Menu TO TableAccessGroup;

--Создать пользователя с правами на таблицы из группы TableAccessGroup
CREATE LOGIN UserWithFullAccess WITH PASSWORD = 'KrutoiChelSoVsemiPravami';
CREATE USER UserWithFullAccess FOR LOGIN UserWithFullAccess;
ALTER ROLE TableAccessGroup ADD MEMBER UserWithFullAccess;

--Создать пользователя с правом только на просмотр данных
CREATE LOGIN UserWithReadOnlyAccess WITH PASSWORD = '12345';
CREATE USER UserWithReadOnlyAccess FOR LOGIN UserWithReadOnlyAccess;
GRANT SELECT ON Administrators TO UserWithReadOnlyAccess;
GRANT SELECT ON Clients TO UserWithReadOnlyAccess;
GRANT SELECT ON Employees TO UserWithReadOnlyAccess;
GRANT SELECT ON Orders TO UserWithReadOnlyAccess;
GRANT SELECT ON Menu TO UserWithReadOnlyAccess;

