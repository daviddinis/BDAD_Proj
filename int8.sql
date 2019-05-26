-- 8 Obter todos os chefes e seus subordinados empregados, bem como todos os outros sub-chefes abaixo de cada Chefe 

.mode	columns
.headers	on
.nullvalue	NULL

SELECT
"Nome do Chefe",
"Empregados Subordinados(ID)",
"Chefes Subordinados"
FROM
(SELECT 
Hierarquias.Chefe AS id,
Pessoas.Nome AS "Nome do Chefe",
GROUP_CONCAT(Hierarquias.Subordinado , ", ") AS "Empregados Subordinados(ID)"
FROM Pessoas INNER JOIN Hierarquias ON Hierarquias.Chefe = Pessoas.ID
WHERE Hierarquias.Subordinado NOT IN (SELECT Hierarquias.Chefe FROM Hierarquias)
GROUP BY Chefe)
LEFT JOIN
(SELECT 
Hierarquias.Chefe AS idChefe,
GROUP_CONCAT(Pessoas.Nome , ", ") AS "Chefes Subordinados"
FROM Pessoas INNER JOIN Hierarquias ON Hierarquias.Subordinado = Pessoas.ID
WHERE Hierarquias.Subordinado IN (SELECT Hierarquias.Chefe FROM Hierarquias)
GROUP BY Hierarquias.Chefe) ON id = idChefe
GROUP BY "Nome do Chefe"
ORDER BY "Chefes Subordinados" DESC