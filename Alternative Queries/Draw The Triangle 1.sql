-- loop
-- start of the loop
-- print the *, replicate func for the x no. of *
-- increments/decrements
-- end of the loop

-- ms mysql server

declare @x int = 20
declare @y int = 1

while @x >= @y
begin 
print(replicate('* ',@x)) 
set @x = @x - 1 
end 

-- mysql 

declare @P INT;
SET @P = 20
WHILE @P >= 1
BEGIN
PRINT REPLICATE ('* ', @P)
SET @P = @P - 1
END
