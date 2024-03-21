-- Drop table statements
DROP TABLE IF EXISTS Museum;
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Onderzoeksgroep;
DROP TABLE IF EXISTS Onderzoeker;

-- Entities
CREATE TABLE Museum (
    zaal_id INTEGER,
    zaal_naam CHAR(64),
    PRIMARY KEY(zaal_id)
);

CREATE TABLE Item (
    item_id CHAR(64),
    item_naam CHAR(64),
    PRIMARY KEY(item_id)
);

CREATE TABLE Onderzoeksgroep (
    groep_id INTEGER,
    groep_naam CHAR(64),
    PRIMARY KEY(groep_id)
);

CREATE TABLE Onderzoeker (
    onderzoeker_id INTEGER,
    onderzoeker_naam CHAR(64),
    onderzoeker_functie CHAR(64),
    PRIMARY KEY(onderzoeker_id)
);

CREATE TABLE Gastonderzoeker (
    onderzoeker_id INTEGER,
);

-- Data
INSERT INTO Museum VALUES (1, 'Leven');
INSERT INTO Museum VALUES (2, 'Evolutie');
INSERT INTO Museum VALUES (3, 'Dinotijd');
INSERT INTO Museum VALUES (4, 'Dood');
INSERT INTO Museum VALUES (5, 'LiveScience');

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
