DROP VIEW IF EXISTS maxAgeF;
DROP VIEW IF EXISTS maxAgeM;

CREATE TEMP VIEW maxAgeF AS
SELECT
Pessoas.Genero as genero,
Clientes.Idade as idade,
Count(*) as max
FROM Clientes INNER JOIN Pessoas WHERE Clientes.IDpessoa = Pessoas.ID AND Pessoas.Genero = 'F'
GROUP BY Clientes.Idade
ORDER BY max DESC LIMIT 1;

CREATE TEMP VIEW maxAgeM AS
SELECT
Pessoas.Genero as genero,
Clientes.Idade as idade,
Count(*) as max
FROM Clientes INNER JOIN Pessoas WHERE Clientes.IDpessoa = Pessoas.ID AND Pessoas.Genero = 'M'
GROUP BY Clientes.Idade
ORDER BY max DESC LIMIT 1;


SELECT
genero as 'Genero',
idade as 'Idade Mais Prevalente'
FROM maxAgeF
UNION
SELECT
genero,
idade
FROM maxAgeM;