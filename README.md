# DB_Praktikum

readme datei für das praktikum

hier passieren sachen


## docker starten und log-Datei erstellen
-----------------------------------------------------------------------------------------------------------------------------------------------------

C:\Users\Brygida>cd "C:\Users\Brygida\Documents\docker\praktikum_2"
>
C:\Users\Brygida\Documents\docker\praktikum_2>wsl
>
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker/praktikum_2$ docker
>
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker/praktikum_2$ docker run --rm -v $(pwd)/script.sql:/script.sql -e SQL_FILE=/script.sql bsalgert/postgres:v1 > result.log

-----------------------------------------------------------------------------------------------------------------------------------------------------




C:\Users\Brygida>cd C:\Users\Brygida\Documents\docker

C:\Users\Brygida\Documents\docker>docker

C:\Users\Brygida\Documents\docker>wsl
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ docker

nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ sudo docker run -it --rm bsalgert/postgres:v1
localhost:5432 - accepting connections
Database is ready!
Use \q to exit
Example: SELECT * FROM Movies;
psql (18.0 (Debian 18.0-1.pgdg13+3))
Type "help" for help.

nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ ls
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ docker run --rm -v $(pwd)/script.sql:/script.sql -e SQL_FILE=/script.sql bsalgert/postgres:v1 > result.log
permission denied while trying to connect to the docker API at unix:///var/run/docker.sock
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ sudo docker run --rm -v $(pwd)/script.sql:/script.sql -e SQL_FILE=/script.sql bsalgert/postgres:v1 > result.log
[sudo] password for nevio:
psql:/script.sql: error: could not read from input file: Is a directory
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ sudo docker run --rm -v $(pwd)/script.sql:/script.sql -e SQ
L_FILE=/script.sql bsalgert/postgres:v1 > result.log
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ sudo docker run -d --name mydb bsalgert/postgres:v1 /demon.
sh
c5bf3d3ccc5cd14f2e0ce1f491b915324cd72fecf79e2ceca6f542dd6d681810
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ sudo docker ps
CONTAINER ID   IMAGE                  COMMAND                  CREATED          STATUS          PORTS      NAMES
c5bf3d3ccc5c   bsalgert/postgres:v1   "docker-entrypoint.s…"   22 seconds ago   Up 21 seconds   5432/tcp   mydb
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ docker ps
permission denied while trying to connect to the docker API at unix:///var/run/docker.sock
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ sudo docker ps
CONTAINER ID   IMAGE                  COMMAND                  CREATED              STATUS              PORTS      NAMES
c5bf3d3ccc5c   bsalgert/postgres:v1   "docker-entrypoint.s…"   About a minute ago   Up About a minute   5432/tcp   mydb
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ docker exec -it mydb bash
permission denied while trying to connect to the docker API at unix:///var/run/docker.sock
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ sudo docker exec -it mydb bash
root@c5bf3d3ccc5c:/# ls
bin   demon.sh  docker-entrypoint-initdb.d  home  lib64  mnt  proc  run   srv       sys  usr
boot  dev       etc                         lib   media  opt  root  sbin  start.sh  tmp  var
root@c5bf3d3ccc5c:/# cd homse
bash: cd: homse: No such file or directory
root@c5bf3d3ccc5c:/# cd home
root@c5bf3d3ccc5c:/home# ls
root@c5bf3d3ccc5c:/home# cd ..
root@c5bf3d3ccc5c:/# exit
exit
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ sudo docker run --rm -v $(pwd)/script.sql:/script.sql -e SQL_FILE=/script.sql bsalgert/postgres:v1 > result.log
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ ls
result.log  script.sql
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ cat result.log

localhost:5432 - accepting connections
Database is ready!
Use \q to exit

SELECT * FROM Movies;
 movie_id |                        title                        | releasedate | genre_id |  budget   | openingweek |  profit   | runtime | certificate | sequelof |        distribution
