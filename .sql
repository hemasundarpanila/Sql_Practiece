create database shiva;
use shiva;
create table students(sid numeric,student_name varchar(30),branch varchar(40),marks numeric(5,2),location varchar(50));
select *from students;
show tables;
use shiva;
select *from students;
select *from movie;
show tables;
create database college;
use college;
drop database college;
show databases;
use shiva;
create table college(sid numeric,student_name varchar(50),branch varchar(10),marks numeric(5,2),location varchar(50));
insert into college values(1,'Amit','CSE',85.5,'Hyderabad'),(2,'Neha','ECE',78,'Chennai'),(3,'Rahul','CSE',85.5,'Hyderabad')
,(4,'Priya','EEE',92,'Bangalore'),(5,'Kiran','MECH',67.5,'Hyderabad'),(6,'Sneha','CSE',78,'Chennai'),(7,'Arjun','ECE',85.5,'Delhi'),
(8,'Pooja','EEE',85.5,'Delhi'),(9,'Vikas','MECH',67.5,'Hyderabad'),(10,'Anjali','CSE',88,'Mumbai'),(11,'Rohit','ECE',78,'Chennai'),
(12,'Divya','EEE',92,'Bangalore'),(13,'Surash','MECH',67.5,'Hyderabad'),(14,'Kavya','CSE',85.5,'Delhi'),(15,'Manoj','ECE',92,'Bangalore'),
(16,'Nisha','EEE',78,'Chennai'),(17,'Tarun','MECH',67.5,'Hyderabad'),(18,'Meena','CSE',92,'Bangalore'),(19,'Deepak','ECE',85.5,'Delhi')
,(20,'Swathi','EEE',88,'Mumbai');
select *from college;
select*from college where branch='cse';
alter table college rename column marks to total_marks;
update college set location='hyb' where sid=2;
select student_name,branch from college;
select distinct marks from college;
insert into college(sid,student_name,branch) values(4,'shiva','csm');
delete from college where sid=3;
update college set branch='ece',location='bangulure' where sid=1;
select student_name,branch,total_marks from college;
select*from college where sid%2=0;
select *from college;
show databases;
show tables;
use shiva;
select sid from college where sid%2=0;
select student_name,branch,total_marks*2 from college;
select*from college where total_marks<70;
select*from college where total_marks>84;
select*from college where branch='cse' and total_marks>60;
select*from college where sid=1 or sid=2 and branch='ece';
select*from college where total_marks between 40 and 70;
select*from college where branch='cse'or'ece'or'eee';
alter table college add column date_of_join date;
update college set date_of_join=case(sid)
when 1 then '2024-12-15'
when 2 then '2025-06-13'
when 3 then '2018-02-27'
when 4 then '2020-04-21'
when 5 then '2019-08-20'
when 6 then '2018-10-02'
end;
select student_name from college where student_name like '%a';
select student_name from college where student_name like '%a%a%';
select*from college where student_name like '%a%a%' and student_name not like '%a%a%a%';
select*from college where date_of_join>='2024-01-01';
select*from college where month (date_of_join)='4';
select*from college where student_name like 'a%' or student_name like 'e%' or student_name like 'i%' or student_name like 'o%' or student_name like 'u%';

