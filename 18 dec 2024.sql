use shield;
CREATE TABLE Avengers(
  ar_id int PRIMARY key AUTO_INCREMENT,
  f_name varchar(30),
  l_name varchar(30),
  heroic_name varchar(30),
  city varchar(30));
 

INSERT INTO Avengers(f_name,l_name,heroic_name,city)
VALUES('Roger','Steve','Captain America','NYC'),
        ('Tony','Stark','Iron Man','NYC'),
      ('Thor','Odinson','Thor','NYC'),
      ('Peter','Parker','Spider-Man','NYC'),
      ('Scott','Lang','Ant-Man','California'),
      ('Stephen','Strange','Dr.Strange','Florida'),
      ('James','Barnes','Winter Soldier','California');
      
    

CREATE TABLE avengeraudit(
audit_id INT PRIMARY KEY AUTO_INCREMENT,
ar_id INT,
heroic_name VARCHAR(30),
action VARCHAR(30),
action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

-- ====== insert

DELIMITER //
DROP TRIGGER SHIELD.log_avenge_before_insert;
CREATE TRIGGER log_avenge_before_insert
BEFORE INSERT ON avengers
FOR EACH ROW
BEGIN
 INSERT INTO avengeraudit(ar_id,heroic_name,action,action_time)
 VALUES(NEW.ar_id,NEW.heroic_name,'BEFORE INSERT',NOW());
 
 END//
 
 DELIMITER ;
 
 INSERT INTO avengers(ar_id,f_name,l_name,heroic_name,city)
 VALUES (9,'NATASHA','ROMAN-OFF','BLACKWINDOW','RUSSIA');
 
 SELECT * FROM avengers;
 SELECT * FROM avengeraudit;
 
 -- ===== update
DELIMITER //

CREATE TRIGGER log_avenger_before_update
BEFORE UPDATE ON avengers
FOR EACH ROW
BEGIN
IF OLD.city != NEW.city THEN
 
 INSERT INTO avengeraudit(ar_id,heroic_name,action,action_time)
 VALUES (OLD.ar_id,NEW.heroic_name,'BEFORE UPDATE',NOW());
 
END IF;

END//

DELIMITER ;

UPDATE avengers
SET city='los angles'
WHERE f_name ='tony';

SELECT * FROM avengers;
SELECT * FROM avengeraudit;

-- =====delete

CREATE TRIGGER log_avenge_before_delete
BEFORE DELETE ON avengers
FOR EACH ROW
BEGIN
 INSERT INTO avengeraudit(ar_id,heroic_name,action,action_time)
 VALUES(OLD.ar_id,OLD.heroic_name,'BEFORE DELETE',NOW());
 
 END//
 
 DELIMITER ;
