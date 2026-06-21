-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- test und reference Abfrage

SELECT * FROM Movies;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 1 - Fügen Sie Filme in die Datenbank ein
-- a) Fügen Sie der Tabelle MOVIES den ersten Film hinzu. Listen Sie dazu die Attributnamen explizit auf.

INSERT INTO Movies
VALUES (
(SELECT MAX(movie_id)+1 FROM Movies),
'Pirates of the Caribbean - Fluch der Karibik 2',
'2006-07-27', -- TO_DATE('27.07.2006', 'DD.MM.YYYY'),
'4',
'225000000',
'135634554',
'423315812',
'151',
'12',
NULL,
'Walt Disney Studios'
);

-- b) Füllen Sie die Tabelle MOVIES mit dem zweiten und dritten Film auf. Listen Sie dabei die Attribute nicht auf.

INSERT INTO Movies 
VALUES (
(SELECT MAX(movie_id)+1 FROM Movies),
'Rogue One: A Star Wars Story',
'2016-12-15', -- TO_DATE('15.12.2016', 'DD.MM.YYYY'),
'1',
'200000000',
'155081681',
'532171696',
'133',
'12',
NULL,
'Walt Disney Studios'
);

INSERT INTO Movies
VALUES (
(SELECT MAX(movie_id)+1 FROM Movies),
'Pirates of the Caribbean - Fremde Gezeiten',
'2017-05-19', -- TO_DATE('19.05.2017', 'DD.MM.YYYY'),
'4',
'250000000',
'90151958',
'241071802',
'136',
'12',
(SELECT movie_id FROM Movies WHERE title = 'Pirates of the Caribbean - Fluch der Karibik 2'),
'Walt Disney Studios'
);

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 2 - Bei der Nutzung der Datenbank hat sich herausgestellt, dass die Summen statt in Dollar besser in Euro angegeben werden sollten. Aktualisieren Sie den Datenbestand, in dem Sie die Dollarangaben in Euro umrechnen. Verwenden Sie den Wechselkurs 1 US-Dollar = 0,85 Euro.

UPDATE Movies
SET
budget = ROUND(budget * 0.85, 2),
openingweek = ROUND(openingweek * 0.85, 2),
profit = ROUND(profit * 0.85, 2);

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 3 - Ändern Sie den Titel von Pirates of the Caribbean – Fluch der Karibik 2 in Fluch der Karibik 2.

UPDATE Movies
SET
title = 'Fluch der Karibik 2'
WHERE title = 'Pirates of the Caribbean - Fluch der Karibik 2';

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 4 - ZU VIEL

-- Erstellen Sie einen Datenbankcontainer und lassen Sie diesen im Hintergrund laufen.
-- Starten Sie eine psql-Shell (A)
-- Starten Sie eine weitere psql-Shell (B)
-- Starten Sie in A eine Transaktion
-- Starten Sie in B eine Transaktion
-- Rufen Sie in B Sie Anzahl der Filme ab
-- Fügen Sie in A einen Film hinzu
-- Rufen Sie in B Sie Anzahl der Filme ab
-- Rufen Sie in A Sie Anzahl der Filme ab
-- Commiten Sie in A
-- Starten Sie eine neue Transkation in A
-- Rufen Sie in B Sie Anzahl der Filme ab
-- Commiten Sie in B
-- Rufen Sie in B Sie Anzahl der Filme ab
-- Ändern Sie in A alle Titel auf "Mist UPDATE ohne Bedingung"
-- Rufen Sie in A alle Filme ab
-- Rufen Sie in B alle Filme ab
-- Führen Sie ein ROLLBACK in A aus
-- Rufen Sie in A alle Filme ab

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 5 - Um die Performance einer Anwendung Testen zu können, werden 1000 Datensätze in der Tabelle Movies benötigt. Erstellen Sie eine SQL-Anweisung die 1000 Datensätze in die Tabelle Movies einfügt.

INSERT INTO Movies (movie_id, title, releasedate, genre_id, budget, openingweek, profit,runtime, certificate, sequelof, distribution)
SELECT
    (SELECT max(movie_id) FROM Movies) + i, 
    'Test 1' || ((SELECT max(movie_id) FROM Movies) + i),
    '2024-01-01',
    (SELECT genre_id FROM genres WHERE name='Action'), 
    1000000,
    500000,
    2000000,
    120,
    12,
    NULL,
    'Test Studio'
FROM generate_series(1, 1000) AS i;