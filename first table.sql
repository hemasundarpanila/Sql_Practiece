create database hema;
create table shiva(sno int,sname varchar(50),branch varchar(50),marks int,location varchar(50));
select*from shiva;
show tables;
update shiva set location='hyb' where sid=2;
 RENAME TABLE shiva.shiva TO shiva.nani;
 drop table shiva;
 show tables;
 show databases;
 use hema;
 create table nani(sno int,sname varchar(50),branch varchar(50),marks int,location varchar(50));
 select*from nani;
 update nani set location='hyderabad' where sno=2;
 insert into nani values(1,'Amit','CSE',85.5,'Hyderabad'),(2,'Neha','ECE',78,'Chennai'),(3,'Rahul','CSE',85.5,'Hyderabad')
,(4,'Priya','EEE',92,'Bangalore'),(5,'Kiran','MECH',67.5,'Hyderabad'),(6,'Sneha','CSE',78,'Chennai'),(7,'Arjun','ECE',85.5,'Delhi'),
(8,'Pooja','EEE',85.5,'Delhi'),(9,'Vikas','MECH',67.5,'Hyderabad'),(10,'Anjali','CSE',88,'Mumbai'),(11,'Rohit','ECE',78,'Chennai'),
(12,'Divya','EEE',92,'Bangalore'),(13,'Surash','MECH',67.5,'Hyderabad'),(14,'Kavya','CSE',85.5,'Delhi'),(15,'Manoj','ECE',92,'Bangalore'),
(16,'Nisha','EEE',78,'Chennai'),(17,'Tarun','MECH',67.5,'Hyderabad'),(18,'Meena','CSE',92,'Bangalore'),(19,'Deepak','ECE',85.5,'Delhi')
,(20,'Swathi','EEE',88,'Mumbai');


-- 1) write a query to display student details 
-- 2) write a query to change location value to 'Hyd' whose id is 2.
-- 3) write a query to display Marks with unique and duplicates only once.
-- 4) write a query to insert student id, student name and branch values.
-- 5) write a query to remove student details with id 3.
-- 6) write a query to change branch to 'ece' and location to 'banglore' whose id is 1
-- 7) write a query to display student details who are from 'cse' branch.
-- 8) write a query to display student name, branch, marks with column name 'Total_Marks'.
 
 
alter table nani rename column sno to sid;
select distinct marks from nani;
insert into nani (sid,sname,branch) values(21,'shiva','csm'); 
select*from nani;
delete from nani where sid=3;
update nani set branch='ece',location='banglore' where sid=1;
select*from nani where branch='cse';
select sname,branch,total_marks from nani ;
alter table nani rename column marks to total_marks;
alter table nani rename column total_marks to marks;

-- 1) write a query to display student details whose id is even number.
-- 2) write a query to display student name, branch, double of their marks.
-- 3) write a query to display student details who scored less than 70 marks.
-- 4) write a query to display student details who scored other than 84 marks.


select*from nani where sid%2=0;
select sname,branch,marks*2 as new_marks from nani;
select sname,marks from nani;
select*from nani where branch='cse';
select*from nani where marks<70;
select*from nani where marks<>86;

-- 1) waq to display student details who scored more than 60 marks and branch is cse.
-- 2) waq to display student name, branch, marks whose id is either 1 or 2 and branch is ece.
-- 3) waq to display student details who scored in the range of 40 to 70.
-- 4) waq to display student details whose branch is either cse or ece or eee and who don't have location 
-- 5) waq to display student details who are studying branches other than cse and ece.

select*from nani where branch='cse' and marks>60;
select*from nani;
select sname,branch,marks from nani where (sid=1 or sid=2) and branch='ece';
select*from nani where branch in ('cse','ece','eee','csm') and location is null;
select*from nani where branch not in ('cse','ece');


alter table nani add column date_of_join date;
update nani set date_of_join=case(sid)
when 1 then '2024-12-15'
 when 2 then '2025-06-13'
 when 3 then '2018-02-27'
 when 4 then '2020-04-21'
 when 5 then '2019-08-20'
 when 6 then '2018-10-02'
 end;
 alter table nani drop column date_of_joining;
 update nani set date_of_join='2025-09-11' where sid=7;
 
 -- 1) waq to display student details whose name has letter 'a' in last but one position.
-- 2) waq to display student details whose name has letter 'a' for atleast two times.
-- 3) waq to display student details whose name has letter 'a' for exactly 2 times.
-- 4) waq to display student details who joined after 2023 year.
-- 5) waq to display student details who joined in 2024 year 
-- 6) waq to display student details who joined in April month of any year.
-- 7) waq to display student details whose branch name has character '_'.
-- 8) waq to display student details whose name starts with an vowel.
--  

