-- ms mysql server

declare @P INT;
SET @P = 1
WHILE @P <= 20
BEGIN
PRINT REPLICATE ('* ', @P)
SET @P = @P + 1
END

-- output
-- * 
-- * * 
-- * * * 
-- * * * * 
-- * * * * *
