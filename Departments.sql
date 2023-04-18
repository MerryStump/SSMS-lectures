create table Departments
	(
		[Id] int primary key not null identity(1,1),
		[Financing] money default 0 not null check([Financing]>=0),
		[Name] nvarchar(100) not null unique,
	)
;