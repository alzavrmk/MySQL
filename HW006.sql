-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DROP PROCEDURE IF EXISTS timeConversion;
DELIMITER $$
CREATE PROCEDURE timeConversion
(
	num INT
)
BEGIN
	CASE
		WHEN num < 60 THEN
			SELECT CONCAT(num, ' ', 'seconds') AS Result;
        WHEN num >= 60 AND num < 3600 THEN
			SELECT CONCAT(' ', num DIV 60, 'minutes', MOD(num, 60), 'seconds') AS Result;
        WHEN num >= 3600 AND num < 86400 THEN
			SELECT CONCAT(' ', num DIV 3600, 'hours', MOD(num, 3600) DIV 60, 'minutes', MOD(MOD(num, 3600),60), 'seconds') AS Result;
        WHEN num >= 86400 THEN
			SELECT CONCAT(' ', num DIV 86400, 'days', MOD(num, 86400) DIV 3600, 'hours', MOD(MOD(num, 86400),3600) DIV 60, 'minutes',
                             MOD(MOD(MOD(num, 86400),3600),60), 'seconds') AS Result;
    END CASE;
END $$

DELIMITER ;
-- CALL second_counter(53);  
 CALL second_counter(3600);  
-- CALL second_counter(86300);  
-- CALL second_counter(86400);  

-- 2.	Выведите только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
DROP PROCEDURE IF EXISTS get_even;
DELIMITER $$
CREATE PROCEDURE get_even()
BEGIN
	DECLARE res VARCHAR(15);
	DECLARE i INT DEFAULT 2;
    SET res = "";
    WHILE  i <= 10 DO
        SET res = concat(res,' ', i);
        SET i = i + 2;
    END WHILE;
    SELECT res AS result;
END $$
DELIMITER ;
CALL get_even();
