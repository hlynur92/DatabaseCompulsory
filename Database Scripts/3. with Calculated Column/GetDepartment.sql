SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE GetDepartment 
	@DNumber int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT Department.DName, Department.DNumber, Department.MgrSSN, Department.MgrStartDate, EmpCount FROM Department
	WHERE DNumber = @DNumber
END
GO