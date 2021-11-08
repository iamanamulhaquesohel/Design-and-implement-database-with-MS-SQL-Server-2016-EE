/*
	ID: 1264855
	Name: Anamul Haque Sohel
*/
		--START THE SQL DML QUERRY FOR PROJECT--
--CREATEING DATABASE--

--FOR USING DATABASE--
USE daycaredb
GO
--INSERT DATA INTO THE BRANCHES TABLE--
INSERT INTO Branches
VALUES	(70001, 'Dhaka', 'Lalmatia, Mohammadpur'),
		(70002, 'Gazipur', 'Salna, Jaydebpur'),
		(70003, 'Chittagong', 'Sadar, Chittagong '),
		(70004, 'Brahmanbaria', 'Sadar, Brahmanbaria'),
		(70005, 'Chandpur', 'Sadar, Chandpur'),
		(70006, 'Joypurhat', 'Sadar, Joypurhat'),
		(70007, 'Chittagong', 'Mirersorai, Chittagong'),
		(70008, 'Dhaka', 'Najim Uddin Road, Old Dhaka')
GO
--CHECK THE INSERTED DATA --
SELECT *
FROM Branches
GO
--INSERT DATA INTO THE EMPLOYEES TABLE--
INSERT INTO Employees
VALUES	(11101, 'Mr. Lablu  ','017XXXXXXXX', 70001),
		(11102, 'Mohammad Shafayet', '017XXXXXXXX', 70001),
		(11103, 'Mohammad Yeasin', '017XXXXXXXX',70001),
		(11104, 'Abdullah Bin', '017XXXXXXXX',70002),
		(11105, 'Rakib Hassan','017XXXXXXXX',70002),
		(11106, 'Ajaj Ahmed', '017XXXXXXXX',70003),
		(11107, 'Mohammad Hassan ','017XXXXXXXX',70007),
		(11108, 'Md Tanjim','017XXXXXXXX',70008)
GO
--CHECK THE INSERTED DATA --
SELECT *
FROM Employees
GO
--INSERT DATA INTO THE GURDIANS TABLE--
INSERT INTO Gurdians
VALUES	(1201, 'Mohammad Shafiq', 'Lalmatia, Mohammadpur', '017XXXXXXXX'),
		(1202, 'Kabir Khan', 'Salna, Jaydebpur', '017XXXXXXXX'),
		(1203, 'Mohammad Lablu', 'Sadar, Chittagong', '017XXXXXXXX'),
		(1204, 'Shafin Khan', 'Sadar, Brahmanbaria', '017XXXXXXXX'),
		(1205, 'Arif Hassan', 'Sadar, Chandpur', '017XXXXXXXX'),
		(1206, 'Habibul Haque', 'Sadar, Joypurhat', '017XXXXXXXX'),
		(1207, 'Mohammad Hassan ', 'Mirersorai, Chittagong', '017XXXXXXXX'),
		(1208, 'Mohammad Shuvo', 'Najim Uddin Road, Old Dhaka', '017XXXXXXXX')
GO
--CHECK THE INSERTED DATA --
SELECT *
FROM Gurdians
GO
--INSERT DATA INTO THE CHILDRENS TABLE--
INSERT INTO Childrens
VALUES	(12601, 'Abu Sufian ', 70001, 1201),
		(12602, 'Kalimullah', 70002, 1201 ),
		(12603, 'Md Mazid',  70003, 1201),
		(12604, 'Md Raju Ahmed', 70004, 1202),
		(12605, 'Rezaul Miah',  70005, 1202),
		(12606, 'Raju Khan', 70006, 1202 ),
		(12607, 'Mohon Miah ',  70007, 1207),
		(12608, 'Mamun Khan',  70008, 1205),
		(12609, 'Mamun Khan',  70008, 1205),
		(12610, 'Mamun Khan',  70008, 1208),
		(12611, 'Mamun Khan',  70008, 1208)
GO
--CHECK THE INSERTED DATA --
SELECT *
FROM Childrens
GO

--JOIN ALL THE TABLE --
SELECT *
FROM Employees
INNER JOIN  Branches  ON Employees.Branch_ID = Branches.Branch_ID
INNER JOIN Childrens  ON Branches.Branch_ID = Childrens.Branch_ID
INNER JOIN Gurdians  ON Gurdians.Gurdian_ID = Childrens.Gurdian_ID
GO
--INSERT DATA TO THE BRANCHES TABLE USING PROCEDURE--
EXEC spInsertbranch 'Dhaka', 'Lalmatia, Mohammadpur'
EXEC spInsertbranch 'Gazipur', 'Salna, Jaydebpur'
EXEC spInsertbranch 'Chittagong', 'Sadar, Chittagong'
EXEC spInsertbranch 'Brahmanbaria', 'Sadar, Brahmanbaria'
EXEC spInsertbranch 'Chandpur', 'Sadar, Chandpur'
EXEC spInsertbranch 'Joypurhat', 'Sadar, Joypurhat'
GO

