-- 10 Obter a lista de eventos ordenada por ordem decrescente de rating médio.

.mode	columns
.headers	on
.nullvalue	NULL

SELECT
NomeDeServico, RatingMedio
FROM
eventos, servicos, atividades
WHERE eventos.EventServiceID = atividades.ActivityServiceID
and atividades.ActivityServiceID = servicos.ServiceID
ORDER BY
RatingMedio DESC;
