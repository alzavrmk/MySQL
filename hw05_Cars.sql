CREATE DATABASE IF NOT EXISTS lesson_5_hw;

USE lesson_5_hw;

DROP TABLE IF EXISTS cars;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;


-- Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE OR REPLACE VIEW car_25000 AS
SELECT
	id,
    name,
    cost
FROM cars
WHERE cost < 25000
ORDER BY cost DESC;

SELECT *
FROM car_25000;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор OR REPLACE) 
CREATE OR REPLACE VIEW car_25000 AS
SELECT
	id,
    name,
    cost
FROM cars
WHERE cost < 30000
ORDER BY cost DESC;

SELECT *
FROM car_25000;

--	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE OR REPLACE VIEW car_Skoda_Audi AS
SELECT
	id,
    name,
    cost
FROM cars
WHERE name IN ("Skoda", "Audi");
SELECT *
FROM car_Skoda_Audi;






