-- testar atualizar vista ermpregado servico 
.mode	columns
.headers	on
.nullvalue	NULL

Select * FROM FuncionarioDeServico WHERE FuncionarioDeServico.ServiceID = 13 OR FuncionarioDeServico.ServiceID = 10;

INSERT INTO ServicoComFuncionarios(ServiceID, IDfuncionario, IDInterno) VALUES(13, 15, 5);
INSERT INTO ServicoComFuncionarios(ServiceID, IDfuncionario, IDInterno) VALUES(13, 26, 6);
INSERT INTO ServicoComFuncionarios(ServiceID, IDfuncionario, IDInterno) VALUES(10, 54, 9);

Select * FROM FuncionarioDeServico WHERE FuncionarioDeServico.ServiceID = 13 OR FuncionarioDeServico.ServiceID = 10;