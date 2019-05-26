.mode	columns
.headers	on
.nullvalue	NULL

Select * FROM Visitas WHERE Visitas.IDcliente = 1 OR Visitas.IDcliente = 129;

INSERT INTO Visitas VALUES (000001, 08, '2009-06-18', 1);
INSERT INTO Visitas VALUES (000001, 02, '2011-06-18', 1);
INSERT INTO Visitas VALUES (000129, 13, '2014-07-18', 0);

Select * FROM Visitas WHERE Visitas.IDcliente = 1 OR Visitas.IDcliente = 129;