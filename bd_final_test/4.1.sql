select SessionId, count(SessionId) as Opened from (
  select distinct SessionId, Letter from Runs
) s1
group by SessionId;
