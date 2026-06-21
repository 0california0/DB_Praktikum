-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- test und reference Abfrage

SELECT * FROM Movies;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 1 - Zeigen Sie ein Mitwirkendenverzeichnis (Vor- und Nachname) aller Filme (Filmtitel) mit Tätigkeit an, einmal mit und einmal ohne das Schlüsselwort "WHERE" zu verwenden. 
-- Sortieren Sie die Nachnamen absteigend. Hinweis: Hierfür werden die Tabellen PERSONS und PERSONSMOVIES benötigt.

-- mit WHERE
SELECT m.title, p.firstname, p.lastname, pm.role FROM Persons p, Personsmovies pm, Movies m WHERE m.movie_id = pm.movie_id AND p.person_id = pm.person_id ORDER BY p.lastname DESC;
-- ohne WHERE
SELECT m.title, p.firstname, p.lastname, pm.role FROM Movies m JOIN Personsmovies pm ON m.movie_id = pm.movie_id JOIN persons p ON pm.person_id = p.person_id ORDER BY p.lastname DESC;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 2 - Welcher Regisseur hat mit welchem Film das höchste Einspielergebnis in der Eröffnungswoche eingespielt?

SELECT m.title, p.firstname, p.lastname FROM Persons p JOIN Personsmovies pm ON p.person_id = pm.person_id JOIN MOVIES m ON pm.movie_id = m.movie_id WHERE pm.role = 'Regisseur' ORDER BY m.openingweek DESC LIMIT 1;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 3 - Erstellen Sie eine Abfrage um Filme mit ihrem Genre anzuzeigen, deren Budget genauso hoch ist wie das (irgend-) eines Actionsfilms. 
-- Sortieren Sie die Filme alphabetisch. Geben Sie dabei Actionfilme nicht mit aus.

-- a) verwenden Sie einen(!) Subquery
SELECT m.title, g.name, m.budget FROM Movies m JOIN Genres g ON m.genre_id = g.genre_id WHERE budget IN (SELECT budget FROM Movies JOIN Genres ON Movies.genre_id = Genres.genre_id WHERE name = 'Action') AND name != 'Action' ORDER BY m.title;

-- weil das eine Menge ist muss man nicht mit distict machen

-- b) verwenden Sie keinen Subquery
SELECT DISTINCT m1.title, g1.name, m1.budget FROM Movies m1 JOIN Genres g1 On m1.genre_id = g1.genre_id JOIN Movies m2 ON m2.budget = m1.budget JOIN Genres g2 on m2.genre_id = g2.genre_id WHERE g1.name != 'Action' and g2.name = 'Action' ORDER BY M1.title;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 4 - Erstellen Sie eine Abfrage, um die Filme mit ihrem Gewinn anzuzeigen, die mehr Gewinn erzielt haben als jeder Actionfilm. Sortieren Sie das Ergebnis absteigend nach dem Einspielergebnis.

-- a) mit Subquery, der den maximalen Gewinn eines Actionfilmes ermittelt
SELECT m.title, g.name, m.profit FROM Movies m JOIN Genres g ON m.genre_id = g.genre_id where m.profit IN (SELECT MAX(profit) FROM Movies m JOIN Genres g ON m.genre_id = g.genre_id where name = 'Action') ORDER BY M.profit;
-- b) ohne Subquery
SELECT m1.title, g1.name, m1.profit FROM Movies m1 JOIN Genres g1 on m1.genre_id = g1.genre_id CROSS JOIN Movies m2 JOIN Genres g2 ON m2.genre_id = g2.genre_id where g2.name = 'Action' GROUP BY m1.title, g1.name, m1.profit HAVING m1.profit > MAX(m2.profit) ORDER BY m1.profit DESC;

-- Klausur: einmal mit subquery

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 5 - Geben Sie alle Personen mit Anzahl der Filme aus, die an mehr als einem Film mitgewirkt haben an.

SELECT p.firstname, p.lastname, COUNT(m.movie_id) FROM Movies m JOIN Personsmovies pm ON m.movie_id = pm.movie_id JOIN Persons p ON pm.person_id = p.person_id GROUP BY p.firstname, p.lastname HAVING COUNT(m.movie_id) > 1;