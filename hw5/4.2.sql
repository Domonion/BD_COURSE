select StudentId, StudentName, GroupId
from (
    select StudentId, StudentName, GroupId
    from Plan natural join Courses natural join Students
    where CourseName=:CourseName
) subquery except 
    select StudentId, StudentName, GroupId
    from Marks natural join Courses natural join Students
    where CourseName=:CourseName;