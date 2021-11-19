select StudentName, CourseName
from (
    select StudentId, StudentName, GroupId, CourseName
    from Students natural join Plan natural join Courses
    except 
    select StudentId, StudentName, GroupId, CourseName
    from Students natural join Plan natural join Courses natural join Marks
) subquery;