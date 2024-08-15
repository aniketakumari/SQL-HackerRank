/* 
print name, grade and marks
"null" if grade < 8 else name
order by grade in desc, if same marks then by name and then by marks if same grade
*/



SELECT 
CASE 
WHEN G.Grade < 8 THEN NULL ELSE S.Name
END, G.Grade, S.Marks
FROM STUDENTS S
JOIN GRADES G ON S.MARKS BETWEEN G.Min_Mark and G.Max_Mark
ORDER BY G.Grade DESC, S.Name, S.Marks;
