/* 1. Mostrare nome e descrizione di tutti i moduli da 9 CFU */
SELECT Nome, Descrizione FROM Modulo WHERE CFU = 9;

/* 2. Mostrare matricola, nome e cognome dei docenti che hanno più di 60 anni */
SELECT Matricola, Nome, Cognome FROM Docente WHERE Data_nascita < '1960-01-01';

/* 3. Mostrare nome, cognome e nome del dipartimento di ogni docente, ordinati dal più giovane al più anziano. */
SELECT Docente.Nome, Docente.Cognome, Dip.Nome AS Nome_dipartimento FROM Docente JOIN Dipartimento Dip ON Docente.Dipartimento = Dip.Codice ORDER BY Docente.Data_nascita;

/* 4. Mostrare città e indirizzo di ogni sede del dipartimento di codice 1 */
SELECT Citta, Indirizzo FROM Sede JOIN Sede_Dipartimento SedeDip ON Codice = SedeDip.Codice_Sede WHERE Codice_Dipartimento = 1;

/* 5. Mostrare nome del dipartimento, città e indirizzo di ogni sede di ogni dipartimento, ordinate alfabeticamente prima per nome dipartimento, poi per nome città e infine per indirizzo. */
SELECT Dipartimento.Nome AS Nome_Dipartimento, Citta, Indirizzo FROM Sede_Dipartimento JOIN Dipartimento ON Dipartimento.Codice = Codice_Dipartimento JOIN Sede ON Sede.codice = Codice_Sede ORDER BY Dipartimento.Nome;

/* 6. Mostrare il nome di ogni dipartimento che ha una sede a Bari. */
SELECT Dipartimento.Nome AS Nome_Dipartimento FROM Sede JOIN Sede_Dipartimento ON Codice_Sede = Sede.Codice JOIN Dipartimento ON Dipartimento.Codice = Codice_Dipartimento WHERE Citta = 'Bari';

/* 7. Mostrare il nome di ogni dipartimento che non ha sede a Bari. */
SELECT DISTINCT Dipartimento.nome AS Nome_Dipartimento FROM Sede JOIN Sede_Dipartimento ON Codice_Sede = Sede.Codice JOIN Dipartimento ON Dipartimento.Codice = Codice_Dipartimento WHERE Citta != 'Bari';

/* 8. Mostrare media, numero esami sostenuti e totale CFU acquisiti dello studente con matricola 104233. */
SELECT AVG(Voto) AS Media_Voti, SUM(CFU) AS Totale_CFU, COUNT(*) AS Esami_Sostenuti FROM Esame JOIN Modulo ON Esame.Codice_Modulo = Modulo.Codice_Modulo WHERE Matricola_Studente = 104233;

/* 9. Mostrare nome, cognome, nome del corso di laurea, media e numero esami sostenuti dello studente con matricola 104233. */
SELECT Studente.Nome, Studente.Cognome, Corso_laurea.Nome AS Corso_laurea, AVG(Voto) AS Media_Voti, COUNT(*) AS Esami_Superati FROM Studente JOIN Esame ON Studente.Matricola = Matricola_Studente JOIN Corso_laurea ON Codice = Studente.Corso_laurea WHERE Matricola_Studente = 104233 GROUP BY Matricola_Studente, Nome, Cognome, Corso_laurea;

/* 10. Mostrare codice, nome e voto medio di ogni modulo, ordinati dalla media più alta alla più bassa. */
SELECT Modulo.Codice_Modulo, Modulo.Nome, AVG(voto) AS Media_per_Modulo FROM Modulo JOIN Esame ON Modulo.Codice_Modulo = Esame.Codice_Modulo GROUP BY Esame.Codice_Modulo ORDER BY Media_per_Modulo DESC;

/* 11. Mostrare nome e cognome del docente, nome e descrizione del modulo per ogni docente ed ogni modulo di cui quel docente abbia tenuto almeno un esame; il risultato deve includere anche i docenti che non abbiano tenuto alcun esame, in quel caso rappresentati con un'unica tupla in cui nome e descrizione del modulo avranno valore NULL. */
SELECT DISTINCT Docente.Nome Nome_Docente, docente.Cognome Cognome_Docente, Modulo.Nome Nome_Modulo, Modulo.Descrizione Descrizione_Modulo FROM Modulo JOIN Esame ON Modulo.Codice_Modulo = Esame.Codice_Modulo JOIN Docente ON Esame.Matricola_Docente = Docente.Matricola WHERE Docente.Matricola IN (SELECT Esame.Matricola_Docente FROM Esame) OR Docente.Matricola NOT IN (SELECT Esame.Matricola_Docente FROM Esame);
   
