CREATE TABLE Orders1 (
  order_number INT,
  customer_number INT,
  PRIMARY KEY (order_number)
);

INSERT INTO Orders1 (order_number, customer_number)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 3);


select * from orders1

-- Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.

select o.customer_number,count(o.customer_number)   as orders from
orders1 o
join  orders1 o1
on o.customer_number = o1.customer_number
group by o.order_number 
order by orders desc
limit 1

-- 2nd part

SELECT customer_number
FROM Orders1
GROUP BY customer_number
HAVING COUNT(order_number) = (
    SELECT COUNT(order_number)
    FROM Orders1
    GROUP BY customer_number
    ORDER BY COUNT(order_number) DESC
    LIMIT 1
);
