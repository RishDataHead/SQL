
create table useractivity(
username varchar(30),
activity varchar(30),
startdate date,
enddate date);

INSERT INTO UserActivity (username, activity, startDate, endDate)
VALUES
  ('Alice', 'Travel', '2020-02-12', '2020-02-20'),
  ('Alice', 'Dancing', '2020-02-21', '2020-02-23'),
  ('Alice', 'Travel', '2020-02-24', '2020-02-28'),
  ('Bob', 'Travel', '2020-02-11', '2020-02-18');

select username,activity,startdate,enddate
from (
select *,rank() over(partition by username order by enddate desc) as rn,
lead(enddate) over(partition by username order by enddate desc) as next_activity
from useractivity) tmp  where (rn=2 and next_activity is not null) or (rn=1 and next_activity is null);