USE [Pampa]
GO
-- select specific or all column example below
SELECT [ID]
      ,[Name]
      ,[Email]
      ,[GenderId]
      ,[Address]
      ,[Age]
	  ,[City]
  FROM [dbo].[tblPerson_New]

GO

ALTER TABLE [dbo].[tblPerson]
ADD [ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL;  -- Adding a new IDENTITY column


INSERT INTO [dbo].[tblPerson_New] ([Name], [Email], [GenderId], [Address], [Age], [City])
VALUES
    ('John Doe', 'john.doe1@example.com', 1, '123 Main St', 28, 'Bangalore'),
    ('Jane Smith', 'jane.smith2@example.com', 2, '456 Oak St', 32, 'Chennai'),
    ('Michael Johnson', 'michael.johnson3@example.com', 1, '789 Pine St', 30, 'Hyderabad'),
    ('Emily Davis', 'emily.davis4@example.com', 2, '135 Maple St', 25, 'Mumbai'),
    ('Chris Brown', 'chris.brown5@example.com', 1, '246 Elm St', 29, 'Pune'),
    ('Sarah Wilson', 'sarah.wilson6@example.com', 2, '357 Birch St', 27, 'Delhi'),
    ('David Lee', 'david.lee7@example.com', 1, '468 Cedar St', 31, 'Kolkata'),
    ('Linda Taylor', 'linda.taylor8@example.com', 2, '579 Willow St', 33, 'Ahmedabad'),
    ('James Anderson', 'james.anderson9@example.com', 1, '680 Spruce St', 26, 'Bangalore'),
    ('Olivia Martinez', 'olivia.martinez10@example.com', 2, '791 Ash St', 34, 'Jaipur');


ALTER TABLE [dbo].[tblPerson_New]
ADD [City] NVARCHAR(100);  -- Adjust the size as per your requirement

UPDATE [dbo].[tblPerson_New]
SET [City] = 'Bangalore'  -- You can set this to the actual city data
WHERE [ID] = 1;

update tblPerson set City = 'raichur'
where ID = 2
--Select statement in sql server - Part 10
--Part 10 - All About Select
/* -> Select specific or all columns
	-> Distinct rows
	-> Filtering with where clause
	-> Wild cards in sql server
	-> joining multiple conditions using AND and OR Operators
	-> sorting rows using order by
	-> selecting top n or top n percentage of rows
*/
select * from tblPerson

ALTER TABLE [dbo].[tblPerson_New]
DROP COLUMN [ID];  -- Dropping the old ID column

ALTER TABLE [dbo].[tblPerson_New]
DROP CONSTRAINT [PK_tblPerson];  -- Dropping the primary key constraint

--Select specific or all columns

SELECT [ID]
      ,[Name]
      ,[Email]
      ,[GenderId]
      ,[Address]
      ,[Age]
	  ,[City]
  FROM [dbo].[tblPerson_New]

GO

-- Distinct rows
-- fetch the city value duplicate city name will not show
 select distinct Name, City from tblPerson_New
 -- filtering with where clause
 select * from tblPerson_New where City = 'Bangalore'
 select * from tblPerson_New  where City != 'Bangalore'

 -- Operators and wild cards

 --operator  Purpose
  /*
 =				Equal to
 != or <>		Not Equal to
 >				Greater than
 >=				Greater than or equal to
 <				less than
 <=				less than or equal to
 IN				specify a list of values
 Between		specify a range
 Like			specify a pattern
 Not			not in a list, range etc
 */
 --Operator        Purpose
 /*
 %					specifies zero or more characters
 -					specifies exactly one character
 []					any characters with in the brackets
 [^]				not any character with in the brackets
 */

 -- in column
 select * from tblPerson_New where age in(20,23,27)
 select * from tblPerson_New where age between 20 and 30 -- boundary range
 select * from tblPerson_New where  City Like 'A%' -- starting from the A character at anything after

 select * from tblPerson_New where Email Not Like '@%'

SELECT * FROM tblPerson_New 
WHERE Email LIKE '_________@______.com';

SELECT * FROM tblPerson_New 
WHERE Email LIKE '%@%.com';

SELECT * FROM tblPerson_New 
WHERE Email = 'john.doe1@example.com';





SELECT Email FROM tblPerson_New;
-- MFT names start name with MFT []

select * from tblPerson_New where name like '[MSC]%'

select * from tblPerson_New where name like '[^MSC]%' -- not in the MSC

select * from tblPerson_New where (City = 'Bangalore' or City = 'Mumbai') And age > 25 -- joining multiple conditions

SELECT * FROM tblPerson_New 
ORDER BY Name DESC, Age ASC; -- oder desc and asc

select top 5 * from tblPerson_New

select top 50 Percent * from tblPerson_New

select top 1 * from tblPerson_New Order by age Desc
alter table  tblPerson_New add Salary Decimal(10,2)

alter table tblPerson_New add DepartmentName nvarchar (100),DepartmentID int;

update tblPerson_New set  Salary =4000.00 where ID = 1

UPDATE tblPerson_New SET Salary = 3500.00 WHERE ID = 2;
UPDATE tblPerson_New SET Salary = 4200.00 WHERE ID = 3;
UPDATE tblPerson_New SET Salary = 3000.00 WHERE ID = 4;
UPDATE tblPerson_New SET Salary = 3800.00 WHERE ID = 5;
UPDATE tblPerson_New SET Salary = 3600.00 WHERE ID = 6;
UPDATE tblPerson_New SET Salary = 4500.00 WHERE ID = 7;
UPDATE tblPerson_New SET Salary = 4700.00 WHERE ID = 8;
UPDATE tblPerson_New SET Salary = 3900.00 WHERE ID = 9;
UPDATE tblPerson_New SET Salary = 4200.00 WHERE ID = 10;
select * from tblPerson_New


--
-- Group BY

select SUM(Salary) from tblPerson_New
select MIN(Salary) from tblPerson_New
select MAX(Salary) from tblPerson_New

-- total salary by city by sum

select City, SUM(Salary) as TotalSalary
from tblPerson_New
Group by city -- grouping the city and sum the salary paid by the city

select * from tblPerson_New

-- grouping the city and sum the salary paid by the city and male and female employees

select GenderId, City,  SUM(Salary) as TotalSalary
from tblPerson_New
Group by GenderId,city

alter table  tblPerson_New add Gendername nvarchar(20) 

update  tblPerson_New set Gendername = 'male' where GenderId = 1;

update  tblPerson_New set Gendername = 'female' where GenderId = 2;

update  tblPerson_New set Gendername = 'unknown' where GenderId = 3;
select * from tblPerson_New

-- using multiple aggregation functions total employees belogn to city and gender same and group
select count(ID) from tblPerson_New

select GenderId,City, SUM(salary) as TotalSalary, count(ID) as [Total Employess]
from tblPerson_New 
Group By GenderId, City

-- filtering the groups
-- i want male salary

select GenderId,City, SUM(salary) as TotalSalary, count(ID) as [Total Employess]
from tblPerson_New 
where GenderId = 1
Group By GenderId, City

-- having male only the main key multiple aggregation
-- where can be subquery when using the aggregation
select GenderId,City, SUM(salary) as TotalSalary, count(ID) as [Total Employess]
from tblPerson_New 
Group By GenderId, City
Having GenderId = 1

----part 13 Joins in sql server
-- 1. inner join
-- 2. outer join
---3. cross join

--- outer join are again divided into 
--1. left join or left outer join
--2. right join or right outer join
--3. full join or full outer join

