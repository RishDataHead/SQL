CREATE TABLE Product (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  unit_price INT
);

CREATE TABLE Sales (
  seller_id INT,
  product_id INT,
  buyer_id INT,
  sale_date DATE,
  quantity INT,
  price INT,
  FOREIGN KEY (product_id) REFERENCES Product (product_id)
);



-- Inserting data into the Product table
INSERT INTO Product (product_id, product_name, unit_price)
VALUES
  (1, 'S8', 1000),
  (2, 'G4', 800),
  (3, 'iPhone', 1400);



-- Inserting data into the Sales table
INSERT INTO Sales (seller_id, product_id, buyer_id, sale_date, quantity, price)
VALUES
  (1, 1, 1, '2019-01-21', 2, 2000),
  (1, 2, 2, '2019-02-17', 1, 800),
  (2, 2, 3, '2019-06-02', 1, 800),
  (3, 3, 4, '2019-05-13', 2, 2800);


select  seller_id  from sales group by seller_id having sum(price) = (select sum(price) as total_sales from sales group by seller_id order by sum(price) desc limit 1)
