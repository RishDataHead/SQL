create table occupations(
name varchar(30),
occupation varchar(30));

insert into occupations values('Samantha','Doctor');
insert into occupations values('Julia','Actor');
insert into occupations values('Maria','Actor');
insert into occupations values('Meera','Singer');
insert into occupations values('Ashely','Professor');
insert into occupations values('Ketty','Professor');
insert into occupations values('Christeen','Professor');
insert into occupations values('Jane','Actor');
insert into occupations values('Jenny','Doctor');
insert into occupations values('Priya','Singer');

select concat(name,'(',substr(occupation,1,1),')') as name
from occupations;


select concat('There are a total of ',occ_count,' ',occupation,'s') as statement from(
select occupation,count(*) as occ_count
from occupations group by occupation)tmp order by occ_count;