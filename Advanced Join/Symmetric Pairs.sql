-- ms mysql server

with cte as (
select 
case when x<=y then x else y end x1,
case when y>=x then y else x end y1
from functions)

select x1, y1
from cte
group by x1, y1
having count(*)>1
order by x1 asc;
