create table employee9(
employee_id int,
name varchar(30),
months int,
salary int);

select salary*months as earning,count(*) as no_of_employee
from employee9 where salary*months=(select max(salary*months) from employee9);