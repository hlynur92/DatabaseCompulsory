USE [Company]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateDepartment]    Script Date: 06/03/2023 13.03.26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateDepartment]
	-- Add the parameters for the stored procedure here
	@DName varchar(50),
	@MgrSSN numeric,
	@DNumber INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF EXISTS(SELECT * FROM Department where [DName]=@DName)
		THROW 50001,'Error! A Deparment already exists with this DName',1
	ELSE IF EXISTS(SELECT * FROM Department where [MgrSSN]=@MgrSSN)
		THROW 50001,'Error! An existing Department is already managed by this MgrSNN',1
	ELSE
    -- Create Department
	INSERT INTO [dbo].[Department]
			(DName, MgrSSN, MgrStartDate)
     VALUES
           (@DName
           ,@MgrSSN
		   ,GETDATE())

	SELECT @DNumber = SCOPE_IDENTITY()
	RETURN
END
