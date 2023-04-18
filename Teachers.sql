create table Teachers
	(
		[Id] int primary key not null identity(1, 1),
		[EmploymentDate] date not null check([EmploymentDate] > '1990-01-01'),
		[Name] nvarchar(100) not null unique,
		[Premium] money default 0 not null check([Premium]>=0),
		[Salary] money not null check([Salary]>=0),
		[Surname] nvarchar(max) not null,
	)
;