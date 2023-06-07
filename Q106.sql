create table employees1(
id int,
name varchar(30),
salary int);

insert into employees1 values(1,'Kristeen',1420);
insert into employees1 values(2,'Ashley',2006);
insert into employees1 values(3,'Julia',2210);
insert into employees1 values(4,'Maria',3000);



select  ceil(avg(salary)-avg(replace(salary,'0',''))) as avg_salary from employees1;