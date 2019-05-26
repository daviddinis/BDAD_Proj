-- 9 Obter o nº de dias médio que os clientes visitam o nosso parque
-- (Bem como o máximo que alguma vez alguém comprou).

.mode	columns
.headers	on
.nullvalue	NULL

SELECT
 avg(julianday(DataFim) - julianday(DataInicio))as "tempo no parque medio(em dias)",
  max(julianday(DataFim) - julianday(DataInicio))as "tempo maxim(em dias)"
FROM
 Bilhetes;