select*from nani where sname like '%a';
select*from nani where sname like '%a%a%';
insert into nani values(22,'abhiramsai','csm',86,'andra','2024-03-08');
select*from nani where sname like '%a%a%' and sname not like '%a%a%a%'; 
select*from nani where date_of_join >='2024-01-01';
select*from nani where year(date_of_join)=2024;
select*from nani where month(date_of_join)=4 and year(date_of_join)=2020;
update nani set branch='ai_ml' where sid=21;
select*from nani where branch like '%\_%';
select*from nani;
select*from nani where sname like 'a%' or 'e%' or 'i%' or 'o%' or 'u%';
select marks,case
when marks>70 then 'good'
when marks between 40 and 70 then 'ok'
else 'improve'
end as remark from nani;
select marks,case(marks%2)
when 0 then 'even'
when 1 then 'odd'
end as type_of_num from nani;
update nani set marks=83 where sid=21;

-- ------------- --all,any,exist----- ----------

select*from	 nani;
select*from nani where marks>=all (select marks from nani where branch='mech');
select*from nani where marks>any (select marks from nani where branch='ece');
select*from nani where marks>all(select marks from nani where branch='ece');
select*from nani where marks<all(select marks from nani where branch='eee');
select*from nani where exists(select*from nani where branch='csm');
select count(*) as no_rows from nani;
select sum(marks) as total from nani;
select avg(marks) as average from nani;
select min(marks) as minimum_value from nani;
select max(marks) as maximum  from nani where branch='cse'; 
select max(branch) as highest_branch from nani;
select count(*) as total_count from nani where branch='mech';
select sum(marks) as sub_marks from nani where branch='cse';
select avg(coalesce(marks,87)) as average from nani;
select branch,sum(marks)from nani where location in ('hyderabad','chennai') group by branch having  sum(marks)>50;
select location ,sum(marks) from nani group by location having sum(marks)>200;
select*from nani where sname like '%a';
select*from nani;
use hema;
select*from nani where sname like '%a%a%';
select*from nani where sname like '%a%a%'  and sname not like '%a%a%a%';
select*from nani where sname like '%a__';
select*from nani where date_of_join>('2023-01-01');
select*from nani where year(date_of_join)=2024;
select*from nani where month(date_of_join)=4 and year(date_of_join)=2020;
select*from nani where branch like '%\_%';
select*from nani where sname like 'a%' or 'e%' or 'i%' or 'o%' or 'u%';
select sum(marks) as total from nani where branch='cse';

select count(*) as rows_total from nani where location='hyderabad';
select coalesce(location,'hyd') as total from nani;
select branch,sum(marks) as total from nani group by branch;
select branch,count(*) as row_total from nani group by branch;
select location,sum(marks) as total from nani group by location having sum(marks)>200;
select*from nani;

-- 1) WAQ to display the branch name and the highest marks in the branch as highest marks.
-- 2) WAQ to display the no of students studying in each branch.
-- 3) WAQ to display the no of people coming from the same location such that they should be atleast two people.
-- 4) WAQ to display the student details in the descending order of their marks.
-- 5) WAQ to display the 2nd, 3rd, 4th highest marks.
-- 6) WAQ to display the number of different branches.
-- 7) WAQ to display the branch, number of students joined in each branch of 2025 year.
-- 8) WAQ to display display branch, average marks in each branch by ignoring who scored less than 35 marks such that they should have atleast average value 60 and display in descending order of those marks.
-- 9) WAQ to display branch, year and number of students joined in the month of May, June, July of every year and display number in descending order.
-- 10) WAQ to display what percent of students are from 'cse' branch.
-- Try these queries
select*from nani;
select branch,max(marks) as total_marks from nani group by branch;
select branch,count(*) as total_students from nani group by branch;
select location,count(*) as same_location from nani group by location having count(*)>2;
select *from nani order by  marks asc;
select *from nani order by marks desc limit 3 offset 1;
select count(distinct branch) as no_of_branch from nani;
select branch,count(*) as total_students from nani where year(date_of_join)=2025 group by branch;
select branch,avg(marks) from nani where marks>=35 group by branch having avg(marks)>60 order by avg(marks) desc;
select branch ,year(date_of_join) as year_value,count(*) as no_of_students from nani where month(date_of_join)in(5,6,7)
group by branch,year(date_of_join) order by count(*) desc; 
select avg(case when branch ='cse' then 1 else 0 end)*100 as cse_percent from nani;
use hema;
select branch,year(date_of_join) as year_value,count(*) as no_student from nani where month(date_of_join)in(5,6,7)
group by branch,year(date_of_join) order by count(*) desc;



