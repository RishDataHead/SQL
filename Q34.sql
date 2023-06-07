CREATE TABLE Products (
    product_id int PRIMARY KEY,
    product_name varchar(255),
    product_category varchar(255)
);

CREATE TABLE Orders (
    product_id int,
    order_date date,
    unit int,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (product_id, product_name, product_category)
VALUES
    (1, 'Leetcode Solutions Book', 'Book'),
    (2, 'Jewels of Stringology Book', 'Book'),
    (3, 'HP Laptop', 'Laptop'),
    (4, 'Lenovo Laptop', 'Laptop'),
    (5, 'Leetcode Kit T-shirt', 'T-shirt');
    
    