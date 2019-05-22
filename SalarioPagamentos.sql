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