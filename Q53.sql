CREATE TABLE Customers2 (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE Orders2 (
  id INT PRIMARY KEY,
  customerId INT
);

INSERT INTO Customers2 (id, name)
VALUES
    (1, 'Joe'),
    (2, 'Henry'),
    (3, 'Sam'),
    (4, 'Max');

INSERT INTO Orders2 (id, customerId)
VALUES
    (1, 3),
    (2, 1);


-- Write an SQL query to report all customers who never order anything.
-- Return the result table in any order.The query result format is in the following example.

SELECT NAME AS CUSTOMERS FROM CUSTOMERS2 WHERE ID NOT IN(SELECT DISTINCT ID FROM ORDERS2)