CREATE TABLE Nutzer (
    Nutzer_ID INT PRIMARY KEY,
    Vorname VARCHAR(100) NOT NULL,
    Nachname VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE
);

-- prof subclass von nutzer
CREATE TABLE Professor (
    Nutzer_ID INT PRIMARY KEY,
    CONSTRAINT fk_professor_nutzer 
        FOREIGN KEY (Nutzer_ID) REFERENCES Nutzer(Nutzer_ID) 
        ON DELETE CASCADE
);

CREATE TABLE Medium (
    Medien_ID INT PRIMARY KEY,
    Titel VARCHAR(255) NOT NULL,
    Ausleihdatum DATE,
    Aktueller_Nutzer_ID INT,
    CONSTRAINT fk_medium_nutzer 
        FOREIGN KEY (Aktueller_Nutzer_ID) REFERENCES Nutzer(Nutzer_ID) 
        ON DELETE SET NULL
);

-- multimedia subclass von medium
CREATE TABLE Multimedia (
    Medien_ID INT PRIMARY KEY,
    CONSTRAINT fk_Multimedia 
        FOREIGN KEY (Medien_ID) REFERENCES Medium(Medien_ID) 
        ON DELETE CASCADE
);

-- elearning subclass von medium
CREATE TABLE Elearing (
    Medien_ID INT PRIMARY KEY,
    CONSTRAINT fk_Elearing 
        FOREIGN KEY (Medien_ID) REFERENCES Medium(Medien_ID) 
        ON DELETE CASCADE
);

-- Aufgabe 2)

INSERT INTO Nutzer (Nutzer_ID, Vorname, Nachname, Email) VALUES
(1, 'Alihan', 'Ertem', 'alihan.ertem@gmail.com'), -- 1 ausgeliehen
(2, 'Eren', 'jäger', 'eren.jäger@gmail.com'), -- mehr als 1 ausgeliehen
(3, 'Tangyi', 'Hu', 'tangyi.hu@gmail.com'), -- inaktiv
(4, 'Prof. Dr.', 'Puller', 'Puller@gmail.com'), -- prof mit ausleihe
(5, 'Prof. Dr.', 'KeineAhnungMehr', 'keineahnungmehr@gmail.com'); -- prof ohne ausleihe
-- (1001, 'tzztz', 'tz', 'tangyi.hu@gmail.com'); -- inaktiv

-- prof erstellen (eitragen als prof)
INSERT INTO Professor (Nutzer_ID) VALUES 
(4), 
(5);

INSERT INTO Medium (Medien_ID, Titel, Ausleihdatum, Aktueller_Nutzer_ID) VALUES
-- noch nicht ausgeliehen
(1, 'buch 1', NULL, NULL),
(2, 'buch 1 fortsetzung', NULL, NULL),
(3, 'song of the welkin moon', NULL, NULL),

-- ein nutzer hat ein medium ausgeliehen
(4, 'wie man kein puller mehr ist - handbuch', '2026-06-10', 1),

--  ein nutzer hat mehrere ausgeliehen
(5, 'coordinate 101', '2026-06-15', 2),
(6, 'paradise map (extended)', '2026-06-18', 2),
(7, 'titanenkunde', '2026-06-19', 2),

-- prof hat ausgeliehen
(8, 'Vorlesung grundlagen - basics', '2026-06-01', 4),

-- überfällig
(9, 'ältestes buch in der bib', '2001-01-10', 2),

-- vor kurzem zurückgegeben (daten wieder auf NULL)
(10, 'ai slop', NULL, NULL);


-- multimedia erstellen (als multimedia eintragen)
INSERT INTO Multimedia (Medien_ID) VALUES 
(2), -- nicht ausgeliehen
(6); -- auslegkiehen: 2

-- elearing erstellen (als elearing eintragen)
INSERT INTO Elearing (Medien_ID) VALUES 
(3), -- nicht ausgeliehen
(7); -- ausgeliehen: 2

-- bis 1000 daten generieren

INSERT INTO Nutzer (Nutzer_ID, Vorname, Nachname, Email)
WITH RECURSIVE nutzer_gen AS (
    SELECT 6 AS id
    UNION ALL
    SELECT id + 1 FROM nutzer_gen WHERE id < 1000
)
SELECT 
    id, 
    CONCAT('Vorname_', id), 
    CONCAT('Nachname_', id), 
    CONCAT('nutzer', id, '@gmail.com')
FROM nutzer_gen;

INSERT INTO Medium (Medien_ID, Titel, Ausleihdatum, Aktueller_Nutzer_ID)
WITH RECURSIVE media_gen AS (
    SELECT 11 AS id
    UNION ALL
    SELECT id + 1 FROM media_gen WHERE id < 1000
)
SELECT 
    id, 
    CONCAT('bestes buch', id), 
    NULL, 
    NULL
FROM media_gen;

-- paar zu elearing machen
INSERT INTO Elearing (Medien_ID)
SELECT Medien_ID FROM Medium 
WHERE Medien_ID BETWEEN 67 AND 420;

-- paar zu multimedia machen
INSERT INTO Multimedia (Medien_ID)
SELECT Medien_ID FROM Medium 
WHERE Medien_ID BETWEEN 654 AND 676;

-- alles ausgeben
SELECT * FROM Nutzer;

-- zählen
SELECT 'Nutzer' AS Tabelle, COUNT(*) AS gesamt FROM Nutzer
UNION ALL
SELECT 'Professor', COUNT(*) FROM Professor
UNION ALL
SELECT 'Medium', COUNT(*) FROM Medium
UNION ALL
SELECT 'Multimedia', COUNT(*) FROM Multimedia
UNION ALL
SELECT 'Elearing', COUNT(*) FROM Elearing;

-- aussleihe von prof überprüfen
SELECT p.Nutzer_ID, n.Vorname, n.Nachname, m.Titel AS ausgeliehen FROM Professor p JOIN Nutzer n ON p.Nutzer_ID = n.Nutzer_ID LEFT JOIN Medium m ON n.Nutzer_ID = m.Aktueller_Nutzer_ID;