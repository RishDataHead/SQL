-- Create Users table
CREATE TABLE Users2 (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

-- Create Rides table
CREATE TABLE Rides2 (
  id INT PRIMARY KEY,
  user_id INT,
  distance INT,
  FOREIGN KEY (user_id) REFERENCES Users2(id)
);

-- Insert data into Users table
INSERT INTO Users2 (id, name)
VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Alex'),
  (4, 'Donald'),
  (7, 'Lee'),
  (13, 'Jonathan'),
  (19, 'Elvis');

-- Insert data into Rides table
INSERT INTO Rides2 (id, user_id, distance)
VALUES
  (1, 1, 120),
  (2, 2, 317),
  (3, 3, 222),
  (4, 7, 100),
  (5, 13, 312),
  (6, 19, 50),
  (7, 7, 120),
  (8, 19, 400),
  (9, 7, 230);
  
  
 --  Write an SQL query to report the distance travelled by each user.
-- Return the result table ordered by travelled_distance in descending order, if two or more users
-- travelled the same distance, order them by their name in ascending order.


select name,sum(distance) as total_distance from users2 u
left join rides2 r
on  u.id = r.user_id
group by name
order by total_distance desc,name asc

