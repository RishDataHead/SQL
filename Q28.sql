
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100),
  country VARCHAR(100)
);
create table product1(
product_id int,
descripion varchar(30),
price int,
primary key(product_id)
);
CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  order_date DATE,
  quantity INT,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES Product1(product_id)
);


INSERT INTO Customers (customer_id, name, country)
VALUES
  (1, 'Winston', 'USA'),
  (2, 'Jonathan', 'Peru'),
  (3, 'Moustafa', 'Egypt');

INSERT INTO Product1 (product_id, descripion, price)
VALUES
  (10, 'LC Phone', 300),
  (20, 'LC T-Shirt', 10),
  (30, 'LC Book', 45),
  (40, 'LC Keychain', 2);

INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity)
VALUES
  (1, 1, 10, '2020-06-10', 1),
  (2, 1, 20, '2020-07-01', 1),
  (3, 1, 30, '2020-07-08', 2),
  (4, 2, 10, '2020-06-15', 2),
  (5, 2, 40, '2020-07-01', 10),
  (6, 3, 20, '2020-06-24', 2),
  (7, 3, 30, '2020-06-25', 2),
  (9, 3, 30, '2020-05-08', 3);
  
  SELECT customer_id, NAME FROM (SELECT C.customer_id,C.NAME,SUM(PRICE*QUANTITY) AS SPEND,month(O.order_date) as month
  FROM CUSTOMERS C
  INNER JOIN ORDERS O
  ON C.CUSTOMER_ID = O.CUSTOMER_ID
  INNER JOIN PRODUCT1 P 
  ON P.PRODUCT_ID = O.PRODUCT_ID
  WHERE O.ORDER_DATE > '2020-06-01' AND O.ORDER_DATE < '2020-07-31' 
  GROUP BY C.CUSTOMER_ID,MONTH 
  HAVING SUM(PRICE*QUANTITY) >= 100 )TMP WHERE SPEND >=100 GROUP BY customer_id 
  HAVING COUNT(*) = 2
  