create table if not exists product(
product_id int,
product_name varchar(30),
unit_price int,
primary key(product_id)
);
create table if not exists sales(
seller_id  int,
product_id int,
buyer_id int,
sale_date date,
quantity int,
price int,
foreign key (product_id) references product(product_id)
);
select * from sales;
select * from product;

#Q17Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is,between 2019-01-01 and 2019-03-31 inclusive.

SELECT S.PRODUCT_ID,P.PRODUCT_NAME,
S.SALE_DATE FROM SALES S INNER JOIN PRODUCT P ON S.PRODUCT_ID = P.PRODUCT_ID WHERE  sale_date >= '2019-01-01' AND sale_date <= '2019-03-31'


