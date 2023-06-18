CREATE DATABASE IF NOT EXISTS mobile_phone;
USE mobile_phone;
DROP TABLE IF EXISTS table_mobile_phone;
CREATE TABLE table_mobile_phone
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(50) NOT NULL,
    Manufacturer VARCHAR(50) NOT NULL,
    ProdactCount INT,
    Price INT
);
DESCRIBE table_mobile_phone;
INSERT table_mobile_phone(ProductName, Manufacturer, ProdactCount, Price)
VALUES
	("iPhoneX", "Apple", 3, 76000),
    ("iPhone8", "Apple", 2, 51000),
    ("GalaxyS9", "Samsung", 2, 56000),
    ("GalaxyS8", "Samsung", 1, 41000),
    ("P20Pro", "Huawei", 5, 36000);
SELECT * 
FROM table_mobile_phone;

SELECT ProductName, Manufacturer, Price 
FROM table_mobile_phone
WHERE ProdactCount > 2;
SELECT ProductName, Manufacturer, Price 
FROM table_mobile_phone
WHERE Manufacturer = "Samsung";
SELECT ProductName, Manufacturer, Price 
FROM table_mobile_phone
WHERE ProdactCount * Price > 100000 AND ProdactCount * Price < 145000;
SELECT ProductName, Manufacturer, Price 
FROM table_mobile_phone
WHERE ProductName LIKE "iPhone%";
SELECT ProductName, Manufacturer, Price 
FROM table_mobile_phone
WHERE ProductName LIKE "Galaxy%";
SELECT ProductName, Manufacturer, Price  
FROM table_mobile_phone
WHERE ProductName REGEXP '[[:digit:]]';
SELECT ProductName, Manufacturer, Price  
FROM table_mobile_phone
WHERE ProductName REGEXP '[[8]]';


