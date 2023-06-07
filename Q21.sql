

CREATE TABLE Employee (
  employee_id INT PRIMARY KEY,
  team_id INT
);

INSERT INTO Employee (employee_id, team_id) VALUES
(1, 8),
(2, 8),
(3, 8),
(4, 7),
(5, 9),
(6, 9);

select * from employee;

#Q21Write an SQL query to find the team size of each of the employees. Return result table in any order.


SELECT employee_id, team_size
FROM (
  SELECT employee_id, team_id, COUNT(*) OVER (PARTITION BY team_id) AS team_size
  FROM Employee
) subquery
ORDER BY employee_id;

