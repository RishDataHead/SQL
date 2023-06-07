create table triangle1(
a int,
b int,
c int);
insert into triangle1 values(20,20,23);
insert into triangle1 values(20,20,20);
insert into triangle1 values(20,21,22);
insert into triangle1 values(13,14,30);

SELECT
    CASE
        WHEN A = B AND A = C AND B = C 
            THEN 'Equilateral'
        WHEN (A = B OR A = C OR B = C) AND (A+B>C ) AND(B+C>A) AND(C+A)>B
            THEN 'Isosceles'
        WHEN A != B AND B != C AND (A+B>C ) AND(B+C>A) AND(C+A)>B
            THEN 'Scalene'
        ELSE 'Not A Triangle'
    END as types_of_triangle
FROM TRIANGLE1;