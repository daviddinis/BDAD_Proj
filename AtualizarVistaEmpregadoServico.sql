drop trigger
if exists createNewEmplyee;
drop view
if Exists ServicoComFuncionarios;

create view ServicoComFuncionarios
as
select Servicos.NomeDeServico, Servicos.ServiceID, Pessoas.Nome AS NomeFuncionario, Funcionarios.NomeEspecialidade AS Especialidade, FuncionarioDeServico.Func_Internal_ID AS IDInterno, Funcionarios.IDpessoa AS IDfuncionario
FROM FuncionarioDeServico
INNER JOIN Servicos ON Servicos.ServiceID = FuncionarioDeServico.ServiceID
INNER JOIN Pessoas ON Pessoas.ID = FuncionarioDeServico.IDfuncionario
INNER JOIN Funcionarios ON Funcionarios.IDpessoa = FuncionarioDeServico.IDfuncionario;

CREATE TRIGGER createNewEmplyee
INSTEAD OF INSERT ON ServicoComFuncionarios
FOR EACH ROW
BEGIN
    INSERT INTO FuncionarioDeServico(ServiceID, IDfuncionario, Func_Internal_ID)
    VALUES(NEW.ServiceID, NEW.IDfuncionario, NEW.IDInterno);
END;