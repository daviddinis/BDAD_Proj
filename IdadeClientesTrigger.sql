DROP TRIGGER IF EXISTS IdadeClientes;

CREATE TRIGGER IdadeClientes
AFTER INSERT ON Clientes
BEGIN    
    UPDATE Clientes
    SET Idade = date('now') - (SELECT DataDeNascimento FROM Pessoas WHERE ID = NEW.IDpessoa)
    WHERE IDpessoa = NEW.IDpessoa;
END;