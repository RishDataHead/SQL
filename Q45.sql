CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(255)
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255),
    gender VARCHAR(10),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Student (student_id, student_name, gender, dept_id)
VALUES
    (1, 'Jack', 'M', 1),
    (2, 'Jane', 'F', 1),
    (3, 'Mark', 'M', 2);

INSERT INTO Department (dept_id, dept_name)
VALUES
    (1, 'Engineering'),
    (2, 'Science'),
    (3, 'Law');
    
    select count(student_name),dept_name from Student s
    right join Department d
    on s.dept_id = d.dept_id
    group by dept_name
