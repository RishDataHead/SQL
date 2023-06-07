#Q20Write an SQL query to find the ctr of each Ad. Round ctr to two decimal points.
#Return the result table ordered by ctr in descending order and by ad_id in ascending order in case of a tie

CREATE TABLE Ads (
  ad_id INT,
  user_id INT,
  action ENUM('Clicked', 'Viewed', 'Ignored'),
  PRIMARY KEY (ad_id, user_id)
);

INSERT INTO Ads (ad_id, user_id, action) VALUES
(1, 1, 'Clicked'),
(2, 2, 'Clicked'),
(3, 3, 'Viewed'),
(5, 5, 'Ignored'),
(1, 7, 'Ignored'),
(2, 7, 'Viewed'),
(3, 5, 'Clicked'),
(1, 4, 'Viewed'),
(2, 11, 'Viewed'),
(1, 2, 'Clicked');


SELECT ad_id,
  CASE
    WHEN (clicks + views) = 0 THEN 0
    ELSE ROUND((clicks / (clicks + views)) * 100, 2)
  END AS ctr
FROM (
  SELECT ad_id,
    SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END) AS clicks,
    SUM(CASE WHEN action = 'Viewed' THEN 1 ELSE 0 END) AS views
  FROM Ads
  WHERE action IN ('Clicked', 'Viewed')
  GROUP BY ad_id
) subquery
ORDER BY ctr DESC, ad_id ASC;
