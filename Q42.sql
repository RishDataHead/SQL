Create database new_DB
use new_DB;

CREATE TABLE Sales (
  sale_date DATE,
  fruit ENUM('apples', 'oranges'),
  sold_num INT,
  PRIMARY KEY (sale_date, fruit)
);

INSERT INTO Sales (sale_date, fruit, sold_num) VALUES ('2020-05-01', 'apples', 10);
INSERT INTO Sales (sale_date, fruit, sold_num) VALUES ('2020-05-01', 'oranges', 8);
INSERT INTO Sales (sale_date, fruit, sold_num) VALUES ('2020-05-02', 'apples', 15);
INSERT INTO Sales (sale_date, fruit, sold_num) VALUES ('2020-05-02', 'oranges', 15);
INSERT INTO Sales (sale_date, fruit, sold_num) VALUES ('2020-05-03', 'apples', 20);
INSERT INTO Sales (sale_date, fruit, sold_num) VALUES ('2020-05-03', 'oranges', 0);
INSERT INTO Sales (sale_date, fruit, sold_num) VALUES ('2020-05-04', 'apples', 15);
INSERT INTO Sales (sale_date, fruit, sold_num) VALUES ('2020-05-04', 'oranges', 16);



SELECT sale_date, SUM(CASE WHEN fruit = 'apples' THEN sold_num ELSE -sold_num END) AS difference
FROM Sales
GROUP BY sale_date
ORDER BY sale_date;
