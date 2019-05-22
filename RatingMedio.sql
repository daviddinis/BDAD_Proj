DROP TRIGGER IF EXISTS RatingMedio;

CREATE TRIGGER RatingMedio
AFTER INSERT ON Visitas
BEGIN    
    UPDATE Servicos
    SET RatingMedio = (SELECT AVG(Rating) FROM Visitas WHERE ServiceID = NEW.ServiceID)
    WHERE ServiceID = NEW.ServiceID;
END;