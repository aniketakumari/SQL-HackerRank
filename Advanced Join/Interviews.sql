-- ms mysql server

select c.*, sum(sum_total_submissions), sum(sum_total_accepted_submissions), sum(sum_total_views), sum(sum_total_unique_views)

from contests as c
inner join colleges as cl on c.contest_id = cl.contest_id
inner join challenges as ch on ch.college_id = cl.college_id
left join
(
select challenge_id, sum(total_submissions) as sum_total_submissions,
sum(total_accepted_submissions) as sum_total_accepted_submissions
from submission_stats
group by challenge_id) ss on ss.challenge_id = ch.challenge_id

left join
(
select challenge_id, sum(total_views) as sum_total_views,
sum(total_unique_views) as sum_total_unique_views
from view_stats
group by challenge_id) vs on vs.challenge_id = ch.challenge_id

group by c.contest_id, c.hacker_id, c.name

order by c.contest_id;
