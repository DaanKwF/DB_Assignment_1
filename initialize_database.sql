-- Drop table statements
DROP TABLE IF EXISTS Museumzaal;
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Onderzoeksgroep;
DROP TABLE IF EXISTS Onderzoeker;

-- Entities
CREATE TABLE Museumzaal (
    zaal_id INTEGER,
    naam VARCHAR,
    PRIMARY KEY(zaal_id)
);

CREATE TABLE Item (
    item_id VARCHAR,
    naam VARCHAR,
    PRIMARY KEY(item_id)
);

CREATE TABLE Onderzoeksgroep (
    groep_id INTEGER,
    naam VARCHAR,
    PRIMARY KEY(groep_id)
);

CREATE TABLE Onderzoeker (
    onderzoeker_id INTEGER,
    naam VARCHAR,
    PRIMARY KEY(onderzoeker_id)
);

CREATE TABLE Gast (
    onderzoeker_id INTEGER,
    instelling VARCHAR,
    contract VARCHAR,
    PRIMARY KEY (onderzoeker_id)
    FOREIGN KEY (onderzoeker_id) REFERENCES Onderzoeker
    ON DELETE CASCADE
);

CREATE TABLE Loondienst (
    onderzoeker_id INTEGER,
    salaris REAL,
    start_datum VARCHAR,
    contract VARCHAR,
    PRIMARY KEY (onderzoek_id)
    FOREIGN KEY (onderzoeker_id) REFERENCES Onderzoeker
    ON DELETE CASCADE
);

CREATE TABLE Tentoonstelling (
    tentoonstelling_id INTEGER,
    naam VARCHAR,
    PRIMARY KEY (tentoonstelling_id)
);

-- Data
INSERT INTO Museumzaal VALUES (1, 'Leven');
INSERT INTO Museumzaal VALUES (2, 'Evolutie');
INSERT INTO Museumzaal VALUES (3, 'Dinotijd');
INSERT INTO Museumzaal VALUES (4, 'Dood');
INSERT INTO Museumzaal VALUES (5, 'LiveScience');

INSERT INTO Item VALUES ('00067A', 'T-Rex');
INSERT INTO Item VALUES ('02710C', 'Haaietand');
INSERT INTO Item VALUES ('30027M', 'Alienacanthus');
INSERT INTO Item VALUES ('86221P', 'Anaconda');
INSERT INTO Item VALUES ('00481S', 'Calla Lily');

INSERT INTO Onderzoeksgroep VALUES (1, 'Understanding Evolution');
INSERT INTO Onderzoeksgroep VALUES (2, 'Marine Biodiversity');
INSERT INTO Onderzoeksgroep VALUES (3, 'Tropical Botany');
INSERT INTO Onderzoeksgroep VALUES (4, 'Functional Traits');
INSERT INTO Onderzoeksgroep VALUES (5, 'Evolutie, Ontwikkeling en Ecologie van Gewervelden');

INSERT INTO Onderzoeker VALUES (1);
INSERT INTO Onderzoeker VALUES (2);
INSERT INTO Onderzoeker VALUES (3);
INSERT INTO Onderzoeker VALUES (4, '');
INSERT INTO Onderzoeker VALUES (5, 'Ton de Winter', 'gast');

INSERT INTO Tentoonstelling VALUES (1, 'Prepareren van dieren en planten');
INSERT INTO Tentoonstelling VALUES (2, 'Naturalis Nu!');
INSERT INTO Tentoonstelling VALUES (3, 'Superzintuigen');
INSERT INTO Tentoonstelling VALUES (4, 'Gif');
INSERT INTO Tentoonstelling VALUES (5, 'T-Rex in town');

INSERT INTO VALUES ();
INSERT INTO VALUES ();
INSERT INTO VALUES ();
INSERT INTO VALUES ();
INSERT INTO VALUES ();

INSERT INTO VALUES ();
INSERT INTO VALUES ();
INSERT INTO VALUES ();
INSERT INTO VALUES ();
INSERT INTO VALUES ();
