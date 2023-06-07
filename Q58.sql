CREATE TABLE Cinema (
  seat_id int,
  free bool,
  PRIMARY KEY (seat_id)
);
INSERT INTO Cinema (seat_id, free)
VALUES
  (1, 1),
  (2, 0),
  (3, 1),
  (4, 1),
  (5, 1);

select seat_id 
from (
    select 
    current.seat_id, 
    case when exists (
                        select 1  
                        from cinema previous 
                        where previous.seat_id = current.seat_id - 1 
                        and previous.free = 1) 
                and current.free = 1 then current.seat_id - 1 else null end previous,
    case when exists (
                        select 1  
                        from cinema next 
                        where next.seat_id = current.seat_id + 1 
                        and next.free = 1) 
                and current.free = 1 then current.seat_id + 1 else null end next
    from cinema current) seats
where seats.previous is not null or seats.next is not null