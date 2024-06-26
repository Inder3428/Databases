/****** Object:  StoredProcedure [Project3].[ShowTableStatusRowCount]    Script Date: 12/8/2020 9:05:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Project3].[ShowTableStatusRowCount] @TableStatus VARCHAR(64), @UserAuthorizationKey INT 
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    DECLARE @DateAdded DATETIME2;
    SET @DateAdded = SYSDATETIME();

    DECLARE @DateOfLastUpdate DATETIME2;
    SET @DateOfLastUpdate = SYSDATETIME();

    DECLARE @StartingDateTime DATETIME2;
    SET @StartingDateTime = SYSDATETIME();

    DECLARE @EndingDateTime DATETIME2;


    DECLARE @WorkFlowStepTableRowCount INT;
    SET @WorkFlowStepTableRowCount = 0;

    SELECT TableStatus = @TableStatus,
           TableName = 'Course.Class',
           [Row Count] = COUNT(*)
    FROM Course.Class
    UNION ALL
    SELECT TableStatus = @TableStatus,
           TableName = 'Course.Course',
           [Row Count] = COUNT(*)
    FROM Course.Course
    UNION ALL
    SELECT TableStatus = @TableStatus,
           TableName = 'Department.Instructor',
           [Row Count] = COUNT(*)
    FROM Department.Instructor
    UNION ALL
    SELECT TableStatus = @TableStatus,
           TableName = 'Course.ModeofInstruction',
           [Row Count] = COUNT(*)
    FROM Course.ModeOfInstruction
    UNION ALL
    SELECT TableStatus = @TableStatus,
           TableName = 'Department.Department',
           [Row Count] = COUNT(*)
    FROM Department.Department
    UNION ALL
    SELECT TableStatus = @TableStatus,
           TableName = 'Location.BuildingLocation',
           [Row Count] = COUNT(*)
    FROM [Location].BuildingLocation
    UNION ALL
    SELECT TableStatus = @TableStatus,
           TableName = 'Location.RoomLocation',
           [Row Count] = COUNT(*)
    FROM [Location].RoomLocation
    UNION ALL
    SELECT TableStatus = @TableStatus,
           TableName = 'DbSecurity.UserAuthorization',
           [Row Count] = COUNT(*)
    FROM [DbSecurity].UserAuthorization
    UNION ALL
    SELECT TableStatus = @TableStatus,
           TableName = 'Process.WorkflowSteps',
           [Row Count] = COUNT(*)
    FROM [Process].WorkflowSteps;

    SET @EndingDateTime = SYSDATETIME();

    EXEC [Process].[usp_TrackWorkFlow] 'Procedure: [Project3].[ShowStatusRowCount]  loads data into [Project3].[ShowTableStatusRowCount]',
                                       @WorkFlowStepTableRowCount,
                                       @StartingDateTime,
                                       @EndingDateTime,
                                       @UserAuthorizationKey;


END;
