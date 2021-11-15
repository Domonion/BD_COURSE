delete from Students 
    where StudentId in (
        select StudentId 
        from Students natural join Marks
        group by StudentId having count(StudentId) >= 3 
    );