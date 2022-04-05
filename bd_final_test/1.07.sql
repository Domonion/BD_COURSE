select SessionId from Sessions except select SessionId from
(
    select SessionId, ContestId, Letter from Sessions natural join Problems except
    select SessionId, ContestId, Letter from Runs natural join Sessions
) s1;