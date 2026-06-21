-- Aufegabe 1
select * from Movies;

-- Aufgabe 2
select title, ReleaseDate, Genre_ID from Movies order by title;

-- Aufegabe 3
select distinct Distribution from Movies;

-- Aufgabe 4a
select Movie_ID, title, Profit from Movies where Profit > 600000000;

-- AUfgabe 4b
select title, OpeningWeek from Movies where Profit between 600000000 and 700000000;

-- Aufgabe 5a
select title, Budget, Profit from Movies where SequelOf is not null;

-- Aufgabe 5b
select title, (Profit - Budget) as Umsatz from Movies where SequelOf is not null;