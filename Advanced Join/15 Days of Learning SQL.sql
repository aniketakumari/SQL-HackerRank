-- mysql 

SELECT SUBMISSION_DATE,
(SELECT COUNT(DISTINCT HACKER_ID)  
FROM SUBMISSIONS S2  
WHERE S2.SUBMISSION_DATE = S1.SUBMISSION_DATE AND    
(SELECT COUNT(DISTINCT S3.SUBMISSION_DATE) 
FROM SUBMISSIONS S3 WHERE S3.HACKER_ID = S2.HACKER_ID AND S3.SUBMISSION_DATE < S1.SUBMISSION_DATE) = DATEDIFF(S1.SUBMISSION_DATE , '2016-03-01')),
(SELECT HACKER_ID FROM SUBMISSIONS S2 WHERE S2.SUBMISSION_DATE = S1.SUBMISSION_DATE 
GROUP BY HACKER_ID ORDER BY COUNT(SUBMISSION_ID) DESC, HACKER_ID LIMIT 1) AS TMP,
(SELECT NAME FROM HACKERS WHERE HACKER_ID = TMP)
FROM
(SELECT DISTINCT SUBMISSION_DATE FROM SUBMISSIONS) S1
GROUP BY SUBMISSION_DATE;



-- ms mysql server

with cte as(
select submission_date, hacker_id,
dense_rank() over(order by submission_date)rank_date,
dense_rank() over(partition by hacker_id order by submission_date)hacker_rank
from Submissions 
),

count_hacker as (
select submission_date, count(distinct hacker_id) as unique_count
from cte
where rank_date = hacker_rank
group by submission_date
),

cte2 as(
select c.submission_date, h.hacker_id, h.name,
row_number()over(partition by c.submission_date order by count(*) desc, h.hacker_id)as r
from cte as c
inner join Hackers as h on c.hacker_id = h.hacker_id
group by c.submission_date, h.hacker_id, h.name)

select 
ch.submission_date, unique_count, c2.hacker_id, c2.name
from count_hacker as ch 
inner join cte2 as c2 on ch.submission_date = c2.submission_date
where c2.r = 1
order by submission_date;







