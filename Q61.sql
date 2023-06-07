CREATE TABLE Point (
  x INT PRIMARY KEY
);

INSERT INTO Point (x)
VALUES
  (-1),
  (0),
  (2);
  
  SELECT
  
  ABS(p1.x - p2.x) AS distance
FROM
  Point p1
  JOIN Point p2 ON p1.x <> p2.x
ORDER BY
  distance
LIMIT 1;