-- Drop table statements
DROP TABLE IF EXISTS Museumzaal;
DROP TABLE IF EXISTS Tentoonstelling;
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Onderzoeksgroep;
DROP TABLE IF EXISTS Onderzoeker;
DROP TABLE IF EXISTS Gast;
DROP TABLE IF EXISTS Loondienst;

DROP TABLE IF EXISTS Begeleidt;
DROP TABLE IF EXISTS Onderzoekt;
DROP TABLE IF EXISTS Werkt_Bij;
DROP TABLE IF EXISTS Hosts;
DROP TABLE IF EXISTS Displays;
DROP TABLE IF EXISTS Samenwerking;


-- Entities
CREATE TABLE Museumzaal (
    zaal_id INTEGER,
    naam VARCHAR,
    PRIMARY KEY(zaal_id)
);

CREATE TABLE Tentoonstelling (
    tentoonstelling_id INTEGER,
    start_datum DATE,
    eind_datum DATE,
    naam VARCHAR,
    PRIMARY KEY (tentoonstelling_id)
);

CREATE TABLE Item (
    item_id INTEGER,
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
    functie VARCHAR,
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
    contract VARCHAR,
    salaris REAL,
    sinds DATE,
    PRIMARY KEY (onderzoek_id)
    FOREIGN KEY (onderzoeker_id) REFERENCES Onderzoeker
    ON DELETE CASCADE
);

-- Data
INSERT INTO Museumzaal VALUES (1, 'Leven');
INSERT INTO Museumzaal VALUES (2, 'Evolutie');
INSERT INTO Museumzaal VALUES (3, 'Dinotijd');
INSERT INTO Museumzaal VALUES (4, 'Dood');
INSERT INTO Museumzaal VALUES (5, 'LiveScience');

INSERT INTO Tentoonstelling VALUES (1, 'Prepareren van Dieren en Planten', 2023-01-01, 2023-11-18);
INSERT INTO Tentoonstelling VALUES (2, 'Naturalis Nu!', 2021-05-17, 2023-08-30);
INSERT INTO Tentoonstelling VALUES (3, 'Superzintuigen', 2022-04-01, NULL);
INSERT INTO Tentoonstelling VALUES (4, 'Gif', 2018-09-01, NULL);
INSERT INTO Tentoonstelling VALUES (5, 'T-Rex in Town', 2006-01-01, NULL);

INSERT INTO Item VALUES (1, 'T-Rex');
INSERT INTO Item VALUES (2, 'Haaietand');
INSERT INTO Item VALUES (3, 'Alienacanthus');
INSERT INTO Item VALUES (4, 'Anaconda');
INSERT INTO Item VALUES (5, 'Calla Lily');
INSERT INTO Item VALUES (6, 'Australisch Slakkenhuis');
INSERT INTO Item VALUES (7, 'Panthera Leo Persica');
INSERT INTO Item VALUES (8, 'Geospiza Parvula');
INSERT INTO Item VALUES (9, 'Dendrogyra cylindrus');
INSERT INTO Item VALUES (10, 'Dionaea muscipula');
INSERT INTO Item VALUES (11, 'Turdus merula');

INSERT INTO Onderzoeksgroep VALUES (1, 'Understanding Evolution');
INSERT INTO Onderzoeksgroep VALUES (2, 'Marine Biodiversity');
INSERT INTO Onderzoeksgroep VALUES (3, 'Tropical Botany');
INSERT INTO Onderzoeksgroep VALUES (4, 'Functional Traits');
INSERT INTO Onderzoeksgroep VALUES (5, 'Evolutie, Ontwikkeling en Ecologie van Gewervelden');

INSERT INTO Onderzoeker VALUES (1, 'Roxali Bijmoer', 'Collectiebeheer Botanie');
INSERT INTO Loondienst VALUES (1, 'voltijd', 40000, 2018-03-01)

INSERT INTO Onderzoeker VALUES (2, 'Matyas Bittenbinder', 'PhD Candidate');
INSERT INTO Loondienst VALUES (2, 'deeltijd', 25000, 2023-09-01)

INSERT INTO Onderzoeker VALUES (3, 'Herman de Jong', 'Senior Onderzoeker');
INSERT INTO Loondienst VALUES (3, 'voltijd', 75000, 1980-01-01)

INSERT INTO Onderzoeker VALUES (4, 'Pim Arntzen', 'Gastonderzoeker');
INSERT INTO Gast Values(4, 'Google', 'voltijd');

