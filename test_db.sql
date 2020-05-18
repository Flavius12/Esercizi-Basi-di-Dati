INSERT INTO Corso_laurea (Codice, Nome, Descrizione) VALUES (0, 'Fisica', 'Corso di lauera in Fisica');

INSERT INTO Dipartimento (Codice, Nome) VALUES (0, 'Dipartimento di Chimica');

INSERT INTO Sede (Codice, Indirizzo, Citta) VALUES (0, 'Via Napoli, 195', 'Bari');

INSERT INTO Sede_Dipartimento (Codice_Sede, Codice_Dipartimento) VALUES (1, 4);
INSERT INTO Sede_Dipartimento (Codice_Sede, Codice_Dipartimento) VALUES (8, 2);

INSERT INTO Studente (Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto) VALUES (0, 1, 'Alberico', 'Rossi', NULL, NULL, NULL);
INSERT INTO Studente (Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto) VALUES (107238, 1, NULL, 'Rossi', NULL, NULL, NULL);
INSERT INTO Studente (Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto) VALUES (107239, 1, 'Valentino', NULL, NULL, NULL, NULL);
INSERT INTO Studente (Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto) VALUES (107240, 41, 'Massimo', 'Bianchi', NULL, NULL, NULL);

INSERT INTO Modulo (Codice_Modulo, Nome, Descrizione, CFU) VALUES (0, 'MAT/02', 'Algebra', 9);

INSERT INTO Esame (Matricola_Studente, Codice_Modulo, Matricola_Docente, Data, Voto, Note) VALUES (104233, 1, 851243, NULL, 28, NULL);
INSERT INTO Esame (Matricola_Studente, Codice_Modulo, Matricola_Docente, Data, Voto, Note) VALUES (104233, 1, 851243, '2020-02-14', NULL, NULL);
INSERT INTO Esame (Matricola_Studente, Codice_Modulo, Matricola_Docente, Data, Voto, Note) VALUES (604237, 1, 851243, '2020-02-12', 28, NULL);
INSERT INTO Esame (Matricola_Studente, Codice_Modulo, Matricola_Docente, Data, Voto, Note) VALUES (104233, 1, 551243, '2020-02-12', 28, NULL);