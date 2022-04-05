select RunId, SessionId, Letter, SubmitTime
from Runs natural join Sessions
where ContestId = :ContestId and Accepted = 0;