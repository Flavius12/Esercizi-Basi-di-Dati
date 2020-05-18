DROP DATABASE universita;
CREATE DATABASE universita;

USE universita;

CREATE TABLE IF NOT EXISTS Corso_laurea (
	Codice INT CHECK(Codice > 0) PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL,
	Descrizione TEXT
);

CREATE TABLE IF NOT EXISTS Dipartimento (
	Codice INT CHECK(Codice > 0) PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Sede (
	Codice INT CHECK(Codice > 0) PRIMARY KEY,
	Indirizzo VARCHAR(50) NOT NULL,
	Citta VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Sede_Dipartimento (
	Codice_Sede INT,
	Codice_Dipartimento INT,
	Note TEXT,
	FOREIGN KEY (Codice_Sede) REFERENCES Sede(Codice)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	FOREIGN KEY (Codice_Dipartimento) REFERENCES Dipartimento(Codice)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Studente (
	Matricola INT CHECK(Matricola > 0),
	Corso_laurea INT,
	Nome VARCHAR(50) NOT NULL,
	Cognome VARCHAR(50) NOT NULL,
	Data_nascita DATE,
	Codice_fiscale CHAR(16),
	Foto BLOB,
	PRIMARY KEY(Matricola, Corso_laurea),
	FOREIGN KEY (Corso_laurea) REFERENCES Corso_laurea(Codice)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Docente (
	Matricola INT CHECK(Matricola > 0),
	Dipartimento INT,
	Nome VARCHAR(50) NOT NULL,
	Cognome VARCHAR(50) NOT NULL,
	Data_nascita DATE,
	Codice_fiscale CHAR(16),
	Foto BLOB,
	PRIMARY KEY(Matricola, Dipartimento),
	FOREIGN KEY(Dipartimento) REFERENCES Dipartimento(Codice)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Modulo (
	Codice_Modulo INT CHECK(Codice_Modulo > 0) PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL,
	Descrizione TEXT,
	CFU SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS Esame (
	Matricola_Studente INT,
	Codice_Modulo INT,
	Matricola_Docente INT,
	Data DATE NOT NULL,
	Voto SMALLINT NOT NULL,
	Note TEXT,
	FOREIGN KEY(Matricola_Studente) REFERENCES Studente(Matricola)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	FOREIGN KEY(Codice_Modulo) REFERENCES Modulo(Codice_Modulo)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	FOREIGN KEY(Matricola_Docente) REFERENCES Docente(Matricola)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);

INSERT INTO Corso_laurea (Codice, Nome, Descrizione) VALUES (1, 'Informatica', 'Corso di lauera in Informatica');
INSERT INTO Corso_laurea (Codice, Nome, Descrizione) VALUES (2, 'Ingegneria Elettronica', 'Corso di laurea in Ingegneria Elettronica');
INSERT INTO Corso_laurea (Codice, Nome, Descrizione) VALUES (3, 'Matematica', 'Corso di laurea in Matematica');

INSERT INTO Dipartimento (Codice, Nome) VALUES (1, 'Dipartimento di Ingegneria');
INSERT INTO Dipartimento (Codice, Nome) VALUES (2, 'Dipartimento di Matematica');

INSERT INTO Sede (Codice, Indirizzo, Citta) VALUES (1, 'Via Orabona, 10', 'Bari');
INSERT INTO Sede (Codice, Indirizzo, Citta) VALUES (2, 'Viale Virgilio, 8', 'Roma');

INSERT INTO Sede_Dipartimento (Codice_Sede, Codice_Dipartimento) VALUES (1, 2);
INSERT INTO Sede_Dipartimento (Codice_Sede, Codice_Dipartimento) VALUES (2, 1);

INSERT INTO Studente (Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto) VALUES (104231, 1, 'Mario', 'Rossi', '1999-01-02', 'RSSMRA99B01H501E', NULL);
INSERT INTO Studente (Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto) VALUES (104232, 2, 'Luca', 'Bianchi', '1996-04-10', 'BNCLCU96D10B180W', NULL);
INSERT INTO Studente (Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto) VALUES (104233, 3, 'Gianni', 'Verdi', '2000-02-20', 'VRDGNN00B20H501T', NULL);

INSERT INTO Docente (Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto) VALUES (851243, 2, 'Antonio', 'Marchi', '1974-06-18', 'MRCNTN74H18H501C', NULL);
INSERT INTO Docente (Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto) VALUES (851244, 2, 'Marco', 'Zulli', '1969-11-27', 'ZLLMRC69S27A662L', NULL);
INSERT INTO Docente (Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto) VALUES (851245, 1, 'Nicola', 'Lodi', '1957-08-11', 'LDONCL57M11H501C', NULL);

INSERT INTO Modulo (Codice_Modulo, Nome, Descrizione, CFU) VALUES (1, 'MAT/01', 'Logica Matematica', 6);
INSERT INTO Modulo (Codice_Modulo, Nome, Descrizione, CFU) VALUES (2, 'FIS/01', 'Fisica Sperimentale', 6);
INSERT INTO Modulo (Codice_Modulo, Nome, Descrizione, CFU) VALUES (3, 'ING-INF/01', 'Ingegneria Elettronica', 12);
INSERT INTO Modulo (Codice_Modulo, Nome, Descrizione, CFU) VALUES (4, 'MAT/06', 'Probabilità e statistica matematica', 9);

INSERT INTO Esame (Matricola_Studente, Codice_Modulo, Matricola_Docente, Data, Voto, Note) VALUES (104231, 2, 851244, '2020-02-06', 26, 'Scritto discreto');
INSERT INTO Esame (Matricola_Studente, Codice_Modulo, Matricola_Docente, Data, Voto, Note) VALUES (104233, 1, 851243, '2020-02-12', 28, NULL);