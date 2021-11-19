-- unique - ключ. Проверка вхождения.
create unique index LecturerIdFromLecturers on Lecturers (LecturerId);

create index LecturersIndex on Lecturers (LecturerId, LecturerName);