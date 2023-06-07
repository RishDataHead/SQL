CREATE TABLE Logs (
    log_id INT PRIMARY KEY
);
INSERT INTO Logs (log_id) VALUES
(1),
(2),
(3),
(7),
(8),
(10);


with cte as(
select log_Id,log_id-row_number() over(order by log_id) as gp
from logs
)
select distinct first_value(log_id) over(partition by gp order by log_Id) as start,
		first_value(log_id) over(partition by gp order by log_id desc) as end
        from cte;