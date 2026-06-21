-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- test und reference Abfrage

SELECT * FROM Movies;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 1 - Zeigen Sie Titel und Releasedatum aller Filme des Genre „Action“ an. Sortieren Sie nach dem Titel. Hinweis: Nutzen Sie die Tabelle GENRES ( \d GENRES ).

SELECT title, releaseDate FROM Movies m NATURAL JOIN Genres g WHERE g.name = 'Action' ORDER BY title ASC;
-- NATURAL JOIN wenn fremd und primärschlüssel gleich sind

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 2 - Erstellen Sie eine Abfrage, welche Titel, Releasedatum und Genre aller Filme anzeigt. Aktuelle Filme sollen zuerst angezeigt werden.

SELECT title, releaseDate, g.name FROM Movies m JOIN Genres g ON m.genre_id = g.genre_id ORDER BY releaseDate DESC;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 3 - Zeigen Sie Filme an, deren Budget mit einem anderen Film übereinstimmt, der mehr als 600 Millionen Dollar eingespielt hat. Schließen Sie beim Vergleich die Ausgabe deselben Films aus. Sortieren Sie nach Titel.

SELECT DISTINCT m1.title FROM Movies m1, Movies m2 WHERE m1.profit = m2.profit AND m1.profit > 600000000;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 4 - skip

-- ///

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 5 - Erstellen Sie eine Abfrage, welche alle Genres mit der Anzahl der Filme ausgibt.

SELECT g.name AS Genre, COUNT(m.title) AS Anzahl FROM Genres g LEFT JOIN Movies m ON g.genre_id = m.genre_id GROUP BY g.genre_id, g.name;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 6 - skip

-- ///

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 7 - Zeigen Sie ein Mitwirkendenverzeichnis (Vor- und Nachname) aller Filme (Filmtitel) an, einmal mit und einmal ohne das Schlüsselwort "WHERE" zu verwenden. Sortieren Sie die Nachnamen absteigend.

-- mit WHERE
SELECT m.title, p.firstname, p.lastname FROM Persons p, Personsmovies pm, Movies m WHERE m.movie_id = pm.movie_id AND p.person_id = pm.person_id ORDER BY p.lastname DESC;
-- ohne WHERE
SELECT m.title, p.firstname, p.lastname FROM Movies m JOIN Personsmovies pm ON m.movie_id = pm.movie_id JOIN persons p ON pm.person_id = p.person_id ORDER BY p.lastname DESC;
-- beides können für die Klausur (könnte Aufgabe mit kommen)

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 8 - Schreiben Sie eine Abfrage, um den kürzesten Film und den längsten Film anzuzeigen.
-- Benennen Sie die ausgegebenen Tupel entsprechend. Hinweis: Hier können Sie eine Vereinigung verwenden. Außerdem können in der WHERE-Klausel ein Subselect verwenden.
-- Benutzen Sie BEZEICHNUNG, RUNTIME und TITLE als Spaltennamen.

SELECT 'kürzester film' AS Flim, runtime, title FROM Movies WHERE runtime = (SELECT MIN(runtime) FROM Movies) UNION SELECT 'längster film', runtime, title FROM Movies WHERE runtime = (SELECT MAX(runtime) FROM Movies)

-- Fertig lol