-- -----------Basic SELECT------------

select*from nani;
select sname from nani;
select *from nani where marks>80;
select*from nani where marks=92;
select*from nani where location='hyderabad';
select*from nani where branch='cse' or branch='ece';

-- -------------Distinct-------------
select distinct branch from nani;
select distinct location from nani;
select distinct marks from nani;
select distinct branch,location from nani;

-- ------------------where+operators------------
select *from nani where marks between 80 and 90;
select*from nani where marks<>86;
select*from nani where branch<>'cse';
select*from nani where marks>=85;

-- --------------------like-----------------
select*from nani where sname like 'a%';
select*from nani where sname like '%i%';
select*from nani where sname like '_____';
select*from nani where branch like 'c%';
select*from nani where location like '%del%';

-- -------------between/in--------------
select*from nani where marks between 80 and 90;
select*from nani where branch in('cse','ece','eee');
select*from nani where location in('hyderabad','bangalore');

-- -------------order-------------
select*from nani order by marks asc;
select*from nani order by sname;
select*from nani order by branch desc,marks asc;

-- -----------update/delete------
update nani set location='hyderabad' where branch='cse';
select*from nani;
update nani set marks=90 where sid=21;
update nani set branch='cse' where sname='shiva';
update nani set marks=92 where location='bangalore';
delete from nani where sid=21;

-- --------------alias/column----------
select sname,branch,marks  as total_marks from nani;
select sname as student_name ,branch as department from nani;
select*, sname as student_name from nani;


-- ------------any/all--------------
select*from nani where marks>all(select marks from nani where branch='cse');
select *from nani where marks>any(select marks from nani where branch='cse');
select*from nani where marks=any(select marks from nani  where branch='cse');
select*from nani where marks<all(select marks from nani where branch='cse');
select*from nani where exists(select*from nani where branch='ece');
select*from nani where exists(select*from nani where marks=92);
use hema;
select*from nani;
-- --------------aggregate functions-------------
select max(marks) from nani;
select min(marks) from nani;
select sum(marks)from nani;
select avg(marks)from nani;
select count(distinct(branch)) from nani;
select count(*)as total_count from nani where marks>80;
select count(*) from nani where branch='cse';
select max(marks)from nani where branch='cse';
select max(marks)from nani where location='hyderabad';
select count(*)from nani where marks>70;

-- ------------group by-----------
select branch,count(*)from nani group by branch;
select branch,min(marks)from nani group by branch;
select location,count(*)from nani group by location;
select branch,count(*)from nani group by branch having count(*)>2;
select branch,avg(marks)from nani group by branch having avg(marks)>85;
select branch,(avg(marks))from nani group by branch order by avg(marks) desc limit 2;
select branch,max(marks)from nani group by branch order by max(marks) desc limit 1;
select avg(marks) from nani where not branch='cse';

use hema;
select*from nani;

-- ------------------date--------------
select*from nani where year(date_of_join)=2024;
select*from nani where month(date_of_join)=4;
select*from nani where date(date_of_join)>'2020-01-01';
select*from nani where date(date_of_join) between '2020-01-01' and '2025-01-01';
update nani set date_of_join='2025-12-23' where sid=1;
update nani set date_of_join=case sid-- 
when 8 then '2022-09-21'
when 9 then '2010-08-16'
when 10 then '2005-10-19'
when 11 then '2004-09-11'
when 1 then '2024-12-15'
 when 2 then '2025-06-13'
 when 3 then '2018-02-27'
 when 4 then '2020-04-21'
 when 5 then '2019-08-20'
 when 6 then '2018-10-02'
 end;
 
 select marks,case
 when marks>90 then 'excellent'
 when marks between 80 and 89 then 'very good'
 when marks between 70 and 79 then 'good'
 when marks<70 then 'average'
 end as grade from nani;
 
 
 use hema;
 select*from nani;
 select branch,sum(marks) as total_marks from nani group by branch;
 select*from nani order by marks desc;
 select*, dense_rank() over(order by marks desc) as row_wise from nani;
 select*,dense_rank() over(order by marks desc) as row_wise from nani  row_wise=2;
 select max(marks) as maximam  from nani where marks <(select max(marks) from nani);
 select branch,sum(marks) as total from nani group by branch;
 select branch ,sum(marks) as total from nani group by branch having sum(marks)>500;
 select location,max(marks) as total
 from nani
 group by location
 having max(marks)>50;
 select*,rank() over(order by marks desc) as r1 from nani;
 select*,dense_rank() over(order by marks desc) as r2 from nani;
 select*,percent_rank() over(order by marks desc) as pr from nani;
 select*,ntile(4) over(order by marks desc) as re from nani;
 insert into nani values(3,'shivamani','csm',78,'andhrapradesh','2020-09-09');
 select*from
 (select*,row_number() over(order by marks desc) as ranks from nani)as t1
 where ranks=3;
 select*from
 (select*, row_number() over(partition by branch order by marks desc)as ranks from nani)as t1
 where ranks=2;
 select*from
 (select*, row_number() over(partition by location order by marks desc)as ranks from nani)as t1
 where ranks=1;
 select*from
 (select*,row_number() over(partition by branch order by date_of_join)as details from nani)
 as t1 where details<=2;
 
 select*from
 (select*,row_number() over(partition by location)as details from nani)
 as t1 where details=1;
 select*,lag(marks,3) over(order by marks)as r1 from nani;
 select*,last_value(marks) over(order by marks desc)as r1 from nani;
 select*,row_number() over(order by marks desc)as ranks from nani;
 select*from
 (select*,row_number() over(partition by branch order by marks desc)as details from nani)as t1 where details=1; 
