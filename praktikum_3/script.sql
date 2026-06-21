-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- test und reference Abfrage

SELECT * FROM Movies;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 1 - Erstellen Sie eine Abfrage, um alle Daten der Tabelle Movies anzuzeigen. Trennen Sie die Spalten durch ein Komma voneinander. Nennen Sie die Spalte CSV_OUTPUT. Nutzen Sie dafür die String-Verkettung.

SELECT movie_id || ',' || title || ',' || releasedate || ',' || genre_id || ',' || budget || ',' || openingweek || ',' || profit || ',' || runtime || ',' ||  certificate || ',' ||  sequelof || ',' ||  distribution AS "CSV_OUTPUT" FROM Movies;
-- 'sequelof' hat dafür gesorgt, dass nicht alle Zeilen angezeigt wurden, also habe ich es hier rausgenommen  
SELECT movie_id || ',' || title || ',' || releasedate || ',' || genre_id || ',' || budget || ',' || openingweek || ',' || profit || ',' || runtime || ',' ||  certificate || ',' ||  distribution AS "CSV_OUTPUT" FROM Movies;
-- better version
SELECT CONCAT_WS(',', movie_id ,title ,releasedate ,genre_id ,budget ,openingweek ,profit ,runtime ,certificate ,sequelof ,distribution ) AS "CSV_OUTPUT" FROM Movies;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 2a - Zeigen Sie Titel und Genre_ID aller Filme der Genre_IDs 1 und 3 in alphabetischer Reihenfolge nach Titel an.

SELECT title, genre_id FROM Movies WHERE genre_id IN (1, 3) ORDER BY title ASC;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 2b - Modifizieren Sie Ihre Anweisung derart, dass die Anzahl der Filme jeder Genre_ID ausgegeben wird. Benennen Sie die Spalten in GENRE_ID und ANZAHL um.

SELECT genre_id, COUNT(title) AS Anzahl FROM Movies GROUP BY genre_id;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 3a - Schreiben Sie eine Abfrage, um die Anzahl der Filme anzuzeigen. Benennen Sie die Ausgabespalte in ANZAHL um.

SELECT COUNT(title) AS Anzahl FROM Movies;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 3b - Schreiben Sie eine Abfrage um den Gesamtgewinn pro Filmverleih anzugeben. Geben Sie den Betrag in Milliarden Dollar aus.

SELECT distribution, ROUND(SUM(profit) / 1000000000, 3) || ' Mrd.' AS "Gesamtgewinn in Milliarden" FROM Movies GROUP BY distribution;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 4a - Erstellen Sie eine Abfrage um pro Jahr anzuzeigen wie viele Filme in diesem Jahr erschienen sind. Geben Sie für jedes Jahr auch das Gesamteinspielergebnis und das durchschnittlich Einspielergebnis an.
-- Benennen Sie die Spalten mit JAHR, ANZAHL, GESAMT und DURCHSCHNITT.

SELECT EXTRACT(YEAR FROM releasedate) AS "Jahr", COUNT(title) AS "Anzahl Filme", ROUND(SUM(profit) / 1000000, 2) || ' Mil.' AS "Gesamteinspielergebnis", ROUND(AVG(profit) / 1000000, 2) || ' Mil.' AS "Durchschnittliches Einspielergebnis" FROM Movies GROUP BY EXTRACT(YEAR FROM releasedate) ORDER BY "Jahr";

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 4b - Modifizieren Sie Ihre Abfrage aus 4a in derart, dass nur noch Jahre angezeigt werden in denen mindestens zwei Filme erschienen sind.

SELECT EXTRACT(YEAR FROM releasedate) AS "Jahr", COUNT(title) AS "Anzahl Filme", ROUND(SUM(profit) / 1000000, 2) || ' Mil.' AS "Gesamteinspielergebnis", ROUND(AVG(profit) / 1000000, 2) || ' Mil.' AS "Durchschnittliches Einspielergebnis" FROM Movies GROUP BY EXTRACT(YEAR FROM releasedate) HAVING COUNT(title) > 1 ORDER BY "Jahr";

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 5 - Geben Sie für jeden Anfangsbuchstaben eines Films an, wie viele Filme mit diesem Anfangsbuchstaben gedreht wurden.

SELECT LEFT(title, 1) AS "Anfangsbuchstabe", COUNT(title) AS "Anzahl Filme" FROM Movies GROUP BY LEFT(title, 1) ORDER BY "Anfangsbuchstabe";

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 6 - Erstellen Sie eine Abfrage, welche in einem Tupel die gesamte Anzahl der Filme anzeigt und wie viele dieser Filme jeweils 2014, 2015, 2016 und 2017 veröffentlicht wurden. Weisen Sie entsprechende 
-- Spaltenüberschriften zu. Erklären Sie Ihren Lösungsweg als SQLKommentar in der Log-Datei!

SELECT 
    COUNT(*) AS Anzahl,
    SUM(CASE WHEN TO_CHAR(releasedate, 'YYYY'), = "2015" THEN 1 END) AS "2015",
    SUM(CASE WHEN TO_CHAR(releasedate, 'YYYY'), = "2016" THEN 1 END) AS "2016",
    SUM(CASE WHEN TO_CHAR(releasedate, 'YYYY'), = "2014" THEN 1 END) AS "2014",
    SUM(CASE WHEN TO_CHAR(releasedate, 'YYYY'), = "2017" THEN 1 END) AS "2017" 
FROM Movies;

--  ________________________________________________________________________________________________________________________________________________________________________________________________________________
-- *    Erklärung:                                                                                                                                                                                                  *
-- *    1. als erstes werden alle Filme im COUNT in 'Anzahl Fimle' gespeichert                                                                                                                                       *
-- *    2. für jedes Jahr wird dann eine eigene Abfrage erstellt, welche alle Filme für dieses Jahr sammelt                                                                                                         *
-- *    3. mit EXTRACT kann man das gesuchte Jahr rausfiltern                                                                                                                                                       *
-- *________________________________________________________________________________________________________________________________________________________________________________________________________________*

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Aufgabe 7 - Erstellen Sie aus der Ausführung Ihrer SQL-Datei eine LOG-Datei.

-- Fertig lol