CREATE TABLE Warehouse (
  name VARCHAR(255),
  product_id INT,
  units INT,
  PRIMARY KEY (name, product_id)
);

CREATE TABLE Products2 (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  Width INT,
  Length INT,
  Height INT
);

INSERT INTO Warehouse (name, product_id, units)
VALUES
  ('LCHouse1', 1, 1),
  ('LCHouse1', 2, 10),
  ('LCHouse1', 3, 5),
  ('LCHouse2', 1, 2),
  ('LCHouse2', 2, 2),
  ('LCHouse3', 4, 1);


INSERT INTO Products2 (product_id, product_name, Width, Length, Height)
VALUES
  (1, 'LC-TV', 5, 50, 40),
  (2, 'LC-KeyChain', 5, 5, 5),
  (3, 'LC-Phone', 2, 10, 10),
  (4, 'LC-T-Shirt', 4, 10, 20);
  
  select name,sum(units*Length*Width*Height) as Volume from warehouse w
  join products2 p
  on w.product_id = p.product_id
  group by name
  


