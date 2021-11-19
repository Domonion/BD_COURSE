select StudentId, StudentName, GroupId
from (
    select CourseId 
    from Plan natural join (
        select LecturerId
        from Lecturers
        where LecturerName=:LecturerName
        ) subQuery1
    ) subQuery2
    natural join Marks natural join Students
where Mark=:Mark;