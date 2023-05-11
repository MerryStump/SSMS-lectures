--1. Вывести преподов и название факультетов на которых они преподают
select t.Name, f.Name 
from Teachers t
join Lectures l on l.TeacherId = l.Id
join GroupsLectures gl on l.Id = gl.LectureId
join Groups g on g.Id = gl.GroupId
join Departments d on d.FacultyId = d.Id
join Faculties f on f.Id = FacultyId


--2. Показать все группы, в которых первая буква названия либо «А», либо «G».
select Name 
from Groups
where Name like 'A%' or Name like 'G%'


--3. Показать все кафедры, название которых состоит из 2 слов.
select Name
from Departments
where Name like '_% _%' and Name not like '_% _% _%'


--4. Вывести количество лекций в каждый день недели.
select gl.DayOfWeek, count(*) as [Количество лекций]
from GroupsLectures gl
join Lectures l on l.Id = gl.LectureId
group by gl.DayOfWeek 


--5. Вывести кафедру с макс. Финансированием
select d.Name, d.Financing
from Departments d,
(select max(Financing) as maxF from Departments) t1
where d.Financing = t1.maxF

select max(Financing) as [Кафедра с макс финанс] from Departments


--6. Вывести название кафедры или имя препода их зарплату или финансирование если они больше 17000
select Name, Financing
from Departments
where Financing > 17000
union all
select Name + ' ' + Surname, Salary
from Teachers
where Salary > 17000


--7. Вывести: Колличество преподователей,  Колличество групп, Колличество лекций
select'Колличество преподователей', count(*)from Teachers
union all
select ' Колличество групп', count (*) from Groups
union all
select ' Колличество лекций', count (*) from Lectures



--8. Вывести кол-во преподавателей у которых зарплата больше чем финансирование на какой либо кафедре
select count(*)
from Teachers t
where Salary > any
(select Financing from Departments)


----9. ----Колличество преподов, у которых зарплаты в диапозонах
select '10000-14999', count(*) from Teachers
where Salary between 10000 and 14999
union all
select ' 15000-19999', count(*) from Teachers
where Salary between 15000 and 19999
union all
select '20000-24999',count(*) from Teachers
where Salary between 20000 and 24999
union all
select '25000-49999', count (*) from Teachers
where Salary between 25000 and 49999


--10. Вывести наименование группу(ы) с максимальным количеством лекций

--первый вариант
select g.Name 
from Groups g
join GroupsLectures gl on gl.GroupId = g.Id
join Lectures l on l.Id = gl.LectureId
group by g.Name
having count(l.Id) = 
(select max(t1.CNT) from 
(
select g.Name, count(l.Id) as CNT
from Groups g
join GroupsLectures gl on gl.GroupId = g.Id
join Lectures l on l.Id = gl.LectureId
group by g.Name
) t1);

--второй вариант
select max(t1.CNT) from 
(
select g.Name, count(l.Id) as CNT
from Groups g
join GroupsLectures gl on gl.GroupId = g.Id
join Lectures l on l.Id = gl.LectureId
group by g.Name
) t1



Select t1.Name
from 
(select g.Name,count(*) as cnt
from Groups g
join GroupsLectures gl on gl.GroupId = g.Id
join Lectures l on l.Id = gl.LectureId
group by g.Name) t1,
(select max(t1.CNT) as maxCNT from 
(
select g.Name, count(l.Id) as CNT
from Groups g
join GroupsLectures gl on gl.GroupId = g.Id
join Lectures l on l.Id = gl.LectureId
group by g.Name
) t1) t2
where t1.cnt = t2.maxCNT;
 


select top 1 g.Name
from Groups g
join GroupsLectures gl on gl.GroupId = g.Id
join Lectures l on l.Id = gl.LectureId
group by g.Name
order by count(*) desc



