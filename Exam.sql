--Семушкин Виталий
--1
select b.Name
from books b
where b.Pages > 500 and b.Pages < 650;


--2
select b.Name
from books b
where b.Name like 'А%' or b.Name like 'З%';


--3
select b.Name
from books b
join themes t on b.ThemeId = t.id
join sales s on s.Bookid = b.id
where t.Name like 'Детектив' and s.Quantity > 30;


--4
select b.Name
from books b
where b.Name like '%Microsoft%' and b.Name not like '%Windows%';


--5
select b.Name + ' ' + t.Name + ' ' + a.Name + ' ' + a.Surname
from books b
join themes t on t.Id = b.ThemeId
join authors a on a.id = b.AuthorId
where b.Price*100/b.Pages < 65;


--6
select b.Name
from books b
where b.Name like '%%%%';


--7
select b.Name, t.Name, a.Name + ' ' + a.Surname, b.Price, s.Quantity, sh.Name
from books b
join authors a on a.id = b.AuthorId
join themes t on t.id = b.ThemeId
join sales s on s.Bookid = b.id
join shops sh on sh.id = s.Shopid
join countries c on c.id = sh.CountryId
where b.Name not like '%[А]%'
and t.Name not like 'Программирование' 
and a.Name not like 'ГЕРБЕРТ ШИЛДТ' 
and (b.Price > 10 and b.Price < 20) 
and s.Quantity >= 8 
and (c.Name not like 'Украина' and c.Name not like 'Россия')


--8
select 'Количество авторова: ', count(authors.Name)
from authors
union
select 'Количество книг:', count(books.Name)
from books
union
select 'Средняя цена продажи: ', avg(sales.Price)
from sales
union
select 'Среднее количество страниц: ', avg(books.Pages)
from books


--9
select t.Name, sum(b.Pages) as 'Сумма страниц'
from themes t, books b
where t.id = b.ThemeId
group by t.Name


--10
select a.Name + ' ' + a.Surname as 'Автор', count(*) as 'Количество книг', sum(b.Pages) as 'Сумма страниц'
from authors a
join books b on b.AuthorId = a.id
group by a.Name, a.Surname


--11
select top 1 b.Name
from books b
join themes t on t.id = b.ThemeId
where t.id = (select id from themes where Name like 'Программирование')
order by b.Pages desc


--12
select t.Name, avg(b.Pages)
from themes t
join books b on b.ThemeId = t.id
group by t.Name
having avg(b.Pages) < 400


--13
select t.Name, sum(b.Pages)
from themes t
join books b on b.ThemeId = t.id
where b.Pages > 400 and t.Name in ('Программирование', 'Администрирование', 'Дизайн')
group by t.Name


--14
select b.Name as 'Книга', c.Name as 'Страна', sh.Name as 'Магазин', s.SaleDate as 'Дата продажи', s.Quantity as 'Количество проданных экземпляров'
from books b
join sales s on s.Bookid = b.id
join shops sh on sh.id = s.Shopid
join countries c on c.id = sh.CountryId


--15
select top 1 t1.[Магазин]
from (select sh.Name as 'Магазин', sum(s.Price) as 'Прибыль магазина'
from shops sh
join sales s on s.Shopid = sh.id
group by sh.Name) as t1
order by t1.[Прибыль магазина] desc