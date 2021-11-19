-- unque - Ключ. Проверка наличия CourseId.
create unique index CourseIdFromCourse on Courses (CourseId);

create index CoursesIndex on Courses(CourseId, CourseName);