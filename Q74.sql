CREATE TABLE Activity (
  player_id INT,
  device_id INT,
  event_date DATE,
  games_played INT,
  PRIMARY KEY (player_id, event_date)
);

INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES (1, 2, '2016-03-01', 5),
       (1, 2, '2016-05-02', 6),
       (2, 3, '2017-06-25', 1),
       (3, 1, '2016-03-02', 0),
       (3, 4, '2018-07-03', 5);
       
select * from Activity;
       
select player_id ,MIN(event_date) as first_login from activity group by player_id;
       
         
with cte as(
select player_id,event_date as curr_date,
lead(event_date) over(partition by player_Id order by event_date) as next_date
from activity
)
select 
round(100.0*count(distinct case when datediff(next_date,curr_date)=1 then 1 else null end)/count(distinct player_id),2) as fraction
from cte;