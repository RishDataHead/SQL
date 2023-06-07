CREATE TABLE Triangle (
  x INT,
  y INT,
  z INT,
  PRIMARY KEY (x, y, z)
);

 -- Inserting data into the Triangle table
INSERT INTO Triangle (x, y, z)
VALUES
  (13, 15, 30),
  (10, 20, 15);
  
  SELECT X,Y,Z,
CASE WHEN (X+Y)>Z  AND (Y+Z)>X AND (X+Z)>Y THEN 'YES' ELSE 'NO' END AS TRIANGLE
FROM triangle;