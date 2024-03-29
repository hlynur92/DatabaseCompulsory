USE [master]
GO

IF DB_ID('Company') IS NOT NULL
BEGIN
	DROP DATABASE [Company]
END

CREATE DATABASE [Company]
GO

USE [Company]
GO

/****** Object:  Table [dbo].[Department]    Script Date: 09-02-2016 22:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

/** ######################################### ***/
/** ############### CreateDepartment ############# **/
CREATE TABLE [dbo].[Department](
	[DName] [varchar](50) NULL,
	[DNumber] [int] NOT NULL IDENTITY(1, 1), /*Added Identity*/
	[MgrSSN] [numeric](9, 0) NULL,
	[MgrStartDate] [datetime] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Dependent]    Script Date: 09-02-2016 22:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dependent](
	[Essn] [numeric](9, 0) NOT NULL,
	[Dependent_Name] [varchar](50) NOT NULL,
	[Sex] [nchar](1) NULL,
	[BDate] [datetime] NULL,
	[Relationship] [varchar](50) NULL,
 CONSTRAINT [PK_Dependent] PRIMARY KEY CLUSTERED 
(
	[Essn] ASC,
	[Dependent_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Dept_Locations]    Script Date: 09-02-2016 22:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Dept_Locations](
	[DNUmber] [int] NOT NULL,
	[DLocation] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dept_Locations] PRIMARY KEY CLUSTERED 
(
	[DNUmber] ASC,
	[DLocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 09-02-2016 22:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[FName] [varchar](50) NULL,
	[Minit] [char](1) NULL,
	[LName] [varchar](50) NULL,
	[SSN] [numeric](9, 0) NOT NULL,
	[BDate] [datetime] NULL,
	[Address] [varchar](50) NULL,
	[Sex] [char](1) NULL,
	[Salary] [numeric](10, 2) NULL,
	[SuperSSN] [numeric](9, 0) NULL,
	[Dno] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Project]    Script Date: 09-02-2016 22:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project](
	[PName] [varchar](50) NULL,
	[PNumber] [int] NOT NULL,
	[PLocation] [varchar](50) NULL,
	[DNum] [int] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[PNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Works_on]    Script Date: 09-02-2016 22:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Works_on](
	[Essn] [numeric](9, 0) NOT NULL,
	[Pno] [int] NOT NULL,
	[Hours] [float] NULL,
 CONSTRAINT [PK_Works_on] PRIMARY KEY CLUSTERED 
(
	[Essn] ASC,
	[Pno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

DECLARE @DeptID1 INT;
DECLARE @DeptID2 INT;
DECLARE @DeptID3 INT;


INSERT [dbo].[Department] ([DName], [MgrSSN], [MgrStartDate]) VALUES (N'Headquarters', CAST(888665555 AS Numeric(9, 0)), CAST(N'1971-06-19 00:00:00.000' AS DateTime))
SELECT @DeptID1 = SCOPE_IDENTITY();
INSERT [dbo].[Department] ([DName], [MgrSSN], [MgrStartDate]) VALUES (N'Administration', CAST(123456789 AS Numeric(9, 0)), CAST(N'1986-01-01 00:00:00.000' AS DateTime))
SELECT @DeptID2 = SCOPE_IDENTITY();
INSERT [dbo].[Department] ([DName], [MgrSSN], [MgrStartDate]) VALUES (N'Research', CAST(987654321 AS Numeric(9, 0)), CAST(N'1978-05-22 00:00:00.000' AS DateTime))
SELECT @DeptID3 = SCOPE_IDENTITY();
INSERT [dbo].[Dependent] ([Essn], [Dependent_Name], [Sex], [BDate], [Relationship]) VALUES (CAST(123456789 AS Numeric(9, 0)), N'Alice', N'F', CAST(N'1978-12-31 00:00:00.000' AS DateTime), N'Daughter')
INSERT [dbo].[Dependent] ([Essn], [Dependent_Name], [Sex], [BDate], [Relationship]) VALUES (CAST(123456789 AS Numeric(9, 0)), N'Elizabeth', N'F', CAST(N'1957-05-05 00:00:00.000' AS DateTime), N'Spouse')
INSERT [dbo].[Dependent] ([Essn], [Dependent_Name], [Sex], [BDate], [Relationship]) VALUES (CAST(123456789 AS Numeric(9, 0)), N'Michael', N'M', CAST(N'1978-01-01 00:00:00.000' AS DateTime), N'Son')
INSERT [dbo].[Dependent] ([Essn], [Dependent_Name], [Sex], [BDate], [Relationship]) VALUES (CAST(333445555 AS Numeric(9, 0)), N'Alice', N'F', CAST(N'1976-04-05 00:00:00.000' AS DateTime), N'Daughter')
INSERT [dbo].[Dependent] ([Essn], [Dependent_Name], [Sex], [BDate], [Relationship]) VALUES (CAST(333445555 AS Numeric(9, 0)), N'Joy', N'F', CAST(N'1948-05-03 00:00:00.000' AS DateTime), N'Spouse')
INSERT [dbo].[Dependent] ([Essn], [Dependent_Name], [Sex], [BDate], [Relationship]) VALUES (CAST(333445555 AS Numeric(9, 0)), N'Theodore', N'M', CAST(N'1973-10-25 00:00:00.000' AS DateTime), N'Son')
INSERT [dbo].[Dependent] ([Essn], [Dependent_Name], [Sex], [BDate], [Relationship]) VALUES (CAST(987654321 AS Numeric(9, 0)), N'Abner', N'M', CAST(N'1932-02-29 00:00:00.000' AS DateTime), N'Spouse')

INSERT [dbo].[Dept_Locations] ([DNUmber], [DLocation]) VALUES (@DeptID1, N'Houston')
INSERT [dbo].[Dept_Locations] ([DNUmber], [DLocation]) VALUES (@DeptID2, N'Stafford')
INSERT [dbo].[Dept_Locations] ([DNUmber], [DLocation]) VALUES (@DeptID3, N'Bellaire')
INSERT [dbo].[Dept_Locations] ([DNUmber], [DLocation]) VALUES (@DeptID3, N'Houston')
INSERT [dbo].[Dept_Locations] ([DNUmber], [DLocation]) VALUES (@DeptID3, N'Sugarland')

INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'John', N'B', N'Smith', CAST(123456789 AS Numeric(9, 0)), CAST(N'1955-01-09 00:00:00.000' AS DateTime), N'731 Fondren, Houston, TX', N'M', CAST(30000.00 AS Numeric(10, 2)), CAST(987654321 AS Numeric(9, 0)), @DeptID3)
INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'Franklin', N'T', N'Wong', CAST(333445555 AS Numeric(9, 0)), CAST(N'1945-12-08 00:00:00.000' AS DateTime), N'638 Voss, Houston, TX', N'M', CAST(40000.00 AS Numeric(10, 2)), CAST(987654321 AS Numeric(9, 0)), @DeptID3)
INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'Joyce', N'A', N'English', CAST(453453453 AS Numeric(9, 0)), CAST(N'1962-07-31 00:00:00.000' AS DateTime), N'5631 Rice, Houston, TX', N'F', CAST(25000.00 AS Numeric(10, 2)), CAST(987654321 AS Numeric(9, 0)), @DeptID3)
INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'Ramesh', N'K', N'Narayan', CAST(666884444 AS Numeric(9, 0)), CAST(N'1952-09-15 00:00:00.000' AS DateTime), N'974 Fire Oak, Humble, TX', N'M', CAST(38000.00 AS Numeric(10, 2)), CAST(987654321 AS Numeric(9, 0)), @DeptID3)
INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'James', N'E', N'Borg', CAST(888665555 AS Numeric(9, 0)), CAST(N'1927-11-10 00:00:00.000' AS DateTime), N'450 Stone, Houston, TX', N'M', CAST(55000.00 AS Numeric(10, 2)), NULL, @DeptID1)
INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'Jennifer', N'S', N'Wallace', CAST(987654321 AS Numeric(9, 0)), CAST(N'1931-06-20 00:00:00.000' AS DateTime), N'291 Berry, Bellaire, TX', N'F', CAST(36000.00 AS Numeric(10, 2)), CAST(123456789 AS Numeric(9, 0)), @DeptID2)
INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'Ahmad', N'V', N'Jabbar', CAST(987987987 AS Numeric(9, 0)), CAST(N'1959-03-29 00:00:00.000' AS DateTime), N'980 Dallas, Houston, TX', N'M', CAST(25000.00 AS Numeric(10, 2)), CAST(123456789 AS Numeric(9, 0)), @DeptID2)
INSERT [dbo].[Employee] ([FName], [Minit], [LName], [SSN], [BDate], [Address], [Sex], [Salary], [SuperSSN], [Dno]) VALUES (N'Alicia', N'J', N'Zelaya', CAST(999887777 AS Numeric(9, 0)), CAST(N'1958-07-19 00:00:00.000' AS DateTime), N'3321 Castle, Spring, TX', N'F', CAST(25000.00 AS Numeric(10, 2)), CAST(123456789 AS Numeric(9, 0)), @DeptID2)

