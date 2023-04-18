create table Groups
	(
		[Id] int primary key not null identity(1,1),
		[Name] nvarchar(10) not null unique,
		[Rating] int not null check([Rating] between -1 and 6)
		[Year] int not null check([Year] between 0 and 6)
	)
;