select*,avg(marks) over()as details from nani;
select*,avg(marks) over(partition by branch) as r1 from nani;
select*,count(*) over(partition by branch) as r1 from nani;
select*,lag(marks) over(order by marks desc)from nani;
select*,lag(marks) over(order by marks desc)as val ,
marks-lag(marks) over(order by marks desc)as diff from nani;

select * from (
select *, dense_rank()
over (order by marks desc) as r1
from nani) as t1
where r1=3;
with t as(
select*,dense_rank() over(partition by branch order by marks desc)as total from nani)
select*from t where total=1;

with shiva as(
select*,row_number() over(partition by location order by marks desc)as t1 from nani)
select*from shiva where t1=2;
create view s2 as
select*from(
select*,rank() over(partition by branch order by marks)as t1 from nani)as s1 where t1=2;
select*from s2;

select count(*) from nani as t1 ; 
select*from nani;
show databases;
use hema;
CREATE TABLE emp(
    emp_id INT,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT
);

INSERT INTO emp VALUES
(1, 'Ravi', 40000, 101),
(2, 'Priya', 50000, 102),
(3, 'Arjun', 45000, 101),
(4, 'Sneha', 60000, 103),
(5, 'Kiran', 35000, NULL),
(6, 'Rahul', 55000, 104),
(7, 'Anjali', 48000, 105);

