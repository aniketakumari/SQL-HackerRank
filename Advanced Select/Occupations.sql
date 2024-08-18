-- ms mysql server


select Doctor, Professor, Singer, Actor
from (select *, 
     row_number() over (partition by occupation order by name) as rn
     from occupations) A pivot
     
(
max(name)
for occupation in ([Doctor], [Professor], [Actor],[Singer])
) as pivot_tab 



