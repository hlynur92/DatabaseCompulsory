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