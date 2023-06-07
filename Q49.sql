CREATE TABLE Enrollments (
  student_id int,
  course_id int,
  grade int,
  PRIMARY KEY (student_id, course_id)
);

INSERT INTO Enrollments (student_id, course_id, grade)
VALUES
  (2, 2, 95),
  (2, 3, 95),
  (1, 1, 90),
  (1, 2, 99),
  (3, 1, 80),
  (3, 2, 75),
  (3, 3, 82);
  
  select * from enrollments;
  
select student_id,course_id,grade from(
select *,rank() over(partition by student_id order by grade desc,course_id) rn 
from enrollments)a
where rn=1
order by student_id;