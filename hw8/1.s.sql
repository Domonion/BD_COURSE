-- Здесь и далее выбор типа индекса основан на моих же SQL-запросах в PCMS. Предоставленные номер ДЗ означают, что они ускоряют конкретно мой SQL запрос в данном задании. Затрудняюсь ответить, ускорят ли они любой запрос для данного задания.
-- unique - Ускоряет проверку на наличие. Ключ
-- ДЗ-5.1.1 Информацию о студентах (StudentId, StudentName, GroupId) с заданным идентификатором (:StudentId)
-- ДЗ-7.1.3 Напишите запросы, удаляющие студентов без оценок
-- ДЗ-7.1.5 Напишите запросы, удаляющие студентов имеющих 3 и менее оценки
create unique index StudentIdInStudentsKeyIndex on Students using Hash (StudentId);

-- unique - ускоряет сравнение на наличие StudentName и получение записей по Studentname
-- ДЗ-5.1.2 Информацию о студентах (StudentId, StudentName, GroupId) с заданным ФИО (:StudentName)
-- ДЗ-5.2.2 Полную информацию о студентах (StudentId, StudentName, GroupName) с заданным ФИО (:StudentName).
create unique index StudentNameInStudentsIndex on Students using Hash (StudentName);

-- unique - Ускоряет на и наличие. Внешний ключ
-- 7.1.1 - Напишите запросы, удаляющие студентов, учащихся в группе :GroupId
-- 7.2.2 - Напишите запросы, обновляющие данные студентов, перевод студента :StudentId из группы :FromGroupId в группу :GroupId
-- 7.2.3 - Напишите запросы, обновляющие данные студентов, перевод всех студентов из группы :FromGroupId в группу :GroupId
create unique index GroupIdInStudentsIndex on Students using Hash (GroupId);

-- покрывающий индекс. Получение значений записи только из индекса.
-- 5.1.1 Информацию о студентах (StudentId, StudentName, GroupId) c заданным идентификатором (:StudentId)
-- 5.1.2 Информацию о студентах (StudentId, StudentName, GroupId) С заданным ФИО (:StudentName)
create index StudentsIndex on Students (StudentId, StudentName, GroupId);