CREATE TABLE dept(
    dept_id INT,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO dept VALUES
(101, 'CSE', 'Hyderabad'),
(102, 'ECE', 'Chennai'),
(103, 'EEE', 'Bangalore'),
(104, 'MECH', 'Delhi'),
(106, 'CIVIL', 'Mumbai');
show tables;
select*from emp;
select*from dept;
select*from emp
left join dept
on emp.emp_id=dept.dept_id;

use hema;
select*from nani;
select*from nani where sid%2=0;
select sname,branch,marks*2 from nani;
select*from nani where marks<70;
select*from nani where marks>60 and branch="cse";
select sid,sname,branch,marks from nani where (sid=1 or sid=2) and branch="ece";
select*from nani where marks between 70 and 90;
select*from nani where branch in('cse','ece','eee') and location is null;
delete location from nani where sid=7;
update nani set location=null where sid=7;
select*from nani where branch in("cse","ece");
update nani set date_of_join='2004-09-11' where sid=7;

update nani set date_of_join=case 
when 8 then '2022-09-21'
when 9 then '2010-08-16'
when 10 then '2005-10-19'
end;
select*from nani;

update nani set date_of_join=case sid
when 8 then '2022-09-21'
when 9 then '2010-08-16'
when 10 then '2005-10-19'
when 11 then '2004-09-11'
when 1 then '2024-12-15'
 when 2 then '2025-06-13'
 when 3 then '2018-02-27'
 when 4 then '2020-04-21'
 when 5 then '2019-08-20'
 when 6 then '2018-10-02'
 end;

update nani set date_of_join=case sid
when 12 then '2020-12-23'
when 13 then '2024-08-13'
end;
select distinct marks from nani order by marks desc limit 1 offset 1;
select*from nani where sname like '%a%a%';
select*from nani where sname like '%a%a%' and sname not like '%a%a%a%';
select*from nani where date_of_join>='2024-01-01';
select*from nani;
select*from nani where date_of_join between '2024-01-01' and '2024-12-31';
select*from nani where year(date_of_join)='2004';

select branch,max(marks) from nani group by branch having max(marks)>90;
select branch,count(*) from nani group by branch;
select location,count(*) as loc_wise from nani  group by location having count(*)>2;
select *from nani order by marks ;
select distinct marks from nani order by marks desc limit 3 offset 0;
select count(distinct branch) as total from nani;
select branch,count(*) from nani where year(date_of_join)='2025' group by branch;

select*from nani;
use hema;
select branch,max(marks) from nani group by branch;
select branch,count(*) from nani group by branch;
select location,count(*) from nani group by location having count(*)>2;
select*from nani order by marks desc;
select distinct marks from nani order by marks desc limit 3 offset 0;
select count(distinct branch) from nani;
select branch,count(*) from nani where year(date_of_join)='2024' group by branch;
select branch,avg(marks)from nani group by branch having avg(marks)>85 order by avg(marks) desc;
select branch,year(date_of_join)as data1, count(*)as data2 
from nani where month(date_of_join)in(5,6,7) group by branch,year(date_of_join);

select avg(case when branch='cse' then 1 else 0 end)*100 from nani;
select*,rank() over(order by marks desc) from nani;
select*,rank() over(partition by location order by marks desc) from nani;

select*,rank() over(order by marks desc) from nani;
select*,dense_rank() over(order by marks desc) from nani;
select*from(
select*,row_number() over(partition by branch order by marks desc) as data1 from nani)as data2 where data1=1;
select*from(
select*,dense_rank() over(partition by branch order by marks desc)as data1 from nani) as data2 where data1=2;
select*from(
select*,row_number() over(partition by branch order by marks desc)as data1 from nani) as data2 where data1<=2;
select*from(
select*,row_number() over(partition by location order by date_of_join)as data1 from nani)as data2 where data1=1;
use hema;
select*from nani;
update nani set date_of_join='2004-09-11' where sid=7;
select*,last_value(marks) over()as t1 from nani;
SELECT *,
       LAST_VALUE(marks) OVER(
           ORDER BY marks DESC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS t1
FROM nani;

select*from(
select*,row_number() over(partition by location order by marks desc) as data1 from nani)as data2;

with t as
(select*,row_number() over(partition by location order by marks desc) as data1 from nani) select*from t;

select*from(
select*,row_number() over (partition by marks order by marks desc)as data1 from nani)as data2;


create view data2 as
select sname,marks,branch from nani;

select*from data2;
update data2 set branch='ECE' where sname='amit';
create view data3 as 
select branch,count(*)
 from nani group by branch;
select*from data3;

use hema;
show tables;
select*from dept;
drop table dept;
create table dept (did int primary key,dname varchar(50),loc varchar(50));
insert into dept values(10,'support role','banglore'),(20,'developer','hyderabad'),(30,'testing','mumbai'),(40,'hr','delhi');

create table emp (eid int primary key,ename varchar(50),branch varchar(50),marks int,doj date,mgrig int,sal int,deptno int,
foreign key(deptno) references dept(did));
select*from emp;
INSERT INTO emp 
VALUES
(101, 'A', 'ECE', 60, '2018-12-07', 109, 800, 20),
(102, 'B', 'CIVIL', 75, '2018-02-18', 104, 1600, 30),
(103, 'C', 'CSE', 50, '2017-04-17', 105, 1250, 30),
(104, 'D', 'ECE', 80, '2022-07-13', 109, 2850, 20),
(105, 'E', 'ME', 75, '2024-01-01', 107, 2350, 10),
(106, 'F', 'CSE', 95, '2023-12-13', NULL, 1300, 20),
(107, 'G', 'CIVIL', 67, '2020-09-05', 102, 950, 30),
(108, 'h', 'CSE', 25, '2021-11-01', 104, 500, 20),
(109, 'I', 'ECE', 38, '2019-06-10', 105, 1100, 10),
(110, 'J', 'EEE', 48, '2017-07-26', 102, 2400, null);
select*from emp;
select*from dept;
select*from emp where sal<(select sal from emp where ename='B');
select ename,deptno from emp where deptno=(select deptno from emp where ename='c');
select ename,doj from emp where doj>(select doj from emp where ename='j');
select*from emp where ename=(select ename from emp where ename='e');

select eid,ename,sal*12 from emp where sal*12>(select sal*12 from emp where ename='a');
select*from emp where sal<(select sal from emp where ename='b');
select ename,deptno from emp where deptno=(select deptno from  emp where ename='c');
select ename,sal from emp where sal<1600;
select ename,deptno from emp where deptno=(select deptno from emp where ename='c');
select ename,doj from emp where ename>'j';
select ename,doj from emp where doj>(select doj from emp where ename="j");
select*from emp where deptno=(select deptno from emp where ename='e');
select ename,sal,deptno from emp where sal>1500 and branch=(select branch from emp where ename='i');
select*from emp where sal>(select sal from emp where ename='b')and sal<(select sal from emp where ename='e');
use hema;
select*from emp;
select*from dept;
select eid,ename,sal*12 as salary from emp where sal*12>(select sal*12 from emp where ename='a');
select*from emp;
select*from emp where sal>(select sal from emp where eid=(select mgrig from emp where ename='b'));
select*from emp where eid=(select mgrig from emp where ename='b');

select*from emp where eid=(select mgrig from emp where ename='b');
select*from emp;
select*from dept;
select*from emp where deptno=(select did from dept where loc='mumbai');
select*from emp where deptno=(select did from dept where dname='testing');
select*from emp where sal>(select avg(sal) from emp);

select*from emp as e1 where sal>(select avg(sal) from emp as e2 where e2.deptno=e1.deptno);

select*from nani;
select*from nani where branch=(select branch from nani where sid=1);
select*from nani where branch in](select branch from nani where sid=1 or sid=4);
select*from nani where (branch,location)in(select branch,location from nani where sid=1);
select*from nani where marks=(select max(marks)from nani where marks=(select max(marks) from nani));
select*from nani where marks=(select max(marks)from nani);
select*from nani where(branch,location)in(select branch,location from nani where sid=10);

select*from emp;
select*from dept;
select*from emp cross join dept;
select*from dept cross join emp;
select*from emp natural join dept;
select*from emp inner join dept on emp.deptno=dept.did;
select*from emp,dept where emp.deptno=dept.did;


-- Q1. Add a column age INT.

-- Q2. Add a column email VARCHAR(100).

-- Q3. Change the datatype of marks to DECIMAL(5,2).

-- Q4. Rename column location to city.

-- Q5. Drop the email column.

-- 🔥 Difficult

-- Q6. Add a column status VARCHAR(20) with default value 'active'.

-- Q7. Rename the table nani to student.

-- Q8. Add a column phone VARCHAR(15) after sname


use hema;
select*from nani;
alter table nani add column age int;
 alter table nani add column email varchar(100);
 alter table nani rename column location to loc;
 alter table nani modify marks  decimal(5,2);
 alter table nani drop column email;
 alter table nani add column status varchar(20) default 'active';
 alter table nani add phone varchar(15) after sname;

-- Q9. Display students whose marks are greater than 80.

-- Q10. Display students whose marks are less than 70.

-- Q11. Display students whose marks are between 70 and 90.

-- Q12. Display students belonging to CSE.

-- Q13. Display students belonging to CSE or ECE.

-- Q14. Display students who are not from CSE.

-- Q15. Display students whose names start with A.

-- Q16. Display students whose names end with a.

-- Q17. Display students whose names contain i.

-- 🔥 Difficult

-- Q18. Display CSE students whose marks are greater than 80.

-- Q19. Display students who are from Hyderabad or Delhi and have marks greater than 80.

-- Q20. Display students whose marks are not between 70 and 90.

select*from nani;
select*from nani where marks>80;
select*from nani where marks<70;
select*from nani where marks between 70 and 90;
select*from nani where branch='cse';
select*from nani where branch in('cse','ece');
select*from nani where not branch='cse';
select*from nani where sname like '%a';
select*from nani where sname like "%i";
select * from nani where marks>80 and branch='cse';
select*from nani where loc in('hyderabad','delhi') and marks>80;
select*from nani where marks not between 70 and 90;

select*from nani;
select max(marks) as data1 from nani ;
select avg(marks) as data1 from nani;
select sum(marks) as data1 from nani;
select count(sname) as data1 from nani;
select count(*) as data2 from nani where marks>80;
select avg(marks) from nani where branch='cse';
select sum(marks) from nani where loc='hyderabad';
select avg(marks) from nani where marks>80;

-- 1) write a query to display student details 
-- 2) write a query to change location value to 'Hyd' whose id is 2.
-- 3) write a query to display Marks with unique and duplicates only once.
-- 4) write a query to insert student id, student name and branch values.
-- 5) write a query to remove student details with id 3.
-- 6) write a query to change branch to 'ece' and location to 'banglore' whose id is 1
-- 7) write a query to display student details who are from 'cse' branch.
-- 8) write a query to display student name, branch, marks with column name 'Total_Marks'.

