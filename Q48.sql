CREATE TABLE Books (
  book_id INT PRIMARY KEY,
  name VARCHAR(255),
  available_from DATE
);


CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  book_id INT,
  quantity INT,
  dispatch_date DATE,
  FOREIGN KEY (book_id) REFERENCES Books (book_id)
);

INSERT INTO Books (book_id, name, available_from)
VALUES (1, 'Kalila And Demna', '2010-01-01');

INSERT INTO Books (book_id, name, available_from)
VALUES (2, '28 Letters', '2012-05-12');

INSERT INTO Books (book_id, name, available_from)
VALUES (3, 'The Hobbit', '2019-06-10');

INSERT INTO Books (book_id, name, available_from)
VALUES (4, '13 Reasons Why', '2019-06-01');

INSERT INTO Books (book_id, name, available_from)
VALUES (5, 'The Hunger Games', '2008-09-21');
