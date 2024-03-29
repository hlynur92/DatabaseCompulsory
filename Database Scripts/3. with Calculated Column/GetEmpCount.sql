USE [Company]
GO
/****** Object:  UserDefinedFunction [dbo].[GetEmpCount]    Script Date: 12/03/2023 13.22.45 ******/
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
