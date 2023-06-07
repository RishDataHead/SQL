CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    department VARCHAR(255),
    managerId INT
);

INSERT INTO Employee (id, name, department, managerId)
VALUES (101, 'John', 'A', NULL);

INSERT INTO Employee (id, name, department, managerId)
VALUES (102, 'Dan', 'A', 101);

INSERT INTO Employee (id, name, department, managerId)
VALUES (103, 'James', 'A', 101);

INSERT INTO Employee (id, name, department, managerId)
VALUES (104, 'Amy', 'A', 101);

INSERT INTO Employee (id, name, department, managerId)
VALUES (105, 'Anne', 'A', 101);

INSERT INTO Employee (id, name, department, managerId)
VALUES (106, 'Ron', 'B', 101);
INSERT INTO Employee (id, name, department, managerId)
VALUES (107, 'Ton', 'B', 102);


select * from employee;

select name from employee where id = (
select  managerid from employee
group by managerId having  count(managerID) >= 5)


