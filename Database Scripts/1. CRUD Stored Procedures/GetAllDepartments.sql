
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetAllDepartments 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Department.DName, Department.DNumber, Department.MgrSSN, Department.MgrStartDate, (SELECT COUNT(*) FROM Employee WHERE Employee.Dno = Department.DNumber) AS EmployeeCount FROM Department

END
GO