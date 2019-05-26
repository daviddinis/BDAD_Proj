-- Obter a época com mais bilhetes comprados.

SELECT NomeDeEpoca, count(*) 
FROM Bilhetes, Epocas
WHERE strftime("%j",Bilhetes.DataFim) >= Epocas.DataInicio and
    strftime("%j",Bilhetes.DataFim) <= Epocas.DataFim
GROUP BY
NomeDeEpoca
;