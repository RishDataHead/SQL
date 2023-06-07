CREATE TABLE Variables (
  name varchar(255) PRIMARY KEY,
  value int
);
CREATE TABLE Expressions (
  left_operand varchar(255),
  operator enum('<', '>', '='),
  right_operand varchar(255),
  PRIMARY KEY (left_operand, operator, right_operand),
  FOREIGN KEY (left_operand) REFERENCES Variables(name),
  FOREIGN KEY (right_operand) REFERENCES Variables(name)
);
INSERT INTO Variables (name, value) VALUES
('x', 66),
('y', 77);

INSERT INTO Expressions (left_operand, operator, right_operand) VALUES
('x', '>', 'y'),
('x', '<', 'y'),
('x', '=', 'y'),
('y', '>', 'x'),
('y', '<', 'x'),
('x', '=', 'x');

SELECT e.left_operand, e.operator, e.right_operand,
    CASE
        WHEN e.operator = '>' THEN CASE WHEN v1.value > v2.value THEN 'true' ELSE 'false' END
        WHEN e.operator = '<' THEN CASE WHEN v1.value < v2.value THEN 'true' ELSE 'false' END
        WHEN e.operator = '=' THEN CASE WHEN v1.value = v2.value THEN 'true' ELSE 'false' END
    END AS value
FROM Expressions e
JOIN Variables v1 ON e.left_operand = v1.name
JOIN Variables v2 ON e.right_operand = v2.name;
