CREATE TABLE Employee2 (
    employee_id int,
    team_id int,
    PRIMARY KEY (employee_id)
);

INSERT INTO Employee2 (employee_id, team_id)
VALUES
    (1, 8),
    (2, 8),
    (3, 8),
    (4, 7),
    (5, 9),
    (6, 9);
    
    -- Write an SQL query to find the team size of each of the employees
select e1.employee_id,count(e1.team_id) as team_size
from employee2 e1 inner join employee2 e2
on e1.team_id=e2.team_id
group  by e1.employee_Id
order by employee_id ;
    
    
