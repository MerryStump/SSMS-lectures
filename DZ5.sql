--1
select count(t.Name)
from Teachers t, Lectures l, GroupsLectures gl, Groups g, Departments d
where t.Id = l.TeacherId
and l.Id = gl.LectureId
and gl.GroupId = g.Id
and d.Id = g.DepartmentId
and d.Name like 'Software Development'


--2
select count(l.ID)
from Lectures l, Teachers t
where l.TeacherId = t.Id
and t.Name like 'Dave McQueen'


--3
select count(l.Id)
from Lectures l
where l.LectureRoom like 'D201'


--4
select l.LectureRoom, count(l.Id)
from Lectures l
group by l.LectureRoom


--5
select count(g.Id)
from Groups g, GroupsLectures gl, Lectures l, Teachers t
where g.Id = gl.GroupId
and gl.LectureId = l.Id
and l.TeacherId = t.Id
and t.Name like 'Jack Underhill'


--6
select avg(t.Salary)
from Teachers t, Lectures l, GroupsLectures gl, Groups g, Departments d, Faculties f
where t.Id = l.TeacherId
and l.Id = gl.LectureId
and gl.GroupId = g.Id
and g.DepartmentId = d.Id
and d.FacultyId = f.Id
and f.Name like 'Computer Software'


--7
-\\-


--8
select avg(d.Financing)
from Departments d


--9
select t.Name + '' + t.Surname as 'Teacher FullName', count(s.Id)
from Subjects s, Teachers t, Lectures l
where t.Id = l.TeacherId
and l.SubjectId = s.Id


--10
select gl.DayOfWeek, count(l.Id)
from Lectures l, GroupsLectures gl
where l.Id = gl.LectureId
group by gl.DayOfWeek


--11
select l.LectureRoom, count(d.Id) as 'Departments count'
from Lectures l, GroupsLectures gl, Groups g, Departments d
where l.Id = gl.LectureId
and gl.GroupId = g.Id
and g.DepartmentId = d.Id
group by l.LectureRoom


--12
select f.Name, count(s.Id)
from Faculties f, Departments d, Groups g, GroupsLectures gl, Lectures l, Subjects s
where f.Id = d.FacultyId
and d.Id = g.DepartmentId
and g.Id = gl.GroupId
and gl.LectureId = l.Id
and l.SubjectId = s.Id
group by f.Name