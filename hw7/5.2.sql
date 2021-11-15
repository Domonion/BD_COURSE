create view AllMarks as
select Students.StudentId as StudentId, count(Mark) as Marks 
from Students left join 
    (select * from Marks 
    union all
    select * from NewMarks) as NewT
on Students.StudentId = NewT.StudentId
group by Students.StudentId;