-- Create search_frequency table
CREATE TABLE search_frequency (
  searches INT,
  num_users INT
);

-- Insert example data into search_frequency table
INSERT INTO search_frequency (searches, num_users)
VALUES
  (1, 2),
  (2, 2),
  (3, 3),
  (4, 1);

SELECT ROUND(AVG(searches), 1) AS median_searches
FROM (
  SELECT searches, ROW_NUMBER() OVER (ORDER BY searches) AS row_num, COUNT(*) OVER () AS total_rows
  FROM search_frequency
  ORDER BY searches
) AS subquery
WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2));

