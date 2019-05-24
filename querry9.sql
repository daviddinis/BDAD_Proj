SELECT
 avg(julianday(DataFim) - julianday(DataInicio))as "tempo no parque medio(em dias)",
  max(julianday(DataFim) - julianday(DataInicio))as "tempo maxim(em dias)"
FROM
 Bilhetes;