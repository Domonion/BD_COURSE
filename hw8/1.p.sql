-- unique - Покрывающий. Ключ. Провверка вхождения с помощью только индекса.
create unique index PlanIndex on Plan using Hash (GroupId, CourseId, LecturerId);

-- упорядоченный. По GroupId получать CourseId.
create index GroupIdToCourseIdOnPlan on Plan using Hash (GroupId, CourseId);

-- упорядоченный. По CourseId получать GroupId.
create index CourseIdToGroupIdOnPlan on Plan using Hash (CourseId, GroupId);

-- упорядоченный. По GroupId получать LecturerId.
create index GroupIdToLecturerIdOnPlan on Plan using Hash (GroupId, LecturerId);

-- упорядоченный. По LecturerId получать GroupId.
create index LecturerIdToGroupIdOnPlan on Plan using Hash (LecturerId, GroupId);

-- упорядоченный. По LecturerId получать CourseId.
create index LecturerIdToCourseIdOnPlan on Plan using Hash (LecturerId, CourseId);

-- упорядоченный. По CourseId получать LecturerId.
create index CourseIdToLecturerIdOnPlan on Plan using Hash (CourseId, LecturerId);