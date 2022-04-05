select TeamName 
from (select distinct TeamId 
from Sessions
where ContestId = :ContestId) s1 natural join Teams;