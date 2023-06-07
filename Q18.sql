create table if not exists views(
article_id int,
author_id int,
viewer_id int,
viewer_date date);

INSERT INTO views (article_id, author_id, viewer_id, viewer_date)
VALUES
  (1, 3, 5, '2019-08-01'),
  (1, 3, 6, '2019-08-02'),
  (2, 7, 7, '2019-08-01'),
  (2, 7, 6, '2019-08-02'),
  (4, 7, 1, '2019-07-22'),
  (3, 4, 4, '2019-07-21'),
  (3, 4, 4, '2019-07-21');

SELECT * FROM VIEWS;

 #Q18 Write an SQL query to find all the authors that viewed at least one of their own articles. Return the result table sorted by id in ascending order.
 
 SELECT Distinct author_id  FROM VIEWS WHERE AUTHOR_ID = VIEWER_ID ORDER BY AUTHOR_ID
 
 