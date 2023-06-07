CREATE TABLE user_transactions (
  transaction_id INTEGER,
  product_id INTEGER,
  spend DECIMAL(10,2),
  transaction_date DATETIME
);
INSERT INTO user_transactions (transaction_id, product_id, spend, transaction_date)
VALUES
  (1341, 123424, 1500.60, '2019-12-31 12:00:00'),
  (1423, 123424, 1000.20, '2020-12-31 12:00:00'),
  (1623, 123424, 1246.44, '2021-12-31 12:00:00'),
  (1322, 123424, 2145.32, '2022-12-31 12:00:00');


SELECT
  EXTRACT(YEAR FROM transaction_date) AS year,
  product_id,
  spend AS curr_year_spend,
  LAG(spend) OVER (PARTITION BY product_id ORDER BY transaction_date) AS prev_year_spend,
  ROUND((spend - LAG(spend) OVER (PARTITION BY product_id ORDER BY transaction_date)) / LAG(spend) OVER (PARTITION BY product_id ORDER BY transaction_date) * 100, 2) AS yoy_rate
FROM
  user_transactions
ORDER BY
  year, product_id;
