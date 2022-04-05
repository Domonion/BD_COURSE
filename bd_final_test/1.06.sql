select TeamName 
from 
(
    select distinct TeamId from (
    select TeamId, ContestId from Sessions except
    select TeamId, ContestId from Runs natural join Sessions) s2
) s1
natural join Teams;