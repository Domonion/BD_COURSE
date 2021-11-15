merge into Marks M
using NewMarks NM
on M.StudentId = NM.StudentId and M.CourseId = NM.CourseId
when matched then update set Mark = case 
    when NM.Mark > M.Mark
        then NM.Mark
    else M.Mark
    end
when not matched then insert values (NM.StudentId, NM.CourseId, NM.Mark);