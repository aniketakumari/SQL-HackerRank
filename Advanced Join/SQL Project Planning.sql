SELECT Start_Date, MIN(End_Date)
FROM (SELECT Start_Date FROM Projects WHERE Start_Date NOT IN 
    (SELECT End_Date FROM Projects)) a,
    (SELECT End_Date FROM Projects WHERE End_Date 
    NOT IN (SELECT Start_Date FROM Projects)) b 
WHERE Start_Date < End_Date
GROUP BY Start_Date  ORDER BY min(end_date)- start_date asc, Start_Date;
