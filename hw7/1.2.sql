delete from Students 
where 
StudentId in (select StudentId from Students natural join Groups where GroupName = :GroupName);