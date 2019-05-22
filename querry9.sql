SELECT
 avg(julianday(DataFim) - julianday(DataInicio))as "tempo medio"
FROM
 Bilhetes;
