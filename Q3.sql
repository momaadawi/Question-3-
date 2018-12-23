-- Question 3: 
----1)
---		a- Write code.  I want to know information about SQL version and edition.
		SELECT  @@VERSION AS Version , SERVERPROPERTY('Edition') AS Edition
-----------------------------------------------------------
  -----b-Write code to insert 1000 row to country table  have columns( id, Countryname ).

		CREATE table TestTable11 (id int , CountryName nvarchar(50))

		GO

		declare @id int = 1

		while @id >=1 and @id <= 1000
		begin
			insert into [dbo].[TestTable11] 
				values(@id,'country'+convert(nvarchar(50),@id))
			set @id = @id + 1
		end

		GO
------------------------------------------------------------------------------------
	-------c-	Write code to delete rows duplicated and leave only one row from these.
			SELECT DISTINCT colName 
			FROM TableName;
------------------------------------------------------------------------------------
----2)	Write code to create function with name f_captalize  I can pass word return first character Capital only.		 

		CREATE TABLE Customers (FirstName nvarchar(50))
			(	'ahmed',
				'ibrahim',
				'aiden',
				'sara',
				'lance',
				'enaas');


		SELECT concat(upper(SUBSTRING(FirstName, 1, 1)),
		LOWER(SUBSTRING(FirstName,2,len(FirstName)))) 
		From Customers
			go
			---other soluotion 
		SELECT UPPER(LEFT(FirstName,1))+LOWER(SUBSTRING(FirstName,2,LEN(FirstName)))
		 FROM Customers
-----------------------------------------------------------------------------------
---3)	

		---Returns a row for each user table in SQL Server
		SELECT * from sys.tables

	
		--***ask me : confused with System-Versioned Temporal Tables 
-----------------------------------------------------------------------------------

SELECT * from sys.types
-- it's table contain all data type of the sys..  
	--???
------------------------------------------------------------------------------------
----4)	
		--it's user created table to track and snapshot all DML statment 
			---and changed data 

		-- more : in sql server 2016 log data table added by microsoft 
			sys.sp_cdc_enable_table ---not suported in 2014 versions 
			--- https://docs.microsoft.com/en-us/sql/relational-databases/track-changes/track-data-changes-sql-server?view=sql-server-2017#Capture
