SELECT B.hacker_id, B.name
FROM 
(SELECT A.hacker_id, A.name,A.challenge_id, A.score, C.difficulty_level
FROM 
(SELECT H.hacker_id, H.name, S.challenge_id, S.score
FROM Hackers AS H
JOIN Submissions AS S ON H.hacker_id = S.hacker_id) A
JOIN Challenges AS C ON A.challenge_id = C.challenge_id) B
JOIN Difficulty AS D ON B.difficulty_level = D.difficulty_level
WHERE B.score = D.score
GROUP BY B.hacker_id, B.name
HAVING COUNT(B.challenge_id) > 1
ORDER BY COUNT(B.challenge_id) DESC, B.hacker_id ASC;
