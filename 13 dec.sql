use shield;

DELIMITER //

CREATE PROCEDURE processavenger(IN city_name VARCHAR (30))

BEGIN

DECLARE hero_name VARCHAR (30);
DECLARE done INT DEFAULT 0;

DECLARE avenger_cursor CURSOR FOR
SELECT heroic_name FROM avengers WHERE city=city_name;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN avenger_cursor;

heros:LOOP
FETCH avenger_cursor INTO hero_name;

IF done THEN
LEAVE heros;
END IF;

IF hero_name='caption america' THEN
DELETE FROM avengers WHERE ar_id=2;
END IF;

IF hero_name='thor' THEN
UPDATE avengers
SET city='kalyan'
WHERE f_name='thor';
END IF;

END LOOP;
 
CLOSE avenger_cursor;

END //

DELIMITER ;

CALL processavenger('nyc');

SELECT * FROM avengers; 



