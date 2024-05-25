--1. Вывести количество преподавателей кафедры “Software 
--Development”.

SELECT COUNT(DISTINCT t.Id)
FROM Teachers t
JOIN Lectures l ON t.Id = l.TeacherId
JOIN GroupsLectures gl ON l.Id = gl.LectureId
JOIN Groups g ON gl.GroupId = g.Id
JOIN Departments d ON g.DepartmentId = d.Id
WHERE d.Name = 'Software Development';

--2. Вывести количество лекций, которые читает преподаватель 
--“Dave McQueen”.

SELECT COUNT(*)
FROM Lectures l
JOIN Teachers t ON l.TeacherId = t.Id
WHERE t.Name = 'Dave' AND t.Surname = 'McQueen';

--3. Вывести количество занятий, проводимых в аудитории 
--“D201”.

SELECT COUNT(*)
FROM GroupsLectures gl
JOIN Lectures l ON gl.LectureId = l.Id
WHERE l.LectureRoom = 'D201';

--4. Вывести названия аудиторий и количество лекций, проводимых в них.

SELECT LectureRoom, COUNT(*)
FROM Lectures
GROUP BY LectureRoom;

--5. Вывести количество студентов, посещающих лекции преподавателя “Jack Underhill”.

SELECT COUNT(DISTINCT gl.GroupId)
FROM GroupsLectures gl
JOIN Lectures l ON gl.LectureId = l.Id
JOIN Teachers t ON l.TeacherId = t.Id
WHERE t.Name = 'Jack' AND t.Surname = 'Underhill';

--6. Вывести среднюю ставку преподавателей факультета 
--“Computer Science”.

SELECT AVG(t.Salary)
FROM Teachers t
JOIN Lectures l ON t.Id = l.TeacherId
JOIN GroupsLectures gl ON l.Id = gl.LectureId
JOIN Groups g ON gl.GroupId = g.Id
JOIN Departments d ON g.DepartmentId = d.Id
JOIN Faculties f ON d.FacultyId = f.Id
WHERE f.Name = 'Computer Science';

--7. Вывести минимальное и максимальное количество студентов среди всех групп.

SELECT MIN(StudentsCount) AS [MinStudentsCount], MAX(StudentsCount) AS [MaxStudentsCount]
FROM (SELECT DepartmentId, COUNT(*) AS StudentsCount FROM Groups GROUP BY DepartmentId) AS GroupStudents;

--8. Вывести средний фонд финансирования кафедр.

SELECT AVG(Financing)
FROM Departments;

--9. Вывести полные имена преподавателей и количество читаемых ими дисциплин.

SELECT t.Name + ' ' + t.Surname AS FullName, COUNT(DISTINCT l.SubjectId)
FROM Teachers t
JOIN Lectures l ON t.Id = l.TeacherId
GROUP BY t.Name, t.Surname;

--10. Вывести количество лекций в каждый день недели.

SELECT DayOfWeek, COUNT(*)
FROM GroupsLectures
GROUP BY DayOfWeek;

--11. Вывести номера аудиторий и количество кафедр, чьи лекции в них читаются.

SELECT l.LectureRoom, COUNT(DISTINCT d.Id)
FROM Lectures l
JOIN GroupsLectures gl ON l.Id = gl.LectureId
JOIN Groups g ON gl.GroupId = g.Id
JOIN Departments d ON g.DepartmentId = d.Id
GROUP BY l.LectureRoom;

--12.Вывести названия факультетов и количество дисциплин, 
--которые на них читаются

SELECT f.Name, COUNT(DISTINCT l.SubjectId)
FROM Faculties f
JOIN Departments d ON f.Id = d.FacultyId
JOIN Groups g ON d.Id = g.DepartmentId
JOIN GroupsLectures gl ON g.Id = gl.GroupId
JOIN Lectures l ON gl.LectureId = l.Id
GROUP BY f.Name;

--13. Вывести количество лекций для каждой пары преподаватель-аудитория.

SELECT l.TeacherId, l.LectureRoom, COUNT(*)
FROM Lectures l
GROUP BY l.TeacherId, l.LectureRoom;