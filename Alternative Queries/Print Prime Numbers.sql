-- ms mysql server

declare @x1 int = 2
declare @x2 int = 1000
declare @result varchar(max) = ''

while @x1 <= @x2
begin
  declare @x3 int = 2
  declare @count int = 0
  
  while @x3 <= @x1
  begin 
    if @x1%@x3 = 0
    begin 
    set @count = @count + 1
    end
  set @x3 = @x3 + 1
  end
  
  if @count = 1
  begin 
  set @result = @result + cast(@x1 as varchar(10)) + '&'
  end
  
 set @x1 = @x1 + 1
 end
 
 print(left(@result,len(@result) - 1))
