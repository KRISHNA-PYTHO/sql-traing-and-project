use shield;
drop table avengers_enemy;
drop table weapon;
Delimiter //

create procedure AvengerAssemble()
begin

drop table if exists Avengers;

Create table Avengers(
ar_id int primary key auto_increment,
f_name varchar(30),
l_name varchar(30),
heroic_name varchar(30),
city varchar(30));

insert into Avengers(f_name,l_name,heroic_name,city)
values('roger','steve','caption america','nyc'),
('tony','stark','iron man',null),
('thor','odinson','thor','nyc'),
('peter','parker','spider man',null),
('scott','lang','ant-man','california'),
('stephen','strange','dr-strange','florida'),
('james','barnes','winter soldier',null);

select * from Avengers;

end//

delimiter ;

call AvengerAssemble;

-- ============== in parmeter========

delimiter //

create procedure getavengercity(in city_name varchar (30))
begin

select * from Avengers where city = city_name;

end//

delimiter ;

call getavengercity ('nyc');

-- ====================out parmeter====================

delimiter //

create procedure countavenger(in city_name varchar(30),out avenger_count

