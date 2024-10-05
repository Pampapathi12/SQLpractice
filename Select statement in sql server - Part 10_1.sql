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
  FROM [dbo].[tblPerson]

GO

ALTER TABLE [dbo].[tblPerson]
ADD [ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL;  -- Adding a new IDENTITY column


INSERT INTO [dbo].[tblPerson] ([Name], [Email], [GenderId], [Address], [Age], [City])
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


ALTER TABLE [dbo].[tblPerson]
ADD [City] NVARCHAR(100);  -- Adjust the size as per your requirement

UPDATE [dbo].[tblPerson]
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

ALTER TABLE [dbo].[tblPerson]
DROP COLUMN [ID];  -- Dropping the old ID column

ALTER TABLE [dbo].[tblPerson]
DROP CONSTRAINT [PK_tblPerson];  -- Dropping the primary key constraint



-- Distinct rows

