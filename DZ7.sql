--1
select lr.Name
from LectureRooms lr
join Schedules s on lr.Id = s.LectureRoomId
join Lectures l on l.Id = s.LectureId
join Teachers t on t.Id = l.TeacherId
where t.Name + ' ' + t.Surname like 'Иван Иванов'


--2
select Teachers.Surname
from Teachers, Groups g
join Assistants a on Teachers.Id = a.TeacherId
join Lectures l on l.TeacherId = Teachers.Id
join GroupsLectures gl on gl.LectureId = l.Id
join Groups g on g.Id = gl.GroupId
where g.Name like 'Мат-01'

-- не хочет образовывать связь почему-то


--3
select s.Name
from Subjects s
join Lectures l on l.SubjectId = s.Id
join GroupsLectures gl on l.Id = gl.LectureId
join Groups g on g.Id = gl.GroupId
join Teachers t on t.Id = l.TeacherId
where t.Name + ' ' + t.Surname like 'Иван Иванов' and g.Year = 5


--4
select  t.Surname
from Teachers t
join Lectures l on l.TeacherId = t.Id 
join Schedules s on s.LectureId = l.Id
where s.DayOfWeek <> 1

--сначала сделал подзапросом, потом понял, что не нужно


--5
select lr.Name, lr.Building
from LectureRooms lr
join Schedules s on s.LectureRoomId = lr.Id
where s.DayOfWeek <> 3 and s.Week <> 2 and s.Class <> 3


--6
select t.Name + ' ' + t.Surname
from Teachers t, Faculties f
where f.Name like 'Информационных технологий' and t.Name <> 
	(select t.Name 
	from Teachers t
	join Curators c on c.TeacherId = t.Id 
	join GroupsCurators gc on gc.CuratorId = c.Id 
	join Groups g on g.Id = gc.GroupId 
	join Departments on Departments.Id = g.DepartmentId
	where Departments.Name like 'Информационных технологий')


--7
select Building
from Faculties
union
select Building
from Departments
union
select Building
from LectureRooms


--8
select t.Name + ' ' + t.Surname
from Teachers t
join Deans on Deans.TeacherId = t.Id
union
select t.Name + ' ' + t.Surname
from Teachers t
join Heads on Heads.TeacherId = t.Id
union
select t.Name + ' ' + t.Surname
from Teachers t
join Lectures on Lectures.TeacherId = t.Id
union
select t.Name + ' ' + t.Surname
from Teachers t
join Curators on Curators.TeacherId = t.Id
union
select t.Name + ' ' + t.Surname
from Teachers t
join Assistants on Assistants.TeacherId = t.Id


--9
select distinct s.DayOfWeek
from Schedules s
join LectureRooms lr on lr.Id = s.LectureRoomId
where (lr.Name like 'Ауд 501' or lr.Name like 'Ауд 502') and lr.Building = 5