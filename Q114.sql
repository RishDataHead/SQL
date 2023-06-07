with recursive num(n) as
(
select 10
    union all
    select n - 2
    from num 
    where n - 2 >= 2
)
select lpad('', num.n, '* ') as pattern
from num; 
