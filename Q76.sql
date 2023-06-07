CREATE TABLE Salaries (
    company_id INT,
    employee_id INT,
    employee_name VARCHAR(255),
    salary INT,
    PRIMARY KEY (company_id, employee_id)
);
INSERT INTO Salaries (company_id, employee_id, employee_name, salary)
VALUES
    (1, 1, 'Tony', 2000),
    (1, 2, 'Pronub', 21300),
    (1, 3, 'Tyrrox', 10800),
    (2, 1, 'Pam', 300),
    (2, 7, 'Bassem', 450),
    (2, 9, 'Hermione', 700),
    (3, 7, 'Bocaben', 100),
    (3, 2, 'Ognjen', 2200),
    (3, 13, 'Nyan Cat', 3300),
    (3, 15, 'Morning Cat', 7777);
    
    select s.company_id,employee_id,employee_name,
		case when salary < 1000 then salary
        when salary between 1000 and 10000 then round(salary-(salary*0.24))
        when salary> 10000 then round(salary-(salary*0.49))
        else null end as salary
        from salaries s