SELECT * FROM Branches
GO
--UPDATE DATA TO THE BRANCHES TABLE USING PROCEDURE--
EXEC spUpdatebranch 70009, 'Chittagong', 'Mirersorai, Chittagong'
EXEC spUpdatebranch 70010, 'Joypurhat', 'Sadar, Joypurhat'
EXEC spUpdatebranch 70011, 'Brahmanbaria', 'Sadar, Brahmanbaria'
GO

SELECT * FROM Branches
GO
--DELETE DATA TO THE BRANCHES TABLE USING PROCEDURE--
EXEC spDeletebranch 70012
EXEC spDeletebranch 70013
EXEC spDeletebranch 70014
GO

SELECT * FROM branches
GO
--INSERT DATA TO THE EMPLOYEES TABLE USING PROCEDURE--
EXEC spInsertemployee 'Mr. Lablu  ','017XXXXXXXX', 70001
EXEC spInsertemployee 'Mohammad Shafayet', '017XXXXXXXX', 70001
EXEC spInsertemployee 'Mohammad Yeasin', '017XXXXXXXX',70001
EXEC spInsertemployee 'Abdullah Bin', '017XXXXXXXX',70002
EXEC spInsertemployee 'Rakib Hassan','017XXXXXXXX',70002
EXEC spInsertemployee 'Ajaj Ahmed', '017XXXXXXXX',70003
EXEC spInsertemployee 'Mohammad Hassan ','017XXXXXXXX',70007
EXEC spInsertemployee 'Md Tanjim','017XXXXXXXX',70008
GO

SELECT * FROM Employees
GO
--UPDATE DATA TO THE EMPLOYEES TABLE USING PROCEDURE--
EXEC spUpdateemployee 11109, 'Rakib Hassan','017XXXXXXXX', 70002
EXEC spUpdateemployee 11110, 'Abdullah Bin', '017XXXXXXXX',70002
EXEC spUpdateemployee 11111, 'Mohammad Shafayet', '017XXXXXXXX', 70001
GO

SELECT * FROM Employees
GO
--DELETE DATA TO THE EMPLOYEES TABLE USING PROCEDURE--
EXEC spDeleteemployee 11114
EXEC spDeleteemployee 11115
EXEC spDeleteemployee 11116
GO

SELECT * FROM Employees
GO
--INSERT DATA TO THE GURDIAN TABLE USING PROCEDURE--
EXEC spInsertgurdian 'Mohammad Shafiq','Lalmatia, Mohammadpur', '017XXXXXXXX'
EXEC spInsertgurdian 'Kabir Khan', 'Salna, Jaydebpur', '017XXXXXXXX'
EXEC spInsertgurdian 'Mohammad Lablu', 'Sadar, Chittagong', '017XXXXXXXX'
EXEC spInsertgurdian 'Shafin Khan', 'Sadar, Brahmanbaria', '017XXXXXXXX'
EXEC spInsertgurdian 'Arif Hassan', 'Sadar, Chandpur', '017XXXXXXXX'
EXEC spInsertgurdian 'Habibul Haque', 'Sadar, Joypurhat', '017XXXXXXXX'
EXEC spInsertgurdian 'Mohammad Hassan ', 'Mirersorai, Chittagong', '017XXXXXXXX'
EXEC spInsertgurdian 'Mohammad Shuvo', 'Najim Uddin Road, Old Dhaka', '017XXXXXXXX'
GO

SELECT * FROM gurdians
GO
--UPDATE DATA TO THE GURDIAN TABLE USING PROCEDURE--
EXEC spUpdategurdian 1209, 'Ikram Mahbub', 'Solimullah Road, Sirajganj', '018XXXXXXXX'
EXEC spUpdategurdian 1210, 'Tipu Sultan', 'Ahmed Nagar, Fatullah', '018XXXXXXXX'
EXEC spUpdategurdian 1210, 'Mannan Bhuiyan', 'Gulshan 2', '016XXXXXXXX'
GO

SELECT * FROM gurdians
GO

--DELETE DATA TO THE GURDIAN TABLE USING PROCEDURE--
EXEC spDeletegurdian 1214
EXEC spDeletegurdian 1215
EXEC spDeletegurdian 1216
GO

