--1
select *
from Teachers, Groups


--2
select f.Name
from Faculties f, Departments d
where f.Id = d.FacultyId and sum(d.Financing) > f.Financing


--3
select 'У группы ' + g.Name + ' Куратор ' + c.Surname
from Curators c, Groups g, GroupsCurators gc
where c.Id = gc.CuratorId and gc.GroupId = g.Id


--4
select t.Name + '' + t.Surname as 'Преподаватели группы Р107'
from Teachers t, Groups g, GroupsLectures gl, Lectures l
where t.Id = l.TeacherId 
and l.Id = gl.LectureId 
and gl.GroupId = g.Id
and g.Name like 'P107'


--5
select t.Surname as [Teacher's Surname], f.Name as 'Faculty'
from Teachers t, Faculties f, Lectures l, GroupsLectures gl, Groups g, Departments d
where t.Id = l.TeacherId
and l.Id = gl.LectureId
and gl.GroupId = g.Id
and g.DepartmentId = d.Id
and d.FacultyId = f.Id


--6
select d.Name as [Название кафедры], g.Name as 'Название группы'
from Departments d, Groups g
where g.DepartmentId = d.Id


--7
select s.Name
from Subjects s, Teachers t, Lectures l
where t.Id = l.TeacherId
and l.SubjectId = s.Id
and t.Name like 'Samantha Adams'


--8
select d.Name
from Departments d, Groups g, GroupsLectures gl, Lectures l, Subjects s
where d.Id = G.DepartmentId
and g.Id = gl.GroupId
and gl.LectureId = l.Id
and l.SubjectId = s.Id
and s.Name like 'Database Theory'


--9
select g.Name
from Groups g, Departments d, Faculties f
where g.DepartmentId = d.Id
and d.FacultyId = f.Id
and f.Name like 'Computer Science'


--10
select g.Name as 'Group Name', f.Name as 'Faculty Name'
from Groups g, Faculties f, Departments d
where g.DepartmentId = d.Id
and d.FacultyId = f.Id
and g.Year = 5


--11
select t.Name + '' + t.Surname as 'Преподаватель', s.Name as 'Дисциплина', g.Name as 'Группа'
from Teachers t, Subjects s, Groups g, Lectures l, GroupsLectures gl
where g.Id = gl.GroupId
and gl.LectureId = l.Id
and t.Id = l.TeacherId
and l.SubjectId = s.Id
and l.LectureRoom like 'B103'