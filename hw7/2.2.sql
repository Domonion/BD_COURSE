update Students
set GroupId = :GroupId
where GroupId = :FromGroupId and StudentId = :StudentId;