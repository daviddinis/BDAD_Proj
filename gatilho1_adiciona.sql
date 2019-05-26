-- 1.1 Rating Medio Trigger

DROP TRIGGER IF EXISTS RatingMedio;

CREATE TRIGGER RatingMedio
AFTER INSERT ON Visitas
BEGIN    
    UPDATE Servicos
    SET RatingMedio = (SELECT AVG(Rating) FROM Visitas WHERE ServiceID = NEW.ServiceID)
    WHERE ServiceID = NEW.ServiceID;
END;

-- 1.2 SalarioPagamentos Trigger

DROP TRIGGER IF EXISTS SalarioPagamentos;

CREATE TRIGGER SalarioPagamentos
AFTER INSERT ON RegistoPagamentos
BEGIN    
    UPDATE RegistoPagamentos
    SET Salario = Bonus +
    (SELECT SalarioBase FROM Especialidades WHERE NomeEspecialidade = 
    (SELECT NomeEspecialidade FROM Funcionarios WHERE IDpessoa = NEW.ID)) +
    HorasExtra *
    (SELECT ExtraHora FROM Especialidades WHERE NomeEspecialidade = 
    (SELECT NomeEspecialidade FROM Funcionarios WHERE IDpessoa = NEW.ID))
    WHERE ID = NEW.ID AND IDmes = NEW.IDmes;
END;

-- 1.3 Idade Clientes Trigger

DROP TRIGGER IF EXISTS IdadeClientes;

CREATE TRIGGER IdadeClientes
AFTER INSERT ON Clientes
BEGIN    
    UPDATE Clientes
    SET Idade = date('now') - (SELECT DataDeNascimento FROM Pessoas WHERE ID = NEW.IDpessoa)
    WHERE IDpessoa = NEW.IDpessoa;
END;

-- 1.4 Preço dos bilhetes trigger

DROP TRIGGER IF EXISTS PrecoBilhete;

CREATE TRIGGER PrecoBilhete
AFTER INSERT ON Bilhetes
BEGIN    
    UPDATE Bilhetes
    SET Preco = (julianday(DataFim) - julianday(DataInicio))*(SELECT PrecoDiario FROM TipoDeBilhete WHERE TypeName = NEW.TypeName)
    WHERE Nbilhete = NEW.Nbilhete;
END;