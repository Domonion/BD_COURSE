-- unique - Ключ. Проверять на наличие GroupId
-- 7.2.4 Напишите запросы, обновляющие данные студентов, перевод всех студентов из группы :FromGroupName в группу :GroupName;
-- 7.2.5 Перевод всех студентов из группы :FromGroupName в группу :GroupName только если целевая группа существует
-- 7.3.7 Число долгов каждого студента группы :GroupName (столбец Debts)
create unique index GroupIdFromGroups on Groups using Hash (GroupId);

-- упорядоченный. Покрывающий. По GroupId получать GroupName
-- 7.2.4 Напишите запросы, обновляющие данные студентов, перевод всех студентов из группы :FromGroupName в группу :GroupName;
-- 7.2.5 Перевод всех студентов из группы :FromGroupName в группу :GroupName только если целевая группа существует
-- 7.3.7 Число долгов каждого студента группы :GroupName (столбец Debts)
create index GroupsIndex on Groups (GroupId, GroupName);