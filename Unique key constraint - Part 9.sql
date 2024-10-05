--Unique key constraint - Part 9
/* we use unique constraint to enforce uniquness of as column i.e the column
shouldnt allow any duplicate values, we can add a unique constarint thru the designers or using a
query.

-- to create the unique key using a query
*/
alter tbale tablename
add constraint constraintname unique(columnname)

/* both primary key and unique are used to enforce, the uniqueness of a column. so when do you chooose one over other?
a table can have, only one primary key, if u want to enforce uniqueness on2 or more columns, then we use the unique key constraint
*/

-- what is difference between the primary key and unique key
--1. a table can have only one primary key, but more than  one unique key
--2. primary key does not null values, where as unique key allows one null
-- if unique more but the where key column values of the different id where the example unique email doesnot have the same emailid values

select * from tblPerson

alter table tblPerson
add constraint UQ_tblPerson_Email Unique (Email)

-- get the duplicate values
SELECT Email, COUNT(*) AS DuplicateCount
FROM dbo.tblPerson
GROUP BY Email
HAVING COUNT(*) > 1;
select * from tblPerson

-- delete the duplicate records
WITH CTE AS (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY Email ORDER BY Email) AS RowNum
  FROM dbo.tblPerson
)
DELETE FROM CTE WHERE RowNum > 1;

delete from tblPerson
--
Insert into tblPerson values (1,'ABC','a@a.com', 1, 'agasanur',20)
select * from tblPerson