select*from nani;
update nani set loc='andra' where sid=2;
select distinct(marks) from nani;
delete from nani where sid=22;
update nani set branch='mech',loc='chennai' where sid=4;
select sname,branch,marks as total_marks  from nani;
 
 -- Q9. Display students whose marks are greater than 80.

-- Q10. Display students whose marks are less than 70.

-- Q11. Display students whose marks are between 70 and 90.

-- Q12. Display students belonging to CSE.

-- Q13. Display students belonging to CSE or ECE.

-- Q14. Display students who are not from CSE.

-- Q15. Display students whose names start with A.

-- Q16. Display students whose names end with a.

-- Q17. Display students whose names contain i.

-- 🔥 Difficult

-- Q18. Display CSE students whose marks are greater than 80.

-- Q19. Display students who are from Hyderabad or Delhi and have marks greater than 80.

-- Q20. Display students whose marks are not between 70 and 90.
 
 select*from nani where sid%2=0;
 select sname,branch,marks*2 from nani;
 select*from nani where marks<70;
 select*from nani where marks>60 and branch='cse';
 select sname,branch,marks from nani where (sid=6 or sid=7) and branch='ece'; 
 select*from nani where branch in('ece','cse','eee') and loc is null;
 select*from nani where branch not in ('cse','ece');
 alter table nani drop column date_of_join;
 select*from nani;
 alter table nani add column date_of_join date;
