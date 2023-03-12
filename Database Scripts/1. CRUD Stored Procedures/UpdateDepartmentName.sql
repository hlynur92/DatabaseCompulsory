SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hlynur & Søren
-- Create date: 06.03.2023
-- Description:	Creates Department
-- =============================================
CREATE PROCEDURE UpdateDepartmentName
	-- Add the parameters for the stored procedure here
	@DNumber int,
	@DName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF EXISTS(SELECT * FROM Department where [DName]=@DName)
		THROW 50001,'Error! A Deparment already exists with this DName',1
	ELSE
	UPDATE Department
	SET DName = @DName
	WHERE DNumber = @DNumber
END
GO
