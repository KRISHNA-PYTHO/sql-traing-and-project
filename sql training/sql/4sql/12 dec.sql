use shield;

-- ===================== loop ==============================

delimiter //

create procedure printnumber()
begin
declare counter int default 0;

print_number:loop
select counter;

if counter>50 then 
leave print_number;
end if;

set counter = counter +5;
end loop ;
end //

delimiter ;

call printnumber();

-- ============ while loop =====================
delimiter //

create procedure whileloop(out total_sum int)
begin
declare counter int default 0;

set total_sum=0;

while counter<50 do
set total_sum =total_sum+counter;
set counter =counter + 5;
end while;

end //

delimiter ;

call whileloop(@total_sum);
select @total_sum;

-- ======== repeat =========
delimiter //

create procedure repeatloop(out product int)
begin

declare counter int default 1;

set product =1;


 REPEAT
 SET Product = product * counter;
 SET counter =counter + 1;
 UNTIL counter > 5
 END REPEAT;
 
 END//
 
 DELIMITER ;
 
 CALL repeatloop (@product);
 SELECT @product AS Total_Product;