/* 12. Mostrare matricola, nome, cognome, data di nascita, media e numero esami sostenuti di ogni studente. */
SELECT Studente.Matricola, Studente.Nome, Studente.Cognome, Studente.Data_nascita, AVG(Voto) AS Media_Voti, COUNT(*) Esami_Sostenuti FROM Studente JOIN Esame ON Studente.Matricola = Esame.Matricola_Studente GROUP BY Studente.Matricola, Studente.Nome, Studente.Cognome, Studente.Data_nascita;

/* 13. Mostrare matricola, nome, cognome, data di nascita, media e numero esami sostenuti di ogni studente del corso di laurea di codice "ICD" che abbia media maggiore di 27. */
SELECT Studente.Matricola, Studente.Nome, Studente.Cognome, Studente.Data_nascita, AVG(Voto) AS Media_Voti, COUNT(*) AS Esami_Sostenuti FROM Studente JOIN Esame ON Studente.Matricola = Esame.Matricola_Studente GROUP BY Studente.Matricola, Studente.Nome, Studente.Cognome, Studente.Data_nascita HAVING(Media_Voti > 27);
 
/* 14. Mostrare nome, cognome e data di nascita di tutti gli studenti che ancora non hanno superato nessun esame. */
SELECT Studente.Nome, Studente.Cognome, Studente.Data_nascita FROM Studente WHERE Studente.Matricola NOT IN (SELECT Matricola_Studente FROM Esame);

/* 15. Mostrare la matricola di tutti gli studenti che hanno superato almeno un esame e che hanno preso sempre voti maggiori di 26. */
SELECT Studente.Matricola FROM Studente JOIN Esame ON Esame.Matricola_Studente = Studente.Matricola WHERE Voto > 26;

/* 16. Mostrare, per ogni modulo, il numero degli studenti che hanno preso tra 18 e 21, quelli che hanno preso tra 22 e 26 e quelli che hanno preso tra 27 e 30 (con un'unica interrogazione). */
SELECT Modulo.Codice_Modulo, (SELECT COUNT(*) FROM Esame WHERE (Esame.Codice_Modulo = Modulo.Codice_Modulo AND (Voto >= 18 AND Voto <= 21))) AS Voti_18_21, (SELECT COUNT(*) FROM Esame WHERE (Esame.Codice_Modulo = Modulo.Codice_Modulo AND (Voto >= 22 AND Voto <= 26))) AS Voti_22_26, (SELECT COUNT(*) FROM Esame WHERE (Esame.Codice_Modulo = Modulo.Codice_Modulo AND (Voto >= 27 AND Voto <= 30))) AS Voti_27_30 FROM Esame JOIN Modulo ON Esame.Codice_Modulo = Modulo.Codice_Modulo GROUP BY Modulo.Codice_Modulo;

/* 17. Mostrare matricola, nome, cognome e voto di ogni studente che ha preso un voto maggiore della media nel modulo 1 */
SELECT Studente.Matricola, Studente.Nome, Studente.Cognome, Voto, Codice_Modulo FROM Studente JOIN Esame ON Studente.Matricola = Esame.Matricola_Studente WHERE Codice_modulo = 1 AND Voto > (SELECT AVG(Voto) FROM Esame WHERE Codice_Modulo = 1);

/* 18. Mostrare matricola, nome, cognome di ogni studente che ha preso ad almeno 3 esami un voto maggiore della media per quel modulo. */
SELECT Esame.Matricola_Studente, Studente.Nome, Studente.Cognome, COUNT(*) AS Esami_Sopra_Media FROM Esame JOIN Modulo Mod1 ON Esame.Codice_modulo = Mod1.Codice_Modulo JOIN Studente ON Studente.Matricola = Esame.Matricola_Studente WHERE Voto > (SELECT AVG(Voto) FROM Esame JOIN Modulo Mod2 ON Esame.Codice_Modulo = Mod2.Codice_Modulo WHERE Mod1.Codice_Modulo = Mod2.Codice_Modulo) GROUP BY Esame.Matricola_Studente, Studente.Nome, Studente.Cognome HAVING(Esami_Sopra_Media >= 3)