INSERT [dbo].[Project] ([PName], [PNumber], [PLocation], [DNum]) VALUES (N'ProductX', 1, N'Bellaire', @DeptID3)
INSERT [dbo].[Project] ([PName], [PNumber], [PLocation], [DNum]) VALUES (N'ProductY', 2, N'Sugarland', @DeptID3)
INSERT [dbo].[Project] ([PName], [PNumber], [PLocation], [DNum]) VALUES (N'ProductZ', 3, N'Houston', @DeptID3)
INSERT [dbo].[Project] ([PName], [PNumber], [PLocation], [DNum]) VALUES (N'Computerization', 10, N'Stafford', @DeptID2)
INSERT [dbo].[Project] ([PName], [PNumber], [PLocation], [DNum]) VALUES (N'Reorganization', 20, N'Houston', @DeptID1)
INSERT [dbo].[Project] ([PName], [PNumber], [PLocation], [DNum]) VALUES (N'Newbenefits', 30, N'Stafford', @DeptID2)

INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(123456789 AS Numeric(9, 0)), 1, 32.5)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(123456789 AS Numeric(9, 0)), 2, 7.5)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(333445555 AS Numeric(9, 0)), 2, 10)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(333445555 AS Numeric(9, 0)), 3, 10)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(333445555 AS Numeric(9, 0)), 10, 10)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(333445555 AS Numeric(9, 0)), 20, 10)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(453453453 AS Numeric(9, 0)), 1, 20)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(453453453 AS Numeric(9, 0)), 2, 20)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(666884444 AS Numeric(9, 0)), 3, 40)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(888665555 AS Numeric(9, 0)), 20, NULL)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(987654321 AS Numeric(9, 0)), 20, 15)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(987654321 AS Numeric(9, 0)), 30, 20)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(987987987 AS Numeric(9, 0)), 10, 35)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(987987987 AS Numeric(9, 0)), 30, 5)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(999887777 AS Numeric(9, 0)), 10, 10)
INSERT [dbo].[Works_on] ([Essn], [Pno], [Hours]) VALUES (CAST(999887777 AS Numeric(9, 0)), 30, 30)

ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [FK_Department_Employee] FOREIGN KEY([MgrSSN])
REFERENCES [dbo].[Employee] ([SSN])
GO

