CREATE TABLE Activity (
    player_id int,
    device_id int,
    event_date date,
    games_played int,
    PRIMARY KEY (player_id, event_date)
);
INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-03-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);


select * from activity;
SELECT ROUND(
    (
        SELECT COUNT(DISTINCT a.player_id)
        FROM Activity a
        JOIN Activity b ON a.player_id = b.player_id
        WHERE a.event_date = DATE_ADD(b.event_date, INTERVAL 1 DAY)
    ) / (
        SELECT COUNT(DISTINCT player_id)
        FROM Activity
    ) * 100, 2) AS fraction_logged_in;
