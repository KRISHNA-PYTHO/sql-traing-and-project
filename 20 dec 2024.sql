use shield;
 DELIMITER //

CREATE TRIGGER log_avenger_after_insert
AFTER INSERT ON Avengers
FOR EACH ROW
BEGIN

INSERT INTO avengeraudit(ar_id,heroic_name,action,action_time)
VALUES(NEW.ar_id,NEW.heroic_name,'AFTER INSERT',NOW());

END //

DELIMITER ;
drop trigger shield.log_avenger_after_update;
INSERT INTO Avengers
VALUES(8,'clint','barten','hawekye','japan');
select * from avengeraudit;

-- ====== After Trigger For Update ======
DELIMITER //

CREATE TRIGGER log_avenger_after_update
AFTER UPDATE ON Avengers
FOR EACH ROW
BEGIN

IF OLD.f_name != NEW.f_name THEN
INSERT INTO avengeraudit(ar_id,heroic_name,action,action_time)
VALUES(OLD.ar_id,NEW.heroic_name,'AFTER UPDATE',NOW());
END IF;

END //

DELIMITER ;

UPDATE Avengers
SET f_name ='Bucky'
WHERE f_name='James';

select * from avengeraudit;

-- ====== After Trigger For Delete =====

DELIMITER //

CREATE TRIGGER log_avenger_after_delete
AFTER DELETE ON Avengers
FOR EACH ROW
BEGIN

INSERT INTO avengeraudit(ar_id,heroic_name,action,action_time)
VALUES(OLD.ar_id,OLD.heroic_name,'AFTER DELETE',NOW());

END //

DELIMITER ;

DELETE FROM Avengers WHERE ar_id=6;

SELECT * FROM Avengers;
SELECT * FROM Avengeraudit;

