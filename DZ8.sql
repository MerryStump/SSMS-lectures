--1. ������� �������� � �������� ����������� �� ������� ��� ���������
select t.Name, f.Name 
from Teachers t
join Lectures l on l.TeacherId = l.Id
join GroupsLectures gl on l.Id = gl.LectureId
join Groups g on g.Id = gl.GroupId
join Departments d on d.FacultyId = d.Id
join Faculties f on f.Id = FacultyId


--2. �������� ��� ������, � ������� ������ ����� �������� ���� ���, ���� �G�.
select Name 
from Groups
where Name like 'A%' or Name like 'G%'


--3. �������� ��� �������, �������� ������� ������� �� 2 ����.
select Name
from Departments
where Name like '_% _%' and Name not like '_% _% _%'


--4. ������� ���������� ������ � ������ ���� ������.
select gl.DayOfWeek, count(*) as [���������� ������]
from GroupsLectures gl
join Lectures l on l.Id = gl.LectureId
group by gl.DayOfWeek 


--5. ������� ������� � ����. ���������������
select d.Name, d.Financing
from Departments d,
(select max(Financing) as maxF from Departments) t1
where d.Financing = t1.maxF

select max(Financing) as [������� � ���� ������] from Departments


--6. ������� �������� ������� ��� ��� ������� �� �������� ��� �������������� ���� ��� ������ 17000
select Name, Financing
from Departments
where Financing > 17000
union all
select Name + ' ' + Surname, Salary
from Teachers
where Salary > 17000


--7. �������: ����������� ��������������,  ����������� �����, ����������� ������
select'����������� ��������������', count(*)from Teachers
union all
select ' ����������� �����', count (*) from Groups
union all
select ' ����������� ������', count (*) from Lectures



--8. ������� ���-�� �������������� � ������� �������� ������ ��� �������������� �� ����� ���� �������
select count(*)
from Teachers t
where Salary > any
(select Financing from Departments)


----9. ----����������� ��������, � ������� �������� � ����������
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


--10. ������� ������������ ������(�) � ������������ ����������� ������

--������ �������
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

--������ �������
select max(t1.CNT) from 
(
select g.Name, count(l.Id) as CNT
from Groups g
join GroupsLectures gl on gl.GroupId = g.Id
join Lectures l on l.Id = gl.LectureId
group by g.Name
) t1



Select t1.Name
from�
(select g.Name,count(*) as cnt
from Groups g
join GroupsLectures gl on gl.GroupId = g.Id
join Lectures l on l.Id = gl.LectureId
group by g.Name) t1,
(select max(t1.CNT) as maxCNT from�
(
select g.Name, count(l.Id) as CNT
from Groups g
join GroupsLectures gl on gl.GroupId = g.Id
join Lectures l on l.Id = gl.LectureId
group by g.Name
) t1) t2
where t1.cnt = t2.maxCNT;
�


select top 1 g.Name
from Groups g
join GroupsLectures gl on gl.GroupId = g.Id
join Lectures l on l.Id = gl.LectureId
group by g.Name
order by count(*) desc



