-- Creating the Product table
CREATE TABLE Product2 (
  product_id INT,
  product_name VARCHAR(255),
  PRIMARY KEY (product_id)
);

-- Inserting data into the Product table
INSERT INTO Product2 (product_id, product_name)
VALUES
  (100, 'Nokia'),
  (200, 'Apple'),
  (300, 'Samsung');

-- Creating the Sales table
CREATE TABLE Sales2 (
  sale_id INT,
  product_id INT,
  year INT,
  quantity INT,
  price INT,
  PRIMARY KEY (sale_id, year),
  FOREIGN KEY (product_id) REFERENCES Product2 (product_id)
);

-- Inserting data into the Sales table
INSERT INTO Sales2 (sale_id, product_id, year, quantity, price)
VALUES
  (1, 100, 2008, 10, 5000),
  (2, 100, 2009, 12, 5000),
  (7, 200, 2011, 15, 9000);


select p.product_name,s.year,s.price from sales2 as S
join product2 P
on s.product_id = p.product_id