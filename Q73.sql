CREATE TABLE Actions (
  user_id int,
  post_id int,
  action_date date,
  action enum('view', 'like', 'reaction', 'comment', 'report', 'share'),
  extra varchar(255)
);

CREATE TABLE Removals (
  post_id int PRIMARY KEY,
  remove_date date
);

INSERT INTO Actions (user_id, post_id, action_date, action, extra)
VALUES (1, 1, '2019-07-01', 'view', null),
       (1, 1, '2019-07-01', 'like', null),
       (1, 1, '2019-07-01', 'share', null),
       (2, 2, '2019-07-04', 'view', null),
       (2, 2, '2019-07-04', 'report', 'spam'),
       (3, 4, '2019-07-04', 'view', null),
       (3, 4, '2019-07-04', 'report', 'spam'),
       (4, 3, '2019-07-02', 'view', null),
       (4, 3, '2019-07-02', 'report', 'spam'),
       (5, 2, '2019-07-03', 'view', null),
       (5, 2, '2019-07-03', 'report', 'racism'),
       (5, 5, '2019-07-03', 'view', null),
       (5, 5, '2019-07-03', 'report', 'racism');
       
       INSERT INTO Removals (post_id, remove_date)
VALUES (2, '2019-07-20'),
       (3, '2019-07-18');
       
       
      with cte as(
select a.post_Id,a.action_date,
count(case when action='report' and extra='spam' then 1 else null end) as spam_count,
count(case when action='report' and extra='spam' and remove_date is not null then 1 else null end) as del_count 
from actions a left join removals r
on a.post_id=r.post_id
group by date(action_date)
)
select round(avg(daily_del_avg)) as average_daily_percent from(
select action_date,round((100.0*del_count/spam_count),2) as daily_del_avg
from cte)a
where daily_del_avg is not null;


