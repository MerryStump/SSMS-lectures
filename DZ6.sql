--1
select distinct d.Building
from Departments d, (select d.Building, sum(d.Financing) as Fond from Departments d group by d.Building) as t1
where d.Building = t1.Building
and t1.Fond > 100000;


--2
select g.Name
from Groups g, Departments d, (
select g.Name, COUNT(l.Id) as c
from Lectures l, GroupsLectures gl, Groups g 
where g.Id = gl.GroupId and gl.LectureId = l.Id 
group by g.Name) as t1
where g.DepartmentId = d.Id
and g.Name = t1.Name
and t1.c > 10;


--3
select g.Name
from Groups g, (select g.Name, avg(st.Rating) as GroupRating
from Students st, GroupsStudents gs, Groups g
where g.Id = gs.GroupId
and gs.StudentId = st.Id
group by g.Name) as t1
where g.Name = t1.Name
and t1.GroupRating > (select avg(st.Rating)
from Students st, GroupsStudents gs, Groups g
where g.Id = gs.GroupId
and gs.StudentId = st.Id
and g.Name = 'Ф-01');


--4
select t.Name + ' ' + t.Surname as [Teacher Full Name]
from Teachers t
where t.Salary > (select avg(t.Salary) from Teachers t where t.IsProfessor = 'True');


--5
select g.Name
from Groups g, (select g.Name, count(gc.CuratorId) as CuratorCount from Groups g, GroupsCurators gc where gc.GroupId = g.Id group by g.Name) as t1
where g.Name = t1.Name
and t1.CuratorCount > 1;


--6
select g.Name
from Groups g, 
	(select g.Name, avg(st.Rating) as GroupRating
	from Students st, GroupsStudents gs, Groups g
	where g.Id = gs.GroupId
	and gs.StudentId = st.Id
	group by g.Name) as t1
where g.Name = t1.Name
and t1.GroupRating < 
	(select min(t1.St_R)
	from (select g.Name, avg(st.Rating) as St_R
	from Students st, GroupsStudents gs, Groups g
	where g.Id = gs.GroupId
	and gs.StudentId = st.Id
	and g.Year = 5
	group by g.Name) as t1);


--7
select f.Name
from Faculties f, 
	(select f.Name, sum(d.Financing) as Fin
	from Faculties f, Departments d
	where d.FacultyId = f.Id
	group by f.Name) as t1
where f.Name = t1.Name
and t1.Fin > 
	(select sum(d.Financing)
	from Faculties f, Departments d
	where d.FacultyId = f.Id
	and f.Name like 'Факультет математики и информатики');



--8
select t.Name + ' ' + t.Surname as [Full Name], s.Name, count(s.Name) as [Количество]
from Subjects s, Teachers t, Lectures l
where s.Id = l.SubjectId
and l.TeacherId = t.Id
group by t.Name + ' ' + t.Surname, s.Name
having count(l.Id) =
	(select max(t1.LectCt)
	from 
		(select s. Name, count(l.Id) as LectCt
		from Lectures l, Teachers t, Subjects s
		where l.TeacherId = t.Id and s.Id = l.SubjectId
		group by t.Name + ' ' + t.Surname, s.Name
		) as t1
	)

	-- в общем я сдался. Он откидывает все, что меньше максимального. То есть по биологии 2 лекции у препода, но он ее не выведет, 
	-- потому что есть предметы, по которым 3 лекции. я не знаю как это обыграть


--9
select s.Name
from Subjects s, Lectures l
where s.Id = l.SubjectId
group by s.Name
having count(l.Id) = 
	(select min(t1.Ct) as M 
	from 
		(select count (l.Id) as Ct 
		from Lectures l, Subjects s 
		where s.Id = l.SubjectId 
		group by s.Id) 
	as t1)


--10
select count(s.Id) as [Students], count(t1.Id) as Subjects
from Students s, GroupsStudents gs, Groups g, Departments d, 
	(select count(*) as Id
	from Subjects s, Lectures l, GroupsLectures gl, Groups g, Departments d
	where d.Id = g.DepartmentId
	and g.Id = gl.GroupId
	and gl.LectureId = l.Id
	and l.SubjectId = s.Id
	and d.Name like 'Кафедра информационных технологий'
	group by s.Id
	) as t1
where s.Id = gs.StudentId
and gs.GroupId = g.Id
and g.DepartmentId = d.Id
and d.Name like 'Кафедра информационных технологий'


--ssms походу глючный, поскольку count на подзапрос выдает 2, хотя возвращается одна запись
-- более того, я не понимаю почему в итоговой выборке он заменяет 2 на 4