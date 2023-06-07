CREATE TABLE Employees (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE EmployeeUNI (
  id INT,
  unique_id INT,
  PRIMARY KEY (id, unique_id)
);

INSERT INTO Employees (id, name) VALUES (1, 'Alice');
INSERT INTO Employees (id, name) VALUES (7, 'Bob');
INSERT INTO Employees (id, name) VALUES (11, 'Meir');
INSERT INTO Employees (id, name) VALUES (90, 'Winston');
INSERT INTO Employees (id, name) VALUES (3, 'Jonathan');

INSERT INTO EmployeeUNI (id, unique_id) VALUES (3, 1);
INSERT INTO EmployeeUNI (id, unique_id) VALUES (11, 2);
INSERT INTO EmployeeUNI (id, unique_id) VALUES (90, 3);

select * from Employees;
select * from EmployeeUNI;

select eu.unique_id ,e.name 
from employees e
left join employeeUNI eu
on e.id = eu.id