----------+-----------------------------------------------------+-------------+----------+-----------+-------------+-----------+---------+-------------+----------+----------------------------
        1 | Avatar - Aufbruch nach Pandora                      | 2009-12-17  |        1 | 237000000 |    77025481 | 760505847 |     162 |          12 |          | 20th Century Fox
        2 | Titanic                                             | 1997-12-14  |        2 | 200000000 |    28638131 | 658672302 |     194 |          12 |          | Paramount Pictures
        3 | Star Wars: Das Erwachen der Macht                   | 2015-12-14  |        1 | 245000000 |   247966675 | 936627416 |     136 |          12 |          | Walt Disney Studios
        4 | Jurassic World                                      | 2015-12-14  |        1 | 150000000 |   204600000 | 652177271 |     124 |          12 |          | Universal Studios
        5 | The Avengers                                        | 2012-04-11  |        3 | 220000000 |   207438708 | 623279547 |     143 |          12 |          | Walt Disney Studios
        6 | Fast & Furios 7                                     | 2016-03-15  |        4 | 190000000 |   147187040 | 350034110 |     137 |          12 |          | Universal Studios
        7 | Avengers: Age of Ultron                             | 2015-04-13  |        3 | 250000000 |   191271109 | 458991599 |     141 |          12 |        5 | Walt Disney Studios
        8 | Harry Potter und die Heiligtümer des Todes – Teil 2 | 2011-07-11  |        5 | 125000000 |   169189427 | 380955619 |     130 |          12 |          | Warner Bros. Entertainment
        9 | Die Eiskönigin – Völlig unverfroren                 | 2011-10-11  |        6 | 150000000 |    67391326 | 400736600 |     102 |           0 |          | Walt Disney Studios
       10 | Die Schöne und das Biest                            | 2017-03-17  |        5 | 160000000 |   174750616 | 503974884 |     129 |           6 |          | Walt Disney Studios
       11 | Fast & Furious 8                                    | 2017-04-04  |        4 | 250000000 |    98786705 | 225697400 |     136 |          12 |        6 | Universal Studios
       12 | Iron Man 3                                          | 2013-04-12  |        4 | 200000000 |   174144585 | 408992272 |     130 |          12 |          | Walt Disney Studios
       13 | Minions                                             | 2015-06-11  |        4 |  74000000 |   115200000 | 336029560 |      91 |           0 |          | Universal Studios
       14 | The First Avenger: Civil War                        | 2016-04-28  |        3 | 250000000 |   179139142 | 408080554 |     147 |          12 |          | Walt Disney Studios
       15 | Transformers 3 – Die dunkle Seite des Mondes        | 2011-06-29  |        3 | 195000000 |   115886050 | 352358779 |     154 |          12 |          | Paramount Pictures
       16 | Der Herr der Ringe: Die Rückkehr des Königs         | 2003-12-17  |        5 |  94000000 |    72629713 | 377019252 |     201 |          12 |          | New Line Cinema
       17 | James Bond 007: Skyfall                             | 2012-11-01  |        4 | 200000000 |    88364714 | 304360277 |     143 |          12 |          | Metro-Goldwyn-Mayer
       18 | Transformers: Ära des Untergangs                    | 2014-07-17  |        3 | 210000000 |   100038390 | 245428137 |     165 |          12 |       15 | Paramount Pictures
       19 | The Dark Knight Rises                               | 2012-07-26  |        3 | 250000000 |   160887295 | 448130642 |     164 |          12 |          | Warner Bros. Entertainment
       20 | Toy Story 3                                         | 2010-07-29  |        6 | 200000000 |   109000000 | 414984497 |     103 |           0 |          | Walt Disney Studios
(20 rows)

nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ sudo docker ps
CONTAINER ID   IMAGE                  COMMAND                  CREATED         STATUS         PORTS      NAMES
c5bf3d3ccc5c   bsalgert/postgres:v1   "docker-entrypoint.s…"   4 minutes ago   Up 4 minutes   5432/tcp   mydb
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ sudo docker exec -it mydb bash
root@c5bf3d3ccc5c:/# psql -U postgres -d postgres
psql (18.0 (Debian 18.0-1.pgdg13+3))
Type "help" for help.

postgres=# exit
root@c5bf3d3ccc5c:/# exit
exit
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ sudo docker ps
CONTAINER ID   IMAGE                  COMMAND                  CREATED         STATUS         PORTS      NAMES
c5bf3d3ccc5c   bsalgert/postgres:v1   "docker-entrypoint.s…"   7 minutes ago   Up 7 minutes   5432/tcp   mydb
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ docker stop mydb
permission denied while trying to connect to the docker API at unix:///var/run/docker.sock
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ sudo docker stop mydb
sudo docker ps
mydb
nevio@DESKTOP-U5HVH5T:/mnt/c/Users/Brygida/Documents/docker$ sudo docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

-----------------------------------------------------------------------------------------------------------------------------------------------------

## Aufgabe 1
Erstellen Sie jeweils eine Abfrage, um die Tupel der Tabelle Movies anzuzeigen.

// select * from Movies;

## Aufgabe 2
Erstellen Sie eine Abfrage, um jeweils Titel, Erscheinungsdatum und Genre_ID aller Filme anzuzeigen, wobei die Ausgabe nach Titel sortiert sein soll.

// select title, ReleaseDate, Genre_ID from Movies order by title;

## Aufgabe 3
Erstellen Sie eine Abfrage, um die Filmverleihfirmen anzuzeigen. Unterdrücken Sie die mehrfache Ausgabe der Filmverleihfirmen.

// select distinct Distribution from Movies;

## Aufgabe 4a
Erstellen Sie eine Abfrage, um ID, Titel und Gewinn jener Filme anzuzeigen, die mehr als 600 Millionen Dollar eingespielt haben.

// select Movie_ID, title, Profit from Movies where Profit > 600000000;

## Aufgabe 4b
Ändern Sie die Abfrage aus Aufgabe 4a dahingehend, dass Titel und Einspielergebnis aller Filme angezeigt werden, deren Ergebnis zwischen 600 und 700 Millionen liegt.

// select title, OpeningWeek from Movies where Profit between 600000000 and 700000000;

## Aufgabe 5a
Zeigen Sie Titel, Budget und Gewinn aller Filme an, die eine Fortsetzung eines anderen Films sind. Sortieren Sie die Daten in absteigender Reihenfolge nach Gewinn.

// select title, Budget, Profit from Movies where SequelOf is not null;

## Aufgabe 5b
Modifizieren Sie Ihre Anfrage, so dass Budget und Gewinn als eine Summe mit Namen "UMSATZ" ausgegeben wird.

// select title, (Profit - Budget) as Umsatz from Movies where SequelOf is not null;
