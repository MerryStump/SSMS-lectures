create table Faculties
	(
		[Id] int primary key not null identity(1,1),
		[Name] nvarchar(100) not null unique,
	)
;