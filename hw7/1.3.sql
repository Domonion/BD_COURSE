delete from Students 
where StudentId in (
    select StudentId from Students 
    except 
    select StudentId from Students natural join Marks
    );