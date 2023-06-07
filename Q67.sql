-- CREATE TABLE query
CREATE TABLE Customer (
  customer_id INT,
  name VARCHAR(50),
  visited_on DATE,
  amount INT,
  PRIMARY KEY (customer_id)
);

-- INSERT INTO queries
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES
(1, 'Jhon', '2019-01-01', 100),
(2, 'Daniel', '2019-01-02', 110),
(3, 'Jade', '2019-01-03', 120),
(4, 'Khaled', '2019-01-04', 130),
(5, 'Winston', '2019-01-05', 110),
(6, 'Elvis', '2019-01-06', 140),
(7, 'Anna', '2019-01-07', 150),
(8, 'Maria', '2019-01-08', 80),
(9, 'Jaze', '2019-01-09', 110),
(10, 'Jhon', '2019-01-10', 130),
(11, 'Jade', '2019-01-10', 150);

select visited_on,sum(amount) over(order by visited_on rows between 6 preceding  and current row) as amount,
round(sum(amount) over(order by visited_on rows between 6 preceding  and current row)/7,2) as average_amount from Customer
