---

select ContestId, Letter from Problems except
select ContestId, Letter from Sessions, Runs
where
    Sessions.SessionId = Runs.SessionId
    and Accepted = 1;

задачи что не решила ни одна команда
(контест айди летер)

Задачи, решённые всеми сессиями, участвовашими в соревновании (ContestId, Letter).