INSERT INTO Onderzoeker VALUES (5, 'Ton de Winter', 'Gastonderzoeker');
INSERT INTO Gast Values(5, 'University of Costa Rica', 'deeltijd');

-- Relationships
CREATE TABLE Begeleidt (
    onderzoeker_id INTEGER not NULL,
    tentoonstelling_id INTEGER,
    PRIMARY KEY(tentoonstelling_id, onderzoeker_id),
    FOREIGN KEY(tentoonstelling_id) REFERENCES Tentoonstelling,
    FOREIGN KEY(onderzoeker_id) REFERENCES Onderzoeker,
);

CREATE TABLE Onderzoekt (
    groep_id INTEGER,
    item_id INTEGER,
    sinds DATE,
    PRIMARY KEY(groep_id, item_id),
    FOREIGN KEY(groep_id) REFERENCES Onderzoeksgroep,
    FOREIGN KEY(item_id) REFERENCES Item,
);

CREATE TABLE Werkt_Bij (
    onderzoeker_id INTEGER not NULL,
    groep_id INTEGER not NULL,
    sinds DATE,
    PRIMARY KEY(onderzoeker_id, groep_id),
    FOREIGN KEY(onderzoeker_id) REFERENCES Onderzoeker,
    FOREIGN KEY(groep_id) REFERENCES Onderzoeksgroep,
);

CREATE TABLE Hosts (
    zaal_id INTEGER not NULL,
    tentoonstelling_id INTEGER,
    PRIMARY KEY(zaal_id, tentoonstelling_id),
    FOREIGN KEY(zaal_id) REFERENCES Museumzaal,
    FOREIGN KEY(tentoonstelling_id) REFERENCES Tentoonstelling,
);

CREATE TABLE Displays (
    zaal_id INTEGER,
    item_id INTEGER,
    start_datum DATE,
    eind_datum DATE,
    PRIMARY KEY(zaal_id, item_id),
    FOREIGN KEY(zaal_id) REFERENCES Museumzaal,
    FOREIGN KEY(item_id) REFERENCES Item,
);

CREATE TABLE Samenwerking (
    groep1_id INTEGER,
    groep2_id INTEGER,
    sinds DATE,
    PRIMARY KEY (groep1_id, groep2_id),
    FOREIGN KEY (groep1_id) REFERENCES Onderzoeksgroep(groep_id),
    FOREIGN KEY (groep2_id) REFERENCES Onderzoeksgroep(groep_id)
);

-- Data
INSERT INTO Begeleidt VALUES (1, 1);
INSERT INTO Begeleidt VALUES (2, 3);
INSERT INTO Begeleidt VALUES (3, 5);
INSERT INTO Begeleidt VALUES (4, 5);
INSERT INTO Begeleidt VALUES (5, 3);

INSERT INTO Onderzoekt VALUES (3, 2, 2023-04-23);
INSERT INTO Onderzoekt VALUES (4, 4, 2015-07-05);
INSERT INTO Onderzoekt VALUES (4, 1, 2018-09-28);
INSERT INTO Onderzoekt VALUES (5, 3, 2010-01-10);
INSERT INTO Onderzoekt VALUES (2, 2, 2021-10-17);

INSERT INTO Werkt_Bij VALUES (1, 3, 2022-04-01);
INSERT INTO Werkt_Bij VALUES (2, 1, 2018-09-01);
INSERT INTO Werkt_Bij VALUES (3, 4, 2020-02-01);
INSERT INTO Werkt_Bij VALUES (4, 2, 2017-01-01);
INSERT INTO Werkt_Bij VALUES (5, 5, 2023-07-01);

INSERT INTO Hosts VALUES (5, 1);
INSERT INTO Hosts VALUES (5, 2);
INSERT INTO Hosts VALUES (1, 3);
INSERT INTO Hosts VALUES (4, 4);
INSERT INTO Hosts VALUES (3, 5);

INSERT INTO Displays VALUES (1, 4, 2010-02-07, NULL);
INSERT INTO Displays VALUES (2, 8, 2015-01-18, NULL);
INSERT INTO Displays VALUES (3, 1, 2005-06-01, NULL);
INSERT INTO Displays VALUES (4, 2, 2016-08-09, NULL);
INSERT INTO Displays VALUES (5, 11, 2023-02-01, 2023-02-15);

INSERT INTO Samenwerking VALUES (1, 5, 2022-04-08);
INSERT INTO Samenwerking VALUES (1, 4, 2019-08-20);
INSERT INTO Samenwerking VALUES (2, 5, 2021-01-16);
