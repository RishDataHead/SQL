CREATE TABLE Project (
    project_id INT,
    employee_id INT,
    PRIMARY KEY (project_id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES Employee1(employee_id)
);

CREATE TABLE Employee1 (
    employee_id INT,
    name VARCHAR(255),
    experience_years INT,
    PRIMARY KEY (employee_id)
);

INSERT INTO Project (project_id, employee_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 4);

INSERT INTO Employee1 (employee_id, name, experience_years)
VALUES
    (1, 'Khaled', 3),
    (2, 'Ali', 2),
    (3, 'John', 3),
    (4, 'Doe', 2);
    
    
    SELECT p.project_id, e.employee_id
FROM Project p
JOIN Employee1 e ON p.employee_id = e.employee_id
WHERE e.experience_years = (
    SELECT MAX(experience_years)
    FROM Employee1
    WHERE employee_id IN (
        SELECT employee_id
        FROM Project
        WHERE project_id = p.project_id
    )
)
ORDER BY p.project_id;

