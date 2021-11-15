select StudentId, StudentName, GroupId
from (
    select CourseId 
    from Plan
    where LecturerId=:LecturerId) subQuery 
    natural join Marks natural join Students
where Mark=:Mark;