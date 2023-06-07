CREATE TABLE Employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(255),
  manager_id INT
);

INSERT INTO Employees (employee_id, employee_name, manager_id)
VALUES
(1, 'Boss', 1),
(3, 'Alice', 3),
(2, 'Bob', 1),
(4, 'Daniel', 2),
(7, 'Luis', 4),
(8, 'Jhon', 3),
(9, 'Angela', 8),
(77, 'Robert', 1);

-- Write an SQL query to find employee_id of all employees that directly or indirectly report their work to the head of the company.

WITH RECURSIVE EmployeeHierarchy AS (
  SELECT employee_id, manager_id
  FROM Employees
  WHERE employee_id = 1 -- Assuming employee_id 1 is the head of the company

  UNION ALL

  SELECT E.employee_id, E.manager_id
  FROM Employees E
  INNER JOIN EmployeeHierarchy EH ON E.manager_id = EH.employee_id
  WHERE EH.manager_id IS NOT NULL
)
SELECT employee_id
FROM EmployeeHierarchy;

with cte as(
select e.employee_Id as employee_id ,e.manager_Id as manager_id,m.manager_id as senior_manager,sm.manager_id as head_manager
from employees e inner join employees m
on e.manager_id=m.employee_id inner join employees sm
on m.manager_id=sm.employee_id inner join employees ssm 
on sm.manager_id=ssm.employee_id
)
select employee_Id from cte
where employee_id <> manager_id and (manager_id=1 or senior_manager=1 or head_manager=1);