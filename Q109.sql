create table occupations1(
name varchar(30),
occupation varchar(30));

insert into occupations1 values('Samantha','Doctor');
insert into occupations1 values('Julia','Actor');
insert into occupations1 values('Maria','Actor');
insert into occupations1 values('Meera','Singer');
insert into occupations1 values('Ashely','Professor');
insert into occupations1 values('Ketty','Professor');
insert into occupations1 values('Christeen','Professor');
insert into occupations1 values('Jane','Actor');
insert into occupations1 values('Jenny','Doctor');
insert into occupations1 values('Priya','Singer');

-- Q109 . Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and
-- displayed underneath its corresponding Occupation. The output column headers should be Doctor,
-- Professor, Singer, and Actor, respectively.
-- Note: Print NULL when there are no more names corresponding to an occupation.
select Doctor,Professor,Singer,Actor from(
select
    rn,
    max(case when occupation = 'Doctor' then name end) Doctor,
    max(case when occupation = 'Professor'  then name end) Professor,
    max(case when occupation = 'Singer' then name end) Singer,
    max(case when occupation = 'Actor'  then name end) Actor
from (
    select o.*, row_number() over(partition by occupation order by name) rn
    from occupations o
)a
group by rn)b;