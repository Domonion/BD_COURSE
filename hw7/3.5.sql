update Students
set Debts = 
(
    select count(distinct StudentsWithCourses.CourseId) from
            (select StudentId, CourseId
            from Students natural join Plan) as StudentsWithCourses
            left join 
            (select StudentId, CourseId, Mark
            from Students natural join Marks) as StudentsWithMarks
            on StudentsWithCourses.StudentId = StudentsWithMarks.StudentId and StudentsWithCourses.CourseId = StudentsWithMarks.CourseId
        where StudentsWithMarks.Mark is null and StudentsWithCourses.StudentId = Students.StudentId
)
where StudentId = :StudentId;