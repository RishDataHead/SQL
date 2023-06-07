CREATE TABLE Teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(255)
);
CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    host_team INT,
    guest_team INT,
    host_goals INT,
    guest_goals INT,
    FOREIGN KEY (host_team) REFERENCES Teams (team_id),
    FOREIGN KEY (guest_team) REFERENCES Teams (team_id)
);

#Insuffcient data
