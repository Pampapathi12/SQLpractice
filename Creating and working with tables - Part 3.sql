-- Creating and working with tables - Part 3
-- creating table 2 ways , using query, and using the graphical using SSMS

--
Use [Pampa]
Go
--Create Table tblGender( ID int NOT NULL Primary Key,
--Gender nvarchar(50) NOT NULL)


Alter table tblPerson add constraint tblPerson_GenderID_FK
Foreign Key(GenderID) references tblGender (ID)

select * from tblPerson

-- Par4 Default Constraint

select * from tblPerson
select * from tblGender

insert into tblPerson(ID, Name, Email) Values (7,'rich', 'r@r.com')
insert into tblPerson(ID, Name, Email) Values (8,'Mike', 'm@m.com')
insert into tblPerson(ID, Name, Email,GenderId) Values (9,'Johny', 'm@m.com', NULL)
insert into tblPerson(ID, Name, Email,GenderId) Values (10,'chaitra', 'c@m.com', 1)
insert into tblPerson(ID, Name, Email,GenderId) Values (11,'shruthi', 'c@m.com', 1)

-- update the table
UPDATE tblPerson
SET GenderId = 1
WHERE ID = 9;


--add default constraint
/* add default constraint */
/* altering an existing column to add a default constraint */
ALTER TABLE tblPerson
ADD CONSTRAINT DF_tblPerson_GenderId
DEFAULT 3 FOR GENDERID

--drop constraint
ALTER TABLE tblPerson
DROP CONSTRAINT DF_tblPerson_GenderId

--adding a new column with default value to an existing table
ALTER TABLE tblPerson
ADD Address nvarchar(50) NOT NULL 
CONSTRAINT DF_tblPerson_Address
DEFAULT 'Agasanur' FOR Address
--answer
ALTER TABLE tblPerson
ADD Address nvarchar(50) NOT NULL 
CONSTRAINT DF_tblPerson_Address DEFAULT 'Agasanur';

-- PART 5 Cascading referential integrity constraint
-- in the tblgender if i am deleting the gender id 1 then in the tblPerson any id have gender 1 then that GenderID become the orphan
-- the sql server its not allowing delete


-- single employee update the table
UPDATE tblPerson
SET GenderId = 1
WHERE ID = 9;

-- multiple employee update

UPDATE tblPerson 
SET GenderId = CASE
    WHEN ID = 1  then 1
	when ID = 2  then 2
	when ID = 3  then 1
	when ID = 7  then 1
	when ID = 8  then 1
	when ID = 10  then 2
	when ID = 11  then 3
	else GenderId
	END
	WHERE ID IN(1,2,3,7,8,10,11);

select * from tblPerson
select * from tblGender


delete from tblGender where ID = 3
select * from tblPerson
select * from tblGender

--1 No Action
--2 Cascade means if i am deleting the the rows from the primary table and it foriegn key entire table rows will delete
--3 Set NULL
--4 Set Default


-- PART 6 - Check constraint