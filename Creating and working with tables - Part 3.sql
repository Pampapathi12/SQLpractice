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
-- check constraint is used to limit the range of the values, that can be entered for a coumn
-- syntax
-- alter table tablename add constraint constraintname check boolean_expression


-- to drop the check constraint
-- alter table tablename drop constraint ck_tblperson_age
Alter Table tblPerson
Drop Constraint CK_tblPerson_Age

Alter Table tblPerson
Add Constraint CK_tblPerson_Age Check (AGE > 0 AND AGE < 150)

select * from tblPerson
select * from tblGender

-- to add the new column to exist table
Alter table tblPerson add Age INT;
insert into tblPerson(ID, Name, Email,GenderId,Address,Age) Values (4,'rigch', 'rr@r.com',1, 'Bellary', -23)
-- check constraint to restrict the age should be not minus and more then reach age 
-- using the 2 ways graphical and query
-- delete row from specific table values
Delete from tblPerson where ID = 4

insert into tblPerson(ID, Name, Email,GenderId,Address,Age) Values (6,'rigch', 'rr@r.com',1, 'Bellary', NULL)

--Part 7 - Identity Column

-- what is identity column
-- creating an identity column
-- supply explict values for identity columns using the identity_insert
-- reset identity values using the DBCC checkident command
select * from tblPerson1

-- to turn the identity explicitylitily

set identity_insert tblPerson1 ON

set identity_insert tblPerson1 OFF

insert into tblPerson1 (PersonId,Name) values(1,'Jane')
insert into tblPerson1 values('Pampa')
--Msg 545, Level 16, State 1, Line 133
--Explicit value must be specified for identity column in table 'tblPerson1' either when IDENTITY_INSERT is set to ON or when a replication user is inserting into a NOT FOR REPLICATION identity column.
delete from tblPerson1
-- after deleting the entire rows value id value will increment happening

delete from tblPerson1 where PersonId = 1

insert into tblPerson(ID, Name, Email,GenderId,Address,Age) Values (11,'rigch', 'rr@r.com',1, 'Bellary', NULL)
insert into tblPerson(ID, Name, Email,GenderId,Address,Age) Values (12,'rigch', 'rr@r.com',1, 'Bellary', NULL)

-- in the above 2 query creating same id for the same name then its become to confuse , uniquely identity by id two 'rigch'
-- those identity column sql server generate

-- 
create table tblperson2
( PersonId int identity(1,1) Primary Key,
Name nvarchar(20)
)

select * from tblperson2

insert into tblperson2 values('pampapathi')



