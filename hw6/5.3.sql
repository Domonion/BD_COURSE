select distinct StudentName, CourseName
from (
    select distinct studentName, CourseName, Mark
    from (
    select distinct *
    from Students natural join Plan natural join Courses
    ) subquery1 left join (
    select distinct StudentId, CourseId, Mark
    from Marks) subquery2
    on subquery1.StudentId = subquery2.StudentId and subquery1.CourseId = subquery2.CourseId
    where Mark is null or (Mark != 4 and Mark != 5)
) onemorequery;