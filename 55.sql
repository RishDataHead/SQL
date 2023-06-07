CREATE TABLE Person (
  id int,
  name varchar(255),
  phone_number varchar(255),
  PRIMARY KEY (id)
);

CREATE TABLE Country1 (
  name varchar(255),
  country_code varchar(255),
  PRIMARY KEY (country_code)
);

CREATE TABLE Calls (
  caller_id int,
  callee_id int,
  duration int
);


INSERT INTO Person (id, name, phone_number)
VALUES
  (3, 'Jonathan', '051-1234567'),
  (12, 'Elvis', '051-7654321'),
  (1, 'Moncef', '212-1234567'),
  (2, 'Maroua', '212-6523651'),
  (7, 'Meir', '972-1234567'),
  (9, 'Rachel', '972-0011100');
DROP TABLE Country1
INSERT INTO Country1 (name, country_code)
VALUES
  ('Peru', '051'),
  ('Israel', '972'),
  ('Morocco', '212'),
  ('Germany', '049'),
  ('Ethiopia', '251');

INSERT INTO Calls (caller_id, callee_id, duration)
VALUES
  (1, 9, 33),
  (2, 9, 4),
  (1, 2, 59),
  (3, 12, 102),
  (3, 12, 330),
  (12, 3, 5),
  (7, 9, 13),
  (7, 1, 3),
  (9, 7, 1),
  (1, 7, 7);
  
  SELECT C.NAME
FROM Country1 c
JOIN Person p ON c.country_code = SUBSTRING(p.phone_number, 1, 3)
JOIN Calls cl ON p.id = cl.caller_id OR p.id = cl.callee_id
GROUP BY c.name
HAVING AVG(cl.duration) > (
  SELECT AVG(duration)
  FROM Calls
);

