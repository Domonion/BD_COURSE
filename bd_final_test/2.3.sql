select distinct TeamId
from Runs, Sessions
where Accepted = 0 and ContestId = :ContestId and Runs.SessionId = Sessions.SessionId;