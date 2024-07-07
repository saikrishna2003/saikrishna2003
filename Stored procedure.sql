show databases;
use classicmodels;
select * from orderdetails;
select productCode,productname ,msrp from products where productcode in (select productcode from orderdetails where priceEach<100);

#STORE PROCEDURES
delimiter &&
create procedure top_products()
begin
select productName,productVendor,productDescription 
from products where quantityInStock>5000;
End &&
delimiter ;

call top_products();

#STORED PROCEDURE USING INPARAMETERS

delimiter //
create procedure sp_sortbyname(IN var int)
begin
select lastName,firstName,extension from employees
order by employeeNumber desc limit var;
end //
delimiter ;

call sp_sortbyname(3);

#STORED PROCEDURE TO UPDATE NAME
delimiter //
create procedure updatename2(
    IN tempname varchar(20), 
    IN newfname varchar(20)
)
begin
    update employees 
    set firstName = newfname
    where firstname = tempname;
end //
delimiter ;
select * from employees;
call updatename('Diane', 'Sai');

select * from orderdetails;
describe orderdetails;

delimiter //
create procedure updateqty1(in temp varchar(15),in newqty int)
begin
update orderdetails set quantityOrdered = newqty
where productCode = temp;
end; //

call updateqty1('S18_1749',35);
select * from orderdetails;


# STORED PROCEDURE USING OUT
 delimiter //
 create procedure countorder3(out total int)
 begin
 select orderNumber into total from orderdetails where priceEach>100 limit 1;
 end //
 delimiter ;
 
 call countorder2(@Counte);
 