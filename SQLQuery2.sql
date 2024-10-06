--How to get the last generated identity column value in SQL Server - Part 8
-- user 1 session
create table test1(
ID int identity(1,1),
value nvarchar(20))

create table test2(
ID int identity(1,1),
value nvarchar(20))



insert into test1 values('pampapathi')
insert into test2 values('pampapathi')
select * from test1
select * from test2
-- last generated identity column retrive

-- triger a function test1 table, after the some action happen on the table
insert into test1 values('pampapathi123as')

Create Trigger trForInsert on test1 for Insert 
as 
Begin
	Insert into test2 Values('yyy')
End


select SCOPE_IDENTITY()
select @@IDENTITY 
select ident_current('test2') 
-- specific table across any session and any scope.
