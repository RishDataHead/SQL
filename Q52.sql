CREATE TABLE Customer1 (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  referee_id INT
);

INSERT INTO Customer1 (id, name, referee_id)
VALUES
  (1, 'Will', NULL),
  (2, 'Jane', NULL),
  (3, 'Alex', 2),
  (4, 'Bill', NULL),
  (5, 'Zack', 1),
  (6, 'Mark', 2);
  
  #Write an SQL query to report the names of the customer that are not referred by the customer with id= 2.

select * from customer1 where referee_id != 2