ALTER TABLE [dbo].[Dependent] ADD  CONSTRAINT [FK_Dependent_Employee] FOREIGN KEY([Essn])
REFERENCES [dbo].[Employee] ([SSN])
GO

/** ######################################### ***/
/** ############### ALTER DEPT LOCATION ############# **/
ALTER TABLE [dbo].[Dept_Locations] ADD  CONSTRAINT [FK_Dept_Locations_Department] FOREIGN KEY([DNUmber])
REFERENCES [dbo].[Department] ([DNumber]) ON DELETE CASCADE /*Added ON DELETE CASCADE**/
GO

/** ######################################### ***/
/** ############### ALTER Employee ############# **/
ALTER TABLE [dbo].[Employee]  ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([Dno])
REFERENCES [dbo].[Department] ([DNumber]) ON DELETE SET NULL /*Added ON DELETE SET NULL**/
GO

ALTER TABLE [dbo].[Employee]  ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([SuperSSN])
REFERENCES [dbo].[Employee] ([SSN])
GO

/** ######################################### ***/
/** ############### ALTER Project ############# **/
ALTER TABLE [dbo].[Project]  ADD  CONSTRAINT [FK_Project_Department] FOREIGN KEY([DNum])
REFERENCES [dbo].[Department] ([DNumber]) ON DELETE CASCADE /*Added ON DELETE CASCADE**/
GO

