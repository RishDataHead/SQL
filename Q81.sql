CREATE TABLE Inventory (
  item_id integer,
  item_type varchar(255),
  item_category varchar(255),
  square_footage decimal
);

INSERT INTO Inventory (item_id, item_type, item_category, square_footage)
VALUES
  (1374, 'prime_eligible', 'mini refrigerator', 68.00),
  (4245, 'not_prime', 'standing lamp', 26.40),
  (2452, 'prime_eligible', 'television', 85.00),
  (3255, 'not_prime', 'side table', 22.60),
  (1672, 'prime_eligible', 'laptop', 8.50);




SELECT item_type,
    (CASE WHEN item_type = 'prime_eligible' 
          THEN floor(500000/total_square_footage) * total_item_type
          ELSE floor(((500000) - (floor(500000/(SELECT SUM(square_footage) FROM inventory WHERE item_type = 'prime_eligible'))* 
          (SELECT SUM(square_footage) FROM inventory WHERE item_type = 'prime_eligible')))/(total_square_footage)
          ) * total_item_type END) AS item_count   

FROM(SELECT item_type,
      COUNT(item_type) AS total_item_type,
      SUM(square_footage) AS total_square_footage
FROM inventory
GROUP BY item_type) AS temp_table1       
ORDER BY item_count DESC;




