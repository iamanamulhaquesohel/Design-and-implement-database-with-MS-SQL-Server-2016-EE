/* NAME: ANAMUL HAQUE SOHEL,  ID: 1264855*/

/*
ANSWER TO THE QUESTION NO. 1
*/
--ANSWER TO THE QUESTION NO. A--
CREATE DATABASE CollegeDB
ON
(
	 NAME = 'CollegeDB_Data_1',
	 FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\CollegeDB_Data_1.mdf',
	 SIZE=25MB,
	 MAXSIZE=100MB,
	 FILEGROWTH=5%
)
LOG ON
(
	NAME = 'CollegeDB_Log_1',
	 FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\CollegeDB_Log_1.ldf',
	 SIZE=2MB,
	 MAXSIZE=50MB,
	 FILEGROWTH=1MB
)
GO

--ANSWER TO THE QUESTION NO. B--

--USE DATABASE--
USE CollegeDB
GO

--INSERT ALL RECORDS INTO TABLE WRITING SCRIPT--

--CREATE TEACHERS TABLE (PARENTS TABLE)--
CREATE TABLE Teachers
(
	TeacherID INT NOT NULL,
	TeacherName NVARCHAR(40) NOT NULL,
	PRIMARY KEY (TeacherID)
)
GO

--CREATE SUBJECTS TABLE--
CREATE TABLE Subjects
(
	SubjectID INT NOT NULL,
	SubjectName NVARCHAR(40) NOT NULL,
	TeacherID INT NOT NULL,
	PRIMARY KEY (SubjectID),
	FOREIGN KEY (TeacherID) REFERENCES Teachers (TeacherID)
)
GO

--CREATE SEMESTERS TABLE (PARENTS TABLE)--
CREATE TABLE Semesters
(
	SemesterID INT NOT NULL,
	SemesterName NVARCHAR(40) NOT NULL,
	PRIMARY KEY (SemesterID)
)
GO

--CREATE STUDENTS TABLE--
CREATE TABLE Students
(
	StudentID INT NOT NULL,
	StudentName NVARCHAR(40) NOT NULL,
	SemesterID INT NOT NULL,
	PRIMARY KEY (StudentID),
	FOREIGN KEY (SemesterID) REFERENCES Semesters (SemesterID)
)
GO

--CREATE STUDENT_SUBJECTS TABLE--
CREATE TABLE Student_Subjects
(
	StudentID INT NOT NULL,
	SubjectID INT NOT NULL,
	PRIMARY KEY (StudentID, SubjectID),
	FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
	FOREIGN KEY (SubjectID) REFERENCES Subjects (SubjectID)
)
GO

--INSERT DATA INTO THE TEACHERS TABLE --
INSERT INTO Teachers
VALUES	(101, 'A'),
		(102, 'B'),
		(103, 'C')
GO

--VIEW THE INSERTED DATA--
SELECT *
FROM Teachers
GO

--INSERT DATA INTO THE SEMESTERS TABLE --
INSERT INTO Semesters
VALUES	(1, 'Spring'),
		(2, 'Summer'),
		(3, 'Fall'),
		(4, 'Winter')
GO

--VIEW THE INSERTED DATA--
SELECT *
FROM Semesters
GO

--INSERT DATA INTO THE STUDENTS TABLE --
INSERT INTO Students
VALUES	(1, 'AA',1 ),
		(2,'BB',2),
		(3, 'CC',3)
GO
--VIEW THE INSERTED DATA--
SELECT *
FROM Students
GO

INSERT INTO Subjects
VALUES	(1, 'C#', 101),
		(2, 'DATABASE', 102),
		(3, 'WEB DESIGN', 103)
GO
--VIEW THE INSERTED DATA--
SELECT *
FROM Subjects
GO

INSERT INTO Student_Subjects
VALUES (1,2), (1, 1), (2,3), (3,1)
GO
--VIEW THE INSERTED DATA--
SELECT *
FROM Student_Subjects
GO



--ANSWER TO THE QUESTION NO. C--
--DELETE QUERY--
DELETE FROM Subjects
WHERE SubjectID = 1
GO

--ANSWER TO THE QUESTION NO. D--
--UPDATE QUERY--
UPDATE Students
SET StudentName = 'Anamul Haque Sohel'
WHERE StudentID = 1
GO

/*
ANSWER TO THE QUESTION NO. 2
*/
--ANSWER TO THE QUESTION NO. A--

SELECT *
FROM Teachers T
INNER JOIN Subjects SB ON SB.TeacherID = T.TeacherID
INNER JOIN Student_Subjects SS ON SS.StudentID = SB.TeacherID
INNER JOIN Students ST ON ST.StudentID = SS.StudentID
INNER JOIN Semesters SM ON SM.SemesterID = ST.SemesterID
GO

 SELECT *, COUNT(SS.SubjectID) 'Subject count'
 FROM Semesters SB
 INNER JOIN Students ST ON SM.SemesterID = ST.SemesterID
 INNER JOIN Student_Subjects SS ON ST.StudentID = SS.StudentID
 INNER JOIN Subjects SB ON SS.SubjectID = .subjectid
 GROUP BY *
 HAVING SM.SEMISTER = 'Spring'
 GO
--ANSWER TO THE QUESTION NO. B--
SELECT  * 
FROM (SELECT studentid, COUNT(subjectid) 'COUNT'
FROM Student_Subjects 
GROUP BY StudentID ) AS v
ORDER BY v.count
GO
--ANSWER TO THE QUESTION NO. C--
SELECT SubjectID, SubjectName,
CASE
	WHEN SubjectName IN ('Web Design', 'PHP') THEN 'Web development'
	WHEN SubjectName IN ('Data Base', 'Data Mining') THEN 'Database Programming'
	ELSE 'Other programing language'
 END 'Subject Group'
 FROM Subjects
 GO
--ANSWER TO THE QUESTION NO. D--
WITH ST AS
(
	SELECT StudentID, StudentName, SemesterID
	FROM Students
)
SELECT SM.SemesterName, ST.StudentName
FROM Semesters SM
INNER JOIN  ST ON SM.SemesterID = ST.SemesterID
GO
--ANSWER TO THE QUESTION NO. E--
SELECT CAST('01-JUNE-2019 10:00 AM' AS DATE)
GO
--ANSWER TO THE QUESTION NO. F--
SELECT CONVERT(VARCHAR(19), GETDATE()) AS 'DATE AND TIME'
GO

SELECT CONVERT(VARCHAR(19), GETDATE(), 10) AS 'DATE'
GO

SELECT CONVERT(VARCHAR(19), GETDATE(), 6) AS 'DATE'
GO
--ANSWER TO THE QUESTION NO. G--
SELECT RANK(StudentID)
FROM Students
GROUP BY *
GO