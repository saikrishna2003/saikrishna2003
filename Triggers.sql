#TRIGGERS IN SQL
create table student(st_roll int,age int,name varchar(30),namrk float);

delimiter //
create trigger mark_verify
before insert on student 
for each row
if new.namrk<0 then set new.namrk=50;
end if; //

insert into student values(501,10,'Hari',-22.5);

select * from student;