.mode	columns
.headers	on
.nullvalue	NULL

Select * FROM Servicos LIMIT 4;

INSERT INTO Visitas VALUES (000041, 01, '2016-10-02', 5);
INSERT INTO Visitas VALUES (000041, 02, '2016-10-02', 5);
INSERT INTO Visitas VALUES (000041, 03, '2016-10-02', 5);
INSERT INTO Visitas VALUES (000041, 04, '2016-10-02', 5);

Select * FROM Servicos LIMIT 4;
------------------------------------------
Select * FROM RegistoPagamentos WHERE RegistoPagamentos.IDmes = 79;

INSERT INTO RegistoPagamentos VALUES (079, 000125, 12, 200, NULL);

Select * FROM RegistoPagamentos WHERE RegistoPagamentos.IDmes = 79 AND RegistoPagamentos.ID = 125;
------------------------------------------
Select * FROM Clientes ORDER BY Clientes.IDpessoa LIMIT 5;

INSERT INTO Clientes VALUES (000004, 1.7, NULL);

Select * FROM Clientes ORDER BY Clientes.IDpessoa LIMIT 5;
------------------------------------------
Select * FROM Bilhetes ORDER BY Bilhetes.ClientId LIMIT 5;

INSERT INTO Bilhetes VALUES (000004, 107, 'Gold', '2010-06-16', '2010-06-20', NULL);

Select * FROM Bilhetes ORDER BY Bilhetes.ClientId LIMIT 5;