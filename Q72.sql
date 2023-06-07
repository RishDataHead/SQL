CREATE TABLE Transactions (
  id INT PRIMARY KEY,
  country VARCHAR(255),
  state ENUM('approved', 'declined'),
  amount INT,
  trans_date DATE
);
INSERT INTO Transactions (id, country, state, amount, trans_date)
VALUES (121, 'US', 'approved', 1000, '2018-12-18');

INSERT INTO Transactions (id, country, state, amount, trans_date)
VALUES (122, 'US', 'declined', 2000, '2018-12-19');

INSERT INTO Transactions (id, country, state, amount, trans_date)
VALUES (123, 'US', 'approved', 2000, '2019-01-01');

INSERT INTO Transactions (id, country, state, amount, trans_date)
VALUES (124, 'DE', 'approved', 2000, '2019-01-07');

select date as month,country,count(*) as trans_count,sum(approved_count) as approved_count,
                sum(amount) as trans_total_amount,sum(amount_val) as approved_total_amount from(
select date_format(trans_date,'%Y-%m') as date,country,state,amount,
case when state='declined' then 0 else amount end amount_val,
case when state='declined' then 0 else 1 end approved_count
from transactions) tmp group by date,country;