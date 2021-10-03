/*
	ID: 1264855
	Name: Anamul Haque Sohel
*/
		--START THE SQL QUERRY FOR EVIDENCE EXAM--
--CREATEING DATABASE--
--USE THE MASTER DATABASE--
USE master
GO
DROP DATABASE IF EXISTS db_1264855
BEGIN
    CREATE DATABASE db_1264855
END
GO
--FOR USING DATABASE--
USE db_1264855
GO

--CREATEING TABLE FOR ANSWER THE QUESTION--
DROP TABLE IF EXISTS Books
GO
CREATE TABLE Books
(
	[ID-AUTO] INT IDENTITY,
	[ID] INT,
	[Title] NVARCHAR(50) NOT NULL,
	Author NVARCHAR(50) NOT NULL,
	[Format] NVARCHAR(20) NOT NULL,
	[Price] MONEY NOT NULL,
	PRIMARY KEY ([ID])
)
GO

--INSERT DATA INTO THE TABLE--
INSERT INTO Books
VALUES	(1,'Microsoft Visual C#', 'John Sharp', 'PDF', 6000.00),
		(2, 'SQL Server 2016', 'Murachs', 'PDF', 6500.00),
		(3, 'ASP.NET', 'Anamul Haque', 'DOC', 7000.00),
		(4, 'Javascript', 'Sohel', 'DOC', 8000.00),
		(5, 'Javascript', 'Sohel', 'PDF', 8000.00),
		(6, 'Javascript', 'Sohel', 'PDF', 8000.00)
GO

--CHECK THE DATA OF TABLE--
SELECT *
FROM Books
GO

			--ANSWER TO THE QUESTION NO 1--
--CREATEING A VIEW--
CREATE VIEW PDFBooksViews AS
SELECT [ID-AUTO],ID, [Title], Author, [Format], Price
FROM Books
WHERE [format]='PDF'
GO

--SEE THE VIEW--
SELECT *
FROM PDFBooksViews
GO
--BLANK THE TABLE TO GET DATA FROM PROCEDURE--
TRUNCATE TABLE Books
GO
--AGAIN CHECK TABLE DATA--
SELECT *
FROM Books
GO
				--ANSWER TO THE QUESTION NO 2--

--CREATING PROCEDURE TO INSERT DATA INTO TABLE
CREATE PROC SpBookInsert
	@ID INT,
	@Title NVARCHAR(50),
	@Author NVARCHAR(50),
	@Format NVARCHAR(20),
	@Price MONEY, 
	@IdOut INT OUTPUT
AS
BEGIN TRY
	INSERT INTO books ( ID, [Title], Author, [Format], Price)
	VALUES (@ID, @Title, @Author, @Format, @Price)
	SELECT @IdOut = IDENT_CURRENT('Books')
END TRY
BEGIN CATCH
	RAISERROR ('Insert failed', 11, 1)
	RETURN
END CATCH
GO

--INSERTING DATA USING PROCEDURE--
DECLARE @NewBookID INT
EXEC SpBookInsert  1,'Microsoft Visual C#', 'John Sharp', 'PDF', 6000.00, @NewBookID OUTPUT
SELECT @NewBookID 'New ID Number'
GO

DECLARE @NewBookID INT
EXEC SpBookInsert  2, 'SQL Server 2016', 'Murachs', 'PDF', 6500.00, @NewBookID OUTPUT
SELECT @NewBookID 'New ID Number'
GO

DECLARE @NewBookID INT
EXEC SpBookInsert 3, 'ASP.NET', 'Anamul Haque', 'DOC', 7000.00, @NewBookID OUTPUT
SELECT @NewBookID 'New ID Number'
GO

DECLARE @NewBookID INT
EXEC SpBookInsert 4, 'Javascript', 'Sohel', 'DOC', 8000.00, @NewBookID OUTPUT
SELECT @NewBookID 'New ID Number'
GO

DECLARE @NewBookID INT
EXEC SpBookInsert 5, 'Javascript', 'Sohel', 'PDF', 8000.00, @NewBookID OUTPUT
SELECT @NewBookID 'New ID Number'
GO

DECLARE @NewBookID INT
EXEC SpBookInsert 6, 'Javascript', 'Sohel', 'PDF', 8000.00, @NewBookID OUTPUT
SELECT @NewBookID 'New ID Number'
GO
--CHECK THE TABLE DATA TO INSERTED BY PROCEDURE--
SELECT *
FROM Books
GO
--CREATING PROCEDURE TO UPDATE DATA FROM TABLE--
CREATE PROC SpBookUpdate
	@Id INT,
	@Title NVARCHAR(50),
	@Author NVARCHAR(50),
	@Format NVARCHAR(20),
	@Price MONEY				
AS
BEGIN TRY
	UPDATE Books
	SET [ID] = @Id,
		Title = @Title,
		Author = @Author,
		[format] = @Format,
		Price = @Price
	WHERE ID = @id	
END TRY
BEGIN CATCH
	RAISERROR ('Update failed', 11, 1)
	RETURN
END CATCH
GO

--UPDATING DATA USING PROCEDURE--
EXEC SpBookUpdate 5, 'Bootstrap', 'NoOne','PDF', 4200.00
GO
--CHECK THE TABLE AFTER UPDATE DATA--
SELECT *
FROM Books
GO

