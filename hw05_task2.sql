CREATE DATABASE IF NOT EXISTS hw_05_task2;
USE hw_05_task2;

DROP TABLE IF EXISTS hw_05_task2;
CREATE TABLE hw_05_task2
(
	TrainId INT PRIMARY KEY AUTO_INCREMENT,
    Station VARCHAR(20) NOT NULL,
    StationTime TIME NOT NULL
   -- TimeToNextStationInterval TIME 
);

INSERT INTO hw_05_task2 (Station, StationTime)
VALUES 
	("San Francisco", "10:00:00"),
    ("Redwood City", "10:54:00"),
    ("Palo Alto", "11:02:00"),
    ("San Jose", "12:35:00"),
    ("San Francisco", "11:00:00"),
    ("Palo Alto", "12:49:00"),
    ("San Jose", "13:30:00");
    
SELECT * FROM hw_05_task2;

 SELECT 
	TrainId,
    Station,
    StationTime,
    timediff(LEAD(StationTime) OVER w, StationTime) AS TimeToNextStationInterval
FROM hw_05_task2
WINDOW w AS (
    ORDER BY StationTime 
    ROWS UNBOUNDED PRECEDING 
);


SELECT 
	salary,
    post,
	CONCAT(firstname, " ", lastname) AS fullname,
    ROUND(AVG(salary) OVER w, 2) AS avg_salary
FROM staff
WINDOW w AS (
    ORDER BY salary DESC
    ROWS BETWEEN 1 PRECEDING -- предыдущая
    AND 1 FOLLOWING --  Между 1 предыдущей и 1 следующей
);


