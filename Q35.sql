CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255)
);

CREATE TABLE Userss (
    user_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE MovieRating (
    movie_id INT,
    user_id INT,
    rating INT,
    created_at DATE,
    PRIMARY KEY (movie_id, user_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Userss(user_id)
);


INSERT INTO Movies (movie_id, title)
VALUES (1, 'Avengers'),
       (2, 'Frozen 2'),
       (3, 'Joker');

INSERT INTO Userss (user_id, name)
VALUES (1, 'Daniel'),
       (2, 'Monica'),
       (3, 'Maria'),
       (4, 'James');

INSERT INTO MovieRating (movie_id, user_id, rating, created_at)
VALUES (1, 1, 3, '2020-01-12'),
       (1, 2, 4, '2020-02-11'),
       (1, 3, 2, '2020-02-12'),
       (1, 4, 1, '2020-01-01'),
       (2, 1, 5, '2020-02-17'),
       (2, 2, 2, '2020-02-01'),
       (2, 3, 2, '2020-03-01'),
       (3, 1, 3, '2020-02-22'),
       (3, 2, 4, '2020-02-25');
       
#Write an SQL query to:
#● Find the name of the user who has rated the greatest number of movies. In case of a tie,
#return the lexicographically smaller user name.
#● Find the movie name with the highest average rating in February 2020. In case of a tie, return
#the lexicographically smaller movie name.


select name from Movies M
inner join MovieRating MR
on M.movie_id = MR.movie_id
inner join userss U on U.user_id = MR.user_id
group by name 
order by count(*) desc
limit 1;


select  title from Movies M
inner join MovieRating MR
on M.movie_id = MR.movie_id
inner join userss U on U.user_id = MR.user_id
where MR.created_at >'2020-02-01' and MR.created_at <'2020-02-28'
group by title
order by AVG(rating) desc
limit 1;