SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hlynur & S�ren
-- Create date: 06.03.2023
-- Description:	Deletes Department
-- =============================================
CREATE PROCEDURE DeleteDepartment
	-- Add the parameters for the stored procedure here
	@DNumber int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DELETE Department
	WHERE DNumber = @DNumber
END
GO
