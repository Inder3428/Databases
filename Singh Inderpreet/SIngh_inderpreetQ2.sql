-- Inderpreet Singh
--AdvancedCourses.sql
SELECT DISTINCT
    [CourseName],
    [CourseDescription],
    [InstructorFullName],
    [Hours],
    [Day],
    [NumberEnrolled],
    [Limit]
FROM Course.Class 
WHERE [Hours] > 3;
