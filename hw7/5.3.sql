create view Debts as
select InnerTable.StudentId as StudentId, count(distinct InnerTable.CourseId) as Debts from
    (
        select StudentsWithCourses.StudentId as StudentId, StudentsWithCourses.CourseId as CourseId, StudentsWithMarks.Mark as Mark from (
            (select StudentId, CourseId
            from Students natural join Plan) as StudentsWithCourses
            left join 
            (select StudentId, CourseId, Mark
            from Students natural join Marks) as StudentsWithMarks
            on StudentsWithCourses.StudentId = StudentsWithMarks.StudentId and StudentsWithCourses.CourseId = StudentsWithMarks.CourseId
        )
        where Mark is null
    )  as InnerTable
    group by InnerTable.StudentId;