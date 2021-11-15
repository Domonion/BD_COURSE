delete from Students 
    where StudentId in (
        select Students.StudentId 
        from Students left join Marks on Students.StudentId = Marks.StudentId
        group by Students.StudentId having count(Students.StudentId) <= 3 
    );