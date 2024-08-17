-- run in ms mysql server 
-- because of the partition function syntax

with cte as(
select h.hacker_id, h.name, s.challenge_id, s.score,
row_number()over(partition by h.hacker_id, s.challenge_id order by s.score desc) row_num
from hackers as h
inner join submissions as s on h.hacker_id = s.hacker_id)

select hacker_id, name, sum(score) as total_sum from cte
where row_num = 1
group by hacker_id, name
having sum(score) > 0
order by sum(score) desc, hacker_id asc;
