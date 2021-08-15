--A.	QUERY USING ORDER BY
select * from Player 
order by firstName desc

--B.	QUERY USING INNER JOIN
select m.firstName , m.lastName , m.phone, p.playerID
from Player p inner join Manager m
ON p.playerID = m.managerID
order by p.firstName desc 

--C.	QUERY USING AGGREGATE FUNCTIONS
select lastName, age, 
(year(getDate())-age) as [Year of Birth] 
from Player 

--D.	QUERY USING THE GROUP BY AND HAVING CLAUSES 
select [location], sponsor, prizeValue as 'Prize in USD'
from Championship
group by [location], sponsor, prizeValue
having MIN(prizeValue) >= 15000
order by prizeValue desc

--E.	QUERY THAT USES A SUB-QUERY AS A RELATION
select * from Player 
where age = (select MIN(age) from Player)

--F.	QUERY THAT USES PARTIAL MATCHING IN THE WHERE CLAUSE
select * from Player 
where firstName like 'B%'

--G.	QUERY THAT USES A SELF – JOIN
SELECT p.playerID, p.firstName +' '+ p.lastName AS 'Full Name', 
m.lastName AS 'Manager'
FROM player p, manager m
WHERE m.managerID = p.playerID AND m.lastName LIKE 'B%'

--H.	STORE PROCEDURE 
GO
create procedure SelectAgeGreaterThanNumber 
@age int   
--create a procedure called SelectAgeGreaterThanNumber
--and initialize a variable called age
as
select * from Player 
where Player.age > @age

EXEC dbo.SelectAgeGreaterThanNumber  @age = 30

--I.	TRIGGER
create trigger InsertError
on  Player
after insert
as 
begin
declare @age int = (Select age from Player)
   if(@age < 18)
   rollback 
   print 'The player must be older than 18 to enter the FIS Alpine Skiing Championship.'
End
