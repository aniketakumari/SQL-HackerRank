SELECT s.name 
FROM Friends f, Packages p, Packages pf, Students s
WHERE f.id=p.id AND f.friend_id=pf.id AND pf.salary>p.salary AND f.id=s.id
ORDER BY pf.salary;
