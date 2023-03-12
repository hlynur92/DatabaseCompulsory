SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE UpdateDepartmentManager
	-- Add the parameters for the stored procedure here
	@DNumber int,
	@MgrSSN numeric(9,0) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
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
