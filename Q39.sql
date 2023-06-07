CREATE TABLE Calls (
  from_id int,
  to_id int,
  duration int
);

INSERT INTO Calls (from_id, to_id, duration)
VALUES
  (1, 2, 59),
  (2, 1, 11),
  (1, 3, 20),
  (3, 4, 100),
  (3, 4, 200),
  (3, 4, 200),
  (4, 3, 499);
  


select from_id as person1 ,to_id as person2,count(*) as call_count,sum(duration) as call_duration from(
select * from calls
union all
select to_id,from_id,duration from calls)s
where from_id<to_id
group by person1 ,person2;



