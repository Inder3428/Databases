--Inderpreet Singh

-- CoursesWithLowEnrollment.sql
SELECT DISTINCT
    [CourseName],
    [InstructorFullName],
    [Hours],
    [Day],
    [NumberEnrolled],
    [Limit]
FROM Course.Class 
WHERE [NumberEnrolled] < 5;
