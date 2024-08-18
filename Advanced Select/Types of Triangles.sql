-- ms mysql server

SELECT 
    CASE WHEN A+B>C AND A+C>B AND B+C>A THEN
        CASE WHEN A=B AND B=C AND C=A THEN "Equilateral"
             WHEN A<>B AND A<>C AND B<>C THEN "Scalene"
        ELSE "Isosceles"
        END
    ELSE "Not A Triangle"
    END "triangle"
FROM TRIANGLES
