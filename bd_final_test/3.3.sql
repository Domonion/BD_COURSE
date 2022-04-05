insert into Sessions(TeamId, ContestId, Start)
select TeamId, :ContestId, current_timestamp from (
    select TeamId from Sessions
    where ContestId = :ContestId
) s1;