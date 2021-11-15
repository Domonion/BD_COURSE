update Students
set Marks = Marks + coalesce(
                (select count(Mark)
                from NewMarks
                where NewMarks.StudentId = Students.StudentId), 0);