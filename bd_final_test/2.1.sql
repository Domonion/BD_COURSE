select distinct TeamId
from Sessions natural join Runs
where Runs.SessionId = Sessions.SessionId and Accepted = 0 and ContestId = :ContestId and Letter = :Letter;