ALTER TABLE [dbo].[Works_on]  ADD  CONSTRAINT [FK_Works_on_Employee] FOREIGN KEY([Essn])
REFERENCES [dbo].[Employee] ([SSN]) 
GO

/** ######################################### ***/
/** ############### ALTER Works on ############# **/
ALTER TABLE [dbo].[Works_on]  ADD  CONSTRAINT [FK_Works_on_Project] FOREIGN KEY([Pno])
REFERENCES [dbo].[Project] ([PNumber]) ON DELETE CASCADE /*Added ON DELETE CASCADE**/
GO

USE [Company]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateDepartment]
	@DName varchar(50),
	@MgrSSN numeric,
	@DNumber INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT * FROM Department where [DName]=@DName)
		THROW 50001,'Error! A Deparment already exists with this DName',1
	ELSE IF EXISTS(SELECT * FROM Department where [MgrSSN]=@MgrSSN)
		THROW 50001,'Error! An existing Department is already managed by this MgrSNN',1
	ELSE
	INSERT INTO [dbo].[Department]
			(DName, MgrSSN, MgrStartDate)
     VALUES
           (@DName
           ,@MgrSSN
		   ,GETDATE())

	SELECT @DNumber = SCOPE_IDENTITY()
	RETURN
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE DeleteDepartment
	@DNumber int
AS
BEGIN
	SET NOCOUNT ON;
	DELETE Department
	WHERE DNumber = @DNumber
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE GetAllDepartments 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Department.DName, Department.DNumber, Department.MgrSSN, Department.MgrStartDate, (SELECT COUNT(*) FROM Employee WHERE Employee.Dno = Department.DNumber) AS EmployeeCount FROM Department

END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE GetDepartment 
	@DNumber int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT Department.DName, Department.DNumber, Department.MgrSSN, Department.MgrStartDate, (SELECT COUNT(*) FROM Employee WHERE Employee.Dno = Department.DNumber) AS EmployeeCount FROM Department
	WHERE DNumber = @DNumber
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE UpdateDepartmentManager
	-- Add the parameters for the stored procedure here
	@DNumber int,
	@MgrSSN numeric(9,0) 
AS
BEGIN
	SET NOCOUNT ON;

    IF EXISTS(SELECT * FROM Department where [MgrSSN]=@MgrSSN)
		THROW 50001,'Error! An existing Department is already managed by this MgrSNN',1
	ELSE
		UPDATE DEPARTMENT
		SET MgrSSN = @MgrSSN,
			MgrStartDate = CURRENT_TIMESTAMP
		WHERE DNumber = @DNumber

		UPDATE Employee
		SET SuperSSN = @MgrSSN
		WHERE Dno = @DNumber
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE UpdateDepartmentName
	@DNumber int,
	@DName varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    IF EXISTS(SELECT * FROM Department where [DName]=@DName)
		THROW 50001,'Error! A Deparment already exists with this DName',1
	ELSE
	UPDATE Department
	SET DName = @DName
	WHERE DNumber = @DNumber
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE [Company]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetEmpCount] (
	@DNumber int
)
RETURNS int AS
BEGIN
	DECLARE @return_value int
	Select @return_value = (SELECT COUNT(*) FROM Employee
	WHERE Employee.Dno = @DNumber)
 
    RETURN @return_value
END
GO

ALTER TABLE Department ADD EmpCount AS (dbo.GetEmpCount(DNumber))
GO

/** ################### Task 3 Alteration ###################### ***/
/** ############### ALTER GetAllDepartments ############# **/
ALTER PROCEDURE GetAllDepartments
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Department.DName, Department.DNumber, Department.MgrSSN, Department.MgrStartDate, EmpCount FROM Department

END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/** ################### Task 3 Alteration ###################### ***/
/** ############### ALTER GetDepartments ############# **/
ALTER PROCEDURE GetDepartment 
	@DNumber int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT Department.DName, Department.DNumber, Department.MgrSSN, Department.MgrStartDate, EmpCount FROM Department
	WHERE DNumber = @DNumber
END
GO
