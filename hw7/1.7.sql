delete from Students 
    where StudentId in (
        select StudentsWithCourses.StudentId from
            (select StudentId, CourseId
            from Students natural join Plan) as StudentsWithCourses
            left join 
            (select StudentId, CourseId, Mark
            from Students natural join Marks) as StudentsWithMarks
            on StudentsWithCourses.StudentId = StudentsWithMarks.StudentId and StudentsWithCourses.CourseId = StudentsWithMarks.CourseId
        where StudentsWithMarks.Mark is null
        group by StudentsWithCourses.StudentId having count(distinct StudentsWithCourses.CourseId) >= 2
);