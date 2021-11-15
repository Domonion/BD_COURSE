update Students
set GroupId = case when (select GroupId from Groups where GroupName = :GroupName) is null then GroupId else (select GroupId from Groups where GroupName = :GroupName) end
where GroupId = (select GroupId from Groups where GroupName = :FromGroupName);