--CREATING PROCEDURE TO DELETE DATA FROM TABLE--
CREATE PROC SpBookDelete
	@Id INT				
AS
BEGIN TRY
	DELETE Books
	WHERE ID = @id	
END TRY
BEGIN CATCH
	;
	THROW 50002, 'Delete Failed',  1	
END CATCH
GO

--DELETING DATA FROM TABLE-- 
EXEC SpBookDelete 1
EXEC SpBookDelete 2
EXEC SpBookDelete 3
EXEC SpBookDelete 4
EXEC SpBookDelete 5
EXEC SpBookDelete 6
GO
--CHECK THE TABLE AFTER DELETED DATA--
SELECT *
FROM Books
GO

--AGAIN INSERT USING PROCEDURE--
DECLARE @NewBookID INT
EXEC SpBookInsert 1,'Microsoft Visual C#', 'John Sharp', 'PDF', 6000.00, @NewBookID OUTPUT
EXEC SpBookInsert 2, 'SQL Server 2016', 'Murachs', 'PDF', 6500.00, @NewBookID OUTPUT
EXEC SpBookInsert 3, 'ASP.NET', 'Anamul Haque', 'DOC', 7000.00, @NewBookID OUTPUT
EXEC SpBookInsert 4, 'Javascript', 'Sohel', 'DOC', 8000.00, @NewBookID OUTPUT
EXEC SpBookInsert 5, 'Javascript', 'Sohel', 'PDF', 8000.00, @NewBookID OUTPUT
EXEC SpBookInsert 6, 'Javascript', 'Sohel', 'PDF', 8000.00, @NewBookID OUTPUT
GO
--CHECK THE TABLE AFTER AGAIN INSERTED DATA--
SELECT *
FROM Books
GO

				--ANSWER TO THE QUESTION NO 3--

--CREATE AN INSTEAD TRIGGER--
CREATE TRIGGER TriggerInsertFired
ON Books
FOR INSERT
AS
BEGIN
	DECLARE @Format NVARCHAR(20)
	SELECT @Format =[format] FROM inserted 
	IF @Format NOT IN ('PRINT', 'PDF', 'DOC')
	BEGIN
		RAISERROR( 'Invalid format', 11, 1)
		ROLLBACK TRAN	
	END
END
GO
--CHECKING TRIGGER BY INSERTING DATA--
INSERT INTO books
VALUES (8, 'C Programming', 'MR Sohel', 'PDF', 8000.00)
GO

INSERT INTO books
VALUES (9, 'C Programming', 'MR Sohel', 'ABC', 8000.00)--ERROR
GO

INSERT INTO books
VALUES (10, 'C Programming', 'MR Sohel', 'DOC', 8000.00)
GO

INSERT INTO books
VALUES (11, 'C Programming', 'MR Sohel', 'PRINT', 8000.00)
GO

--CREATING AFTER TRIGGER TO DELETE DATA--
CREATE TRIGGER TriggerDeletedFired
ON Books
AFTER DELETE
AS
BEGIN 
	IF @@ROWCOUNT > 50
	BEGIN
		PRINT 'You Can not delete more than 50 row at a time'
		ROLLBACK TRAN
	END
END
GO

--DELETING DATA FROM TABLE TO FIRE THE TRIGGER--
DELETE FROM Books
WHERE [Format]= 'PDF'
GO

--DELETING DATA FROM TABLE TO FIRE THE TRIGGER--
DELETE FROM Books
WHERE id= 4
GO

--CREATING AFTER TRIGGER TO UPDATE DATA--
CREATE TRIGGER TriggerUpdateFired
ON Books
AFTER UPDATE
AS
BEGIN 
	IF @@ROWCOUNT > 50
	BEGIN
		PRINT 'You Can not delete more than 50 row at a time'
		ROLLBACK TRAN
	END
END
GO
			
				--ANSWER TO THE QUESTION NO 4--

--CREATING A SCALER VALUED FUNCTION--
CREATE FUNCTION FnBooksFormatCount(@Format NVARCHAR(30)) 
RETURNS INT
AS
BEGIN
DECLARE @Count INT
	SELECT @Count = COUNT(*) 
	FROM Books
	WHERE [Format]=@Format
RETURN @Count
END
GO
--CALLING THE FUNCTION--
SELECT dbo.FnBooksFormatCount ('PDF') AS 'Books Format Count'
GO

SELECT dbo.FnBooksFormatCount ('DOC') AS 'Books Format Count'
GO

				--ANSWER TO THE QUESTION NO 5--

--CREATE A TABLE VALUED FUNCTION--
CREATE FUNCTION FnBooksFormatCountTable()
RETURNS TABLE
AS
RETURN (
	SELECT [Format],
	COUNT(*) AS 'Count'
	FROM Books
	GROUP BY [Format]
)
GO
--CALLING THE FUNCTION--
SELECT * 
FROM FnBooksFormatCountTable()
GO

-- DELETE THE CURRENT DATABASE-UN COMMENT THE BELOW CODE AND RUN-
--USE master
--GO
--DROP DATABASE db_1264855
--GO


