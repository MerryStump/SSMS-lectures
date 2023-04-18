--1
select *
from Departments
order by id desc;

--2
select Groups.Name as group_name, Groups.Rating as group_rating
from groups;

--3
select Surname, (Salary/Premium)*100 as Premium_percent, (Salary/(Premium+Salary))*100 as Salary_percent
from Teachers;

--4
select CONCAT('The dean of faculty "', [Name], '" is ', [Dean]) as faculty_dean
from Faculties;

--5
select Surname
from Teachers
where IsProfessor = 'True' and salary > 1050;

--6
select Name
from Departments
where Financing < 11000 or Financing > 25000;

--7
select *
from Faculties
where Name != 'Computer Science';

--8
select Surname, Position
from Teachers
where IsProfessor = 'False';

--9
select Surname, Position, Salary, Premium
from Teachers
where (IsAssistant = 'True') and (Premium between 160 and 550);

--10
select Surname, Salary
from Teachers
where IsAssistant = 'True';

--11
select Surname, Position
from Teachers
where EmploymentDate < '2000-01-01';

--12
select Name as 'Name of Department'
from Departments
where Name < 'Software Development'
order by Name;

--13
select Surname
from Teachers
where (IsAssistant = 'True') and (Salary+Premium <= 1200);

--14
select Name
from Groups
where (Year = 5) and (Rating between 2 and 4);

--15
select Surname
from Teachers
where (IsAssistant = 'True') and (Salary<550 or Premium<200);