//database is collection tables and objects

// Creating and altering database 1

// create database using query

Create Database Pampapathi1 

// know the mdf and ldf file C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA

// mdf master data file mdf
// transaction log files ldf :- two files will create

// rename database

1. Alter Database pampapathi Modify Name = Pampa

// store procedure is group of sql commands to execute
// 2 types store procedure . system store procedure and user defined store procedure

// alter database pampapathi1 use store procedure

sp_renameDB 'pampapathi1', 'pampapathi2'

drop the data base,  

Drop database pampapathi2
// when database is use another use then the if delete then it will not delete 


// deleting or dropping a database

Alter Database Pampapathi2 Set SINGLE_USER With Rollback Immediate
Drop database pampapathi2




