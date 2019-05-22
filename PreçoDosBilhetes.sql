DROP TRIGGER IF EXISTS PrecoBilhete;

CREATE TRIGGER PrecoBilhete
AFTER INSERT ON Bilhetes
BEGIN    
    UPDATE Bilhetes
    SET Preco = (julianday(DataFim) - julianday(DataInicio))*(SELECT PrecoDiario FROM TipoDeBilhete WHERE TypeName = NEW.TypeName)
    WHERE Nbilhete = NEW.Nbilhete;
END;