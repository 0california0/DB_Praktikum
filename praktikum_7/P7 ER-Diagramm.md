**Aufgabe 1)**

graph EER{

node [fontname="Helvetica", fontsize=10];

node [shape=box, style=solid];
Nutzer [label="Nutzer"];
Professor [label="Professor"];
Medium [label="Medium"];
MultiMedium [label="Multimediales_Medium"];
ELearning [label="ELearning_Medium"];

node [shape=diamond];
leiht_aus [label="leiht_aus"];
node [shape=invtriangle, label="ist ein", width=0.5, height=0.5];
isa_nutzer;
isa_medium;

node [shape=ellipse];
NutzerID [label=<<u>Nutzer_ID</u>>];
Name [label="Name"];
Vorname [label="Vorname"];
Nachname [label="Nachname"];
Email [label="E-Mail"]; 

node [shape=ellipse];
MedienID [label=<<u>Medien_ID</u>>];
Titel [label="Titel"];

Ausleihdatum [label="Ausleihdatum"];
Rueckgabedatum [label="Rückgabedatum", style=dashed];
Nutzer -- NutzerID;
Nutzer -- Name;
Name -- Vorname;
Name -- Nachname;
Nutzer -- Email;

Medium -- MedienID;
Medium -- Titel;

Professor -- isa_nutzer;
isa_nutzer -- Nutzer [dir=forward, arrowhead=empty];

MultiMedium -- isa_medium;
ELearning -- isa_medium;
isa_medium -- Medium [dir=forward, arrowhead=empty];

Nutzer -- leiht_aus [label="(0, *)"];
leiht_aus -- Medium [label="(0, 1)"];

leiht_aus -- Ausleihdatum;
leiht_aus -- Rueckgabedatum;

}



**Aufgabe 1)**

E-mail - Mehrwetiges Attribut (ein Nutzer kann mehrere Email Adressen haben z.B. Arbeits- und Privatemail)

Ausleihdatum - variiert je nach Person

Sprache festlegen 





**Aufgabe 2)**

a) Geben Sie für das in Aufgabe 2 erstellte EER-Diagramm die Kardinalitäten der Beziehungen in n:m-Notation an.

1 zu N, ein Nutzer kann n Medien ausleihen



b) Geben Sie für das in Aufgabe 2 erstellte EER-Diagramm die Kardinalitäten der Beziehungen in Min-Max-Notation an.

Nutzer(0,\*) Medium(0,1), MIN=0 MAX=N (ein Nutzer muss kein Medium ausleihen, kann aber N Medien ausleihen)



c) Bezeichnen Sie die Arten der Teilnahmebeziehungen.

Nutzer - Partiell, nicht jeder Nutzer muss etwas ausgeliehen haben

Medium - Partiell, nicht jedes Medium muss ausgeliehen sein



d) Beschreiben Sie Angaben aus der Anwendungsbeschreibung, die nicht im EER-Modell modelliert werden können. Vermerken Sie diese als Kommentar im EER-Diagramm.

Multimediale Medien (nur halb so lange Ausleihzeit) - Zeitliche Dimensionen können nicht abgebildet werden

E-Learning-Medien (nur ein Semester Ausleihzeit) - Zeitliche Dimensionen können nicht abgebildet werden

Professoren (dürfen immer ein Jahr Ausleihzeit) - Rollenlogik kann nicht abgebildet werden, bzw. überschreibt andere Regelungen





**Aufgabe 3)**

Primärschlüssel - fett

Fremdschlüssel - kursiv 



Nutzer (**Nutzer\_ID**, Vorname, Nachname)

Professor (***Nutzer\_ID***)

Medium (**Medien\_ID**, Titel, Ausleihdatum, *Aktueller\_Nutzer\_ID*)

Multimediales\_Medium (***Medien\_ID***)

ELearning\_Medium (***Medien\_ID***)

