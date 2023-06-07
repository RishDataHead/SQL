use sql_challenge;
CREATE TABLE Departments (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);


-- Create Students table
CREATE TABLE Students (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  department_id INT
  
);

-- Insert data into Departments table
INSERT INTO Departments (id, name)
VALUES
  (1, 'Electrical Engineering'),
  (7, 'Computer Engineering'),
  (13, 'Business Administration');

-- Insert data into Students table
INSERT INTO Students (id, name, department_id)
VALUES
  (23, 'Alice', 1),
  (1, 'Bob', 7),
  (5, 'Jennifer', 13),
  (2, 'John', 14),
  (4, 'Jasmine', 77),
  (3, 'Steve', 74),
  (6, 'Luis', 1),
  (8, 'Jonathan', 7),
  (7, 'Daiana', 33),
  (11, 'Madelynn', 1);
  
  
  
  
select s.id, s.name from Departments D
right join  Students S
on D.id = s.department_id
where d.name is Null