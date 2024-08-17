SELECT c.hacker_id, h.name, COUNT(c.challenge_id) AS cnt 
FROM Hackers AS h JOIN Challenges AS c ON h.hacker_id = c.hacker_id
GROUP BY c.hacker_id, h.name HAVING
cnt = (SELECT COUNT(c1.challenge_id) FROM Challenges AS c1 GROUP BY c1.hacker_id ORDER BY COUNT(*) DESC LIMIT 1) OR
cnt NOT IN (SELECT COUNT(c2.challenge_id) FROM Challenges AS c2 GROUP BY c2.hacker_id HAVING c2.hacker_id <> c.hacker_id)
ORDER BY cnt DESC, c.hacker_id;


-- OR 


with cte as (
select h.hacker_id, h.name, count(*) as count_challenges
from hackers as H
inner join challenges as c on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name)

select * 
from cte
where count_challenges not in (
select count_challenges from cte
where count_challenges not in (
select max(count_challenges) from cte)
group by count_challenges 
having count(*) > 1)
order by count_challenges desc, hacker_id;
