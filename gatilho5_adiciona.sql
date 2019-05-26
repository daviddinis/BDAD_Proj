-- Check Visits Trigger

DROP TRIGGER IF EXISTS RatingMedio;

CREATE TRIGGER RatingMedio
BEFORE INSERT ON Visitas
FOR EACH ROW
WHEN EXISTS (SELECT * FROM Visitas
WHERE DataDeRating NOT BETWEEN 
(SELECT Bilhetes.DataInicio FROM Visitas INNER JOIN Bilhetes ON Visitas.IDcliente = Bilhetes.ClientId)
AND
(SELECT Bilhetes.DataFim FROM Visitas INNER JOIN Bilhetes ON Visitas.IDcliente = Bilhetes.ClientId))
Begin
    SELECT RAISE(ABORT, 'Something bad happened');
End;

