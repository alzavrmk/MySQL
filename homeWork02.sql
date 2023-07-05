CREATE DATABASE IF NOT EXISTS homework02;
USE homework02;
DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE NOT NULL,
    CountProduct INT NOT NULL
);
INSERT INTO sales (OrderDate, CountProduct)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);
SELECT 
	Id AS "Id заказа",
	CASE
		WHEN countProduct <=100
			THEN "Маленький заказ"
		WHEN countProduct > 100 AND countProduct < 300
			THEN "Средний заказ"
		WHEN countProduct >= 300
			THEN "Большой заказ"
		ELSE "error"
	END AS "Тип заказа"
FROM sales;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeId VARCHAR(3) NOT NULL,
    Emount DECIMAL(7,2) NOT NULL,
    OrderStatus VARCHAR(9)   
);
INSERT INTO orders (EmployeeId, Emount, OrderStatus)
VALUES
	('e03', 15.00, "OPEN"),
    ('e01', 25.20, "OPEN"),
    ('e05', 015.70, "CLOSED"),
    ('e02', 22.18, "OPEN"),
    ('e04', 9.50, "CANCELLED");
SELECT 
		Id, -- AS, -- "Id заказа",
		EmployeeId, -- AS "ID работника",
        CASE 
			WHEN OrderStatus = "OPEN"
				THEN "Order is in open state"
			WHEN OrderStatus = "CLOSED"
				THEN "Order is closed"
			WHEN OrderStatus = "CANCELLED"
				THEN "Order is cancelled"
			ELSE "error"
		END AS "full_order_status"
FROM orders;