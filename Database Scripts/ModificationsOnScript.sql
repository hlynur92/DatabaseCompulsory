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

/** ######################################### ***/
/** ############### ALTER Project ############# **/
ALTER TABLE [dbo].[Project]  ADD  CONSTRAINT [FK_Project_Department] FOREIGN KEY([DNum])
REFERENCES [dbo].[Department] ([DNumber]) ON DELETE CASCADE /*Added ON DELETE CASCADE**/
GO

/** ######################################### ***/
/** ############### ALTER Works on ############# **/
ALTER TABLE [dbo].[Works_on]  ADD  CONSTRAINT [FK_Works_on_Project] FOREIGN KEY([Pno])
REFERENCES [dbo].[Project] ([PNumber]) ON DELETE CASCADE /*Added ON DELETE CASCADE**/
GO