SELECT * FROM gurdians
GO
--INSERT DATA TO THE CHILDREN TABLE USING PROCEDURE--
EXEC spInsertchildren 'Abu Sufian ', 70001, 1201
EXEC spInsertchildren 'Kalimullah', 70002, 1201
EXEC spInsertchildren  'Md Mazid',  70003, 1201
EXEC spInsertchildren 'Md Raju Ahmed', 70004, 1202
EXEC spInsertchildren 'Rezaul Miah',  70005, 1202
EXEC spInsertchildren 'Raju Khan', 70006, 1202
EXEC spInsertchildren 'Mohon Miah ',  70007, 1207
EXEC spInsertchildren 'Mamun Khan',  70008, 1205
GO

SELECT * FROM Childrens
GO
--UPDATE DATA TO THE CHILDREN TABLE USING PROCEDURE--
EXEC spUpdatechildren 12614, 'Raju Khan', 70006, 1202
EXEC spUpdatechildren 12615, 'Mohon Miah ',  70007, 1207
EXEC spUpdatechildren 12616, 'Mamun Khan',  70008, 1208
GO

SELECT * FROM Childrens
GO
--DELETE DATA TO THE EMPLOYEES TABLE USING PROCEDURE--
EXEC spDeletechildren 12615
EXEC spDeletechildren 12616
EXEC spDeletechildren 12617
GO

SELECT * FROM Childrens
GO
--AGAIN INSERT USING PROCEDURE--
EXEC spInsertgurdian 'Mohammad Shafiq','Lalmatia, Mohammadpur', '017XXXXXXXX'
EXEC spInsertgurdian 'Kabir Khan', 'Salna, Jaydebpur', '017XXXXXXXX'
EXEC spInsertgurdian 'Mohammad Lablu', 'Sadar, Chittagong', '017XXXXXXXX'
EXEC spInsertgurdian 'Shafin Khan', 'Sadar, Brahmanbaria', '017XXXXXXXX'
GO

SELECT * FROM gurdians
GO

--CALLING THE SCALAR FUNCTION--
SELECT dbo.fnScalarchildren (1201) AS 'Childrens'
GO

SELECT dbo.fnScalaremployee (70001) AS 'Employees'
GO

--CALLING THE TABLE VALUED FUNCTION--
SELECT * 
FROM fnTablebygurdianId(1201)
GO

SELECT * 
FROM fnTablebybranchId(70001)
GO

SELECT * 
FROM fnTablebyemployeeId(11101)
GO

SELECT * 
FROM fnTablebychildrenId(12601)
GO

--EXTRACT THE VIEW--
SELECT *
FROM vInfo
GO

--CHECK THE TRIGGER--
SELECT *
FROM employees
GO

--THERE IS A ERROR ON INSERTING DATA BY TRIGGER--
--ERROR--
INSERT INTO employees
VALUES	(11114, 'Mr. Lablu  ','017XXXXXXXX', 70004),
		(11115, 'Mohammad Shafayet', '017XXXXXXXX', 70004),
		(11116, 'Mohammad Yeasin', '017XXXXXXXX',70004),
		(111117, 'Mohammad Yeasin', '017XXXXXXXX',70004)
GO
--INSERTED--
INSERT INTO employees
VALUES	(11114, 'Mr. Lablu  ','017XXXXXXXX', 70004),
		(11115, 'Mohammad Shafayet', '017XXXXXXXX', 70004),
		(11116, 'Mohammad Yeasin', '017XXXXXXXX',70004)
GO

--CHECK THE CHILDREN TRIGGER--
SELECT *
FROM childrens
GO

--THERE IS A ERROR ON INSERTING DATA BY TRIGGER--
--ERROR--
INSERT INTO childrens
VALUES	(12628, 'Raju Khan', 70006, 1202 ),
		(12629, 'Mohon Miah ',  70007, 1207),
		(12630, 'Mamun Khan',  70008, 1205),
		(12631, 'Mamun Khan',  70008, 1205),
		(12632, 'Mamun Khan',  70008, 1208)
GO
--INSERTED--
INSERT INTO childrens
VALUES	(12628, 'Raju Khan', 70009, 1206 ),
		(12629, 'Mohon Miah ',  70009, 1206),
		(12630, 'Mamun Khan',  70010, 1207),
		(12631, 'Mamun Khan',  70010, 1207)
GO

--TO DELETE THE CURRENT DATABASE-UN COMMENT THE BELOW CODE AND RUN---

--USE master
--GO
--DROP DATABASE IF EXISTS daycaredb
--GO


