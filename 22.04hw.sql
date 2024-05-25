--1. ������� ���������� �������������� ������� �Software 
--Development�.

SELECT COUNT(DISTINCT t.Id)
FROM Teachers t
JOIN Lectures l ON t.Id = l.TeacherId
JOIN GroupsLectures gl ON l.Id = gl.LectureId
JOIN Groups g ON gl.GroupId = g.Id
JOIN Departments d ON g.DepartmentId = d.Id
WHERE d.Name = 'Software Development';

--2. ������� ���������� ������, ������� ������ ������������� 
--�Dave McQueen�.

SELECT COUNT(*)
FROM Lectures l
JOIN Teachers t ON l.TeacherId = t.Id
WHERE t.Name = 'Dave' AND t.Surname = 'McQueen';

--3. ������� ���������� �������, ���������� � ��������� 
--�D201�.

SELECT COUNT(*)
FROM GroupsLectures gl
JOIN Lectures l ON gl.LectureId = l.Id
WHERE l.LectureRoom = 'D201';

--4. ������� �������� ��������� � ���������� ������, ���������� � ���.

SELECT LectureRoom, COUNT(*)
FROM Lectures
GROUP BY LectureRoom;

--5. ������� ���������� ���������, ���������� ������ ������������� �Jack Underhill�.

SELECT COUNT(DISTINCT gl.GroupId)
FROM GroupsLectures gl
JOIN Lectures l ON gl.LectureId = l.Id
JOIN Teachers t ON l.TeacherId = t.Id
WHERE t.Name = 'Jack' AND t.Surname = 'Underhill';

--6. ������� ������� ������ �������������� ���������� 
--�Computer Science�.

SELECT AVG(t.Salary)
FROM Teachers t
JOIN Lectures l ON t.Id = l.TeacherId
JOIN GroupsLectures gl ON l.Id = gl.LectureId
JOIN Groups g ON gl.GroupId = g.Id
JOIN Departments d ON g.DepartmentId = d.Id
JOIN Faculties f ON d.FacultyId = f.Id
WHERE f.Name = 'Computer Science';

--7. ������� ����������� � ������������ ���������� ��������� ����� ���� �����.

SELECT MIN(StudentsCount) AS [MinStudentsCount], MAX(StudentsCount) AS [MaxStudentsCount]
FROM (SELECT DepartmentId, COUNT(*) AS StudentsCount FROM Groups GROUP BY DepartmentId) AS GroupStudents;

--8. ������� ������� ���� �������������� ������.

SELECT AVG(Financing)
FROM Departments;

--9. ������� ������ ����� �������������� � ���������� �������� ��� ���������.

SELECT t.Name + ' ' + t.Surname AS FullName, COUNT(DISTINCT l.SubjectId)
FROM Teachers t
JOIN Lectures l ON t.Id = l.TeacherId
GROUP BY t.Name, t.Surname;

--10. ������� ���������� ������ � ������ ���� ������.

SELECT DayOfWeek, COUNT(*)
FROM GroupsLectures
GROUP BY DayOfWeek;

--11. ������� ������ ��������� � ���������� ������, ��� ������ � ��� ��������.

SELECT l.LectureRoom, COUNT(DISTINCT d.Id)
FROM Lectures l
JOIN GroupsLectures gl ON l.Id = gl.LectureId
JOIN Groups g ON gl.GroupId = g.Id
JOIN Departments d ON g.DepartmentId = d.Id
GROUP BY l.LectureRoom;

--12.������� �������� ����������� � ���������� ���������, 
--������� �� ��� ��������

SELECT f.Name, COUNT(DISTINCT l.SubjectId)
FROM Faculties f
JOIN Departments d ON f.Id = d.FacultyId
JOIN Groups g ON d.Id = g.DepartmentId
JOIN GroupsLectures gl ON g.Id = gl.GroupId
JOIN Lectures l ON gl.LectureId = l.Id
GROUP BY f.Name;

--13. ������� ���������� ������ ��� ������ ���� �������������-���������.

SELECT l.TeacherId, l.LectureRoom, COUNT(*)
FROM Lectures l
GROUP BY l.TeacherId, l.LectureRoom;