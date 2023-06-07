CREATE TABLE TVProgram (
  program_date date,
  content_id int,
  channel varchar(30),
  PRIMARY KEY (program_date, content_id)
);
CREATE TABLE Content (
  content_id varchar(30),
  title varchar(30),
  Kids_content enum('Yes', 'No'),
  content_type varchar(30),
  PRIMARY KEY (content_id)
);
drop table tvprogram;
drop table Content;

INSERT INTO TVProgram (program_date, content_id, channel)
VALUES
    ('2020-06-10', 1, 'LC-Channel'),
    ('2020-05-11', 2, 'LC-Channel'),
    ('2020-05-12', 3, 'LC-Channel'),
    ('2020-05-13', 4, 'Disney Ch'),
    ('2020-06-18', 4, 'Disney Ch'),
    ('2020-07-15', 5, 'Disney Ch');
    
    INSERT INTO Content (content_id, title, Kids_content, content_type)
VALUES
    (1, 'Leetcode Movie', 'No', 'Movies'),
    (2, 'Alg. for Kids', 'Yes', 'Series'),
    (3, 'Database Sols', 'No', 'Series'),
    (4, 'Aladdin', 'Yes', 'Movies'),
    (5, 'Cinderella', 'Yes', 'Movies');
    
    SELECT c.title
    FROM TVPROGRAM P
    INNER JOIN 
    CONTENT C ON P.CONTENT_ID = C.CONTENT_ID 
    WHERE C.Kids_content = 'Yes' and
    p.program_date >'2020-06-01'and p.program_date <'2020-07-01'
    

