Create DAtabase Q64ahead;
use Q64ahead;

-- Creating the Employee table
CREATE TABLE Employee (
  employee_id INT,
  name VARCHAR(255),
  experience_years INT,
  PRIMARY KEY (employee_id)
);

-- Inserting data into the Employee table
INSERT INTO Employee (employee_id, name, experience_years)
VALUES
  (1, 'Khaled', 3),
  (2, 'Ali', 2),
  (3, 'John', 1),
  (4, 'Doe', 2);

-- Creating the Project table
CREATE TABLE Project (
  project_id INT,
  employee_id INT,
  PRIMARY KEY (project_id, employee_id),
  FOREIGN KEY (employee_id) REFERENCES Employee (employee_id)
);

-- Inserting data into the Project table
INSERT INTO Project (project_id, employee_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 4);
  
  select p.project_id,round(avg(e.experience_years),1) as average_years
from project p left join employee e
on p.employee_id=e.employee_Id
group by project_id;
