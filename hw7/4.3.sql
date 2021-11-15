update Marks
set Mark = case 
    when (select Mark from NewMarks where NewMarks.StudentId = Marks.StudentId and NewMarks.CourseId = Marks.CourseId) is null 
        then Mark 
    when (select Mark from NewMarks where NewMarks.StudentId = Marks.StudentId and NewMarks.CourseId = Marks.CourseId) > Mark
        then (select Mark from NewMarks where NewMarks.StudentId = Marks.StudentId and NewMarks.CourseId = Marks.CourseId)
    else Mark
    end;