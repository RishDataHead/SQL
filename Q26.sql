
CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  product_category VARCHAR(100)
);


CREATE TABLE Orders (
  product_id INT,
  order_date DATE,
  unit INT,
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (product_id, product_name, product_category)
VALUES
  (1, 'Leetcode Solutions Book', 'Product Category'),
  (2, 'Jewels of Stringology Book', 'Product Category'),
  (3, 'HP Laptop', 'Product Category'),
  (4, 'Lenovo Laptop', 'Product Category'),
  (5, 'Leetcode Kit T-shirt', 'Product Category');


INSERT INTO Orders (product_id, order_date, unit)
VALUES
  (1, '2020-02-05', 60),
  (1, '2020-02-10', 70),
  (2, '2020-01-18', 30),
  (2, '2020-02-11', 80),
  (3, '2020-02-17', 2),
  (3, '2020-02-24', 3),
  (4, '2020-03-01', 20),
  (4, '2020-03-04', 30),
  (4, '2020-03-04', 60),
  (5, '2020-02-25', 50),
  (5, '2020-02-27', 50),
  (5, '2020-03-01', 50);
  
  SELECT P.PRODUCT_NAME,SUM(O.UNIT) AS UNIT
  FROM PRODUCTS P
  INNER JOIN 
  ORDERS O ON P.PRODUCT_ID = O.PRODUCT_ID 
  WHERE YEAR(ORDER_DATE)=2020 AND MONTH(ORDER_DATE)=2
  GROUP BY PRODUCT_NAME
  HAVING UNIT >= 100
