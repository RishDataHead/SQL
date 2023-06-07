-- Create user_actions table
CREATE TABLE user_actions (
  user_id INT,
  event_id INT,
  event_type VARCHAR(10),
  event_date DATETIME
);

-- Insert example data into user_actions table
INSERT INTO user_actions (user_id, event_id, event_type, event_date)
VALUES
  (445, 7765, 'sign-in', '2022-05-31 12:00:00'),
  (742, 6458, 'sign-in', '2022-06-03 12:00:00'),
  (445, 3634, 'like', '2022-06-05 12:00:00'),
  (742, 1374, 'comment', '2022-06-05 12:00:00'),
  (648, 3124, 'like', '2022-06-18 12:00:00');
  
  
  SELECT
Extract(month FROM event_date) as month,
COUNT(*) as monthly_active_users FROM
(
  SELECT 
user_id,
event_date,
EXTRACT(MONTH FROM event_date) - LAG(EXTRact(MONTH FROM event_date)) OVER(partition by user_id order by event_date) as month_number 
FROM 
user_actions) tmp WHERE month_number = 1
GROUP by 1
ORDER BY 2 desc
LIMIT 1;
