DROP VIEW IF EXISTS maxAgeF;
DROP VIEW IF EXISTS maxAgeM;

CREATE TEMP VIEW maxAgeF AS
SELECT
Pessoas.Genero as genero,
CASE
    WHEN Clientes.Idade <= 13 THEN '1 - 13'
    WHEN Clientes.Idade >= 14 AND Clientes.Idade <= 20 THEN '14 - 20'
    WHEN Clientes.Idade >= 21 AND Clientes.Idade <= 35 THEN '21 - 35'
    WHEN Clientes.Idade >= 36 AND Clientes.Idade <= 50 THEN '36 - 50'
    ELSE '51+'
END idade,
Count(Clientes.Idade) as max
FROM Clientes INNER JOIN Pessoas WHERE Clientes.IDpessoa = Pessoas.ID AND Pessoas.Genero = 'F'
GROUP BY idade
ORDER BY max DESC;

CREATE TEMP VIEW maxAgeM AS
SELECT
Pessoas.Genero as genero,
CASE
    WHEN Clientes.Idade <= 13 THEN '1 - 13'
    WHEN Clientes.Idade >= 14 AND Clientes.Idade <= 20 THEN '14 - 20'
    WHEN Clientes.Idade >= 21 AND Clientes.Idade <= 35 THEN '21 - 35'
    WHEN Clientes.Idade >= 36 AND Clientes.Idade <= 50 THEN '36 - 50'
    ELSE '51+'
END idade,
Count(Clientes.Idade) as max
FROM Clientes INNER JOIN Pessoas WHERE Clientes.IDpessoa = Pessoas.ID AND Pessoas.Genero = 'M'
GROUP BY idade
ORDER BY max DESC;


SELECT
genero as 'Genero',
idade as 'Faixas Etárias Mais Prevalentes',
SUM(max) as 'Número de pessoas'
FROM maxAgeF
GROUP BY idade
UNION
SELECT
genero,
idade,
SUM(max)
FROM maxAgeM
GROUP BY idade
ORDER BY genero ASC, SUM(max) DESC;