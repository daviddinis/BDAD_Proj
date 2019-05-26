-- 3 Obter a época com mais bilhetes comprados.

.mode	columns
.headers	on
.nullvalue	NULL

SELECT NomeDeEpoca, count(*) AS "Numero de Vendas"
FROM Bilhetes, Epocas
WHERE strftime("%j",Bilhetes.DataFim) >= Epocas.DataInicio and
    strftime("%j",Bilhetes.DataFim) <= Epocas.DataFim
GROUP BY
NomeDeEpoca
ORDER BY "Numero de Vendas" DESC
;