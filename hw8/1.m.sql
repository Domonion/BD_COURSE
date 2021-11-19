-- упорядоченный. Ключ. По StudentId получать CourseId.
create index StudentIdToCourseIdOnMarks on Marks (StudentId, CourseId);

-- упорядоченный. Ключ. По CourseId получать StudentId.
create index CourseIdToStudentIdOnMarks on Marks (CourseId, StudentId);