update nani set date_of_join='2024-12-15' where sid=1;
update nani set date_of_join='2004-09-11' where sid=7;
update nani set date_of_join=case sid
when 2 then '2025-12-13'
when 3 then '2018-06-14'
when 4 then '2020-04-21'
when 5 then '2019-08-20'
when 6 then '2018-10-02'
end ;
select*from nani;
select*from nani where year(date_of_join)>'2020';
select*from nani where month(date_of_join)=4;
select*from nani where sname like 'a%' or 'e%' or 'i%' or 'o%' or 'u%';

-- Q21. Find the maximum marks.

-- Q22. Find the minimum marks.

-- Q23. Find the average marks.

-- Q24. Find the total marks.

-- Q25. Count the total number of students.

-- Q26. Count the number of students who scored more than 80.

-- 🔥 Difficult

-- Q27. Find the average marks of CSE students.

-- Q28. Find the maximum marks of ECE students.

-- Q29. Find the total marks of students from Hyderabad.

-- Q30. Find the average marks of students whose marks are greater than 80.


-- Q31. Display each branch and the number of students.

-- Q32. Display each branch and average marks.

-- Q33. Display each branch and maximum marks.

-- Q34. Display each branch and minimum marks.

-- Q35. Display each location and number of students.

-- Q36. Display each location and average marks.

-- 🔥 Difficult

-- Q37. Display branches having more than 3 students.

-- Q38. Display branches whose average marks are greater than 80.

-- Q39. Display locations having more than 2 students.

-- Q40. Display branches where the maximum marks are greater than 90.

-- 5️⃣ HAVING
-- ⭐ Important

-- Q41. Display branches having more than 3 students.

-- Q42. Display branches having average marks greater than 80.

-- Q43. Display locations having more than 3 students.

-- 🔥 Difficult

-- Q44. Display branches having more than 3 students and average marks greater than 80.

-- Q45. Display branches whose minimum marks are greater than 70.

select branch,count(*) from nani  group by branch;
select branch,avg(marks) from nani group by branch;
select branch,max(marks) from nani group by branch;
select loc,count(*) from nani group by loc;
select branch,count(*) from nani group by branch having count(*)>3;
select branch,avg(marks) from nani group by branch having avg(marks)>80;
select loc,count(*) from nani group by loc having count(*)>3;
select *from nani order by marks asc;
select sname,marks from nani order by marks desc;

-- Q46. Display all students in ascending order of marks.

-- Q47. Display all students in descending order of marks.

-- Q48. Display names and marks ordered by marks descending.

-- Q49. Display students ordered alphabetically by name.

-- 🔥 Difficult

-- Q50. Display students ordered by branch ascending and marks descending.

-- Q51. Display students ordered by location ascending and marks descending.

-- Q52. Display students ordered by marks descending and name ascending.

-- 7️⃣ LIMIT + OFFSET
-- ⭐ Important

-- Q53. Display the top 3 students based on marks.

-- Q54. Display the top 5 students based on marks.

-- Q55. Display the lowest 3 students based on marks.

-- Q56. Display the second-highest student using LIMIT and OFFSET.

-- 🔥 Difficult

-- Q57. Display the third-highest student using LIMIT and OFFSET.

-- Q58. Display the 4th and 5th highest students.

-- Q59. Display the second page assuming each page contains 5 students.

select*from nani order by sname asc;
select*from nani order by branch desc,marks desc; 
select*from nani order by marks desc limit 3 offset 0;
select*from nani order by marks asc limit 3 ;
select*from nani order by marks desc limit 1 offset 4;
select*from nani order by marks desc limit 2 offset 4;
select*from nani order by marks desc limit 5 offset 5;

