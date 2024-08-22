-- ms mysql server

select concat(name, '(', upper(left(occupation,1)),')')
from occupations
order by name;

select concat('There are a total of ', count(occupation), ' ', lower(occupation), 's.')
from occupations
group by occupation 
order by count(occupation), occupation;


-- mysql

SELECT CONCAT(Name, '(', LEFT(Occupation, 1) , ')')
FROM Occupations 
ORDER BY Name;

SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.')
FROM Occupations 
GROUP BY Occupation
ORDER BY COUNT(Occupation) ASC, Occupation;
