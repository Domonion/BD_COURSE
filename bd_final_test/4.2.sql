select TeamId, count (Letter) as Opened from (
    select distinct TeamId, Letter, ContestId 
    from Sessions natural join Runs
) s1
group by TeamId;