select*from nani;
use hema;
select*,rank() over(order by marks desc) from nani;
select*,dense_rank() over(order by marks desc) from nani;
select*from(
select*,dense_rank() over(order by marks desc)  as data1 from nani ) as t where data1=3;
select*from(
select*,dense_rank() over(partition by branch order by marks desc)as data1 from nani)as t where data1=2;
select*,row_number() over(order by marks desc) as data1 from nani;
select*from(
select*,row_number() over(partition by branch order by marks desc)as data1 from nani)as t where data1<=2;
select*,last_value(marks) over() as l1 from nani;
create view v1 as
select sid,sname,branch from nani;
select*from v1;
update v1 set branch='cse' where sid=1;
select*from nani;



select*from emp;
select*from dept;
select ename,dname from emp e inner join dept d on e.deptno=d.did;
select ename,deptno,dname from emp e inner join dept d on e.deptno=d.did;
select ename,dname from emp e inner join dept d on e.deptno=d.did where e.sal>1000;
select ename,doj,sal,dname from emp e inner join dept d on e.deptno=d.did where year(doj) in (2018,2019,2020);

select ename,branch,marks,dname from emp e inner join dept d on e.deptno=d.did where marks>50 and branch in('ece','civil','cse') order by marks desc;
select dname,count(*) as data1 ,deptno from emp e inner join dept d on e.deptno=d.did where sal>1000 
group by d.dname having count(*)>=2;



use hema;
CREATE TABLE flights (
    p_id INT,
    passenger_name VARCHAR(50),
    flight_id INT,
    ticket_status VARCHAR(20),
    fl_id INT PRIMARY KEY,
    airline VARCHAR(50),
    source VARCHAR(50),
    destination VARCHAR(50),
    departure DATETIME,
    arrival DATETIME,
    price DECIMAL(10,2),
    seats INT,
    status VARCHAR(20)
);
select*from flights;
INSERT INTO flights VALUES
(1, 'Amit', 101, 'Confirmed', 1001, 'IndiGo', 'Hyderabad', 'Delhi',
 '2026-09-10 06:30:00', '2026-09-10 08:45:00', 4500, 25, 'On Time'),
(2, 'Neha', 102, 'Confirmed', 1002, 'Air India', 'Mumbai', 'Bangalore',
 '2026-09-10 09:00:00', '2026-09-10 11:00:00', 3200, 45, 'On Time'),
(3, 'Rahul', 103, 'Cancelled', 1003, 'Vistara', 'Delhi', 'Mumbai',
 '2026-09-10 11:30:00', '2026-09-10 13:40:00', 5200, 18, 'Cancelled'),
(4, 'Priya', 104, 'Confirmed', 1004, 'IndiGo', 'Hyderabad', 'Mumbai',
 '2026-09-10 14:00:00', '2026-09-10 16:00:00', 6100, 12, 'Delayed'),
(5, 'Kiran', 105, 'Waiting', 1005, 'Air India', 'Chennai', 'Delhi',
 '2026-09-10 16:30:00', '2026-09-10 19:00:00', 3800, 55, 'On Time'),
(6, 'Sneha', 106, 'Confirmed', 1006, 'Vistara', 'Delhi', 'Bangalore',
 '2026-09-11 07:00:00', '2026-09-11 09:30:00', 7200, 8, 'Delayed');
 select*from flights;
 select passenger_name,airline,price from flights;
 select*from flights where source='hyderabad';
 select*from flights where destination ='delhi';
 select*from flights where price>4000;
 select*from flights where seats<30;
 select*from flights where price between 3000 and 6000;
 select*from flights where seats<30 and price>4000;
 select*from flights where source='delhi' or source='hyderabad';
 select*from flights where ticket_status='waiting';
 select*from flights where airline in('indigo','air india');
 select*from flights where passenger_name like 'a%';
 select max(price) as data1 from flights;
 select*from flights as data1 where max(price);
 select count(seats) from flights;
 select avg(price) from flights where seats>20;
 select airline,count(*) as data1 from flights group by airline;
 select airline,avg(price) as data2 from flights group by airline;
 select destination,count(*) as data1 from flights group by destination;
 select*from flights;
 select airline,count(*) from flights as data1 group by airline having count(*)>1;
 
select airline,avg(price) from flights as data1 group by airline having avg(price)>4000;
select source,count(*) from flights as data1 group by source having count(*)>1;
select airline,count(*) as data1 ,avg(price) as data2 from flights group by airline having count(*)>1 and avg(price)>4000;
select*from flights order by price asc;
select*from flights order by airline desc,price desc;
select*from flights order by price desc limit 2 offset 0;
select*from flights order by price asc limit 3 offset 0;

 
 










