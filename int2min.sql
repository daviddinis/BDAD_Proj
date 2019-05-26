-- 2 Obter os serviços com pior rating médio.

.mode	columns
.headers	on
.nullvalue	NULL

SELECT
NomeDeServico, min(RatingMedio)
FROM
eventos, servicos, atividades
WHERE eventos.EventServiceID = atividades.ActivityServiceID
and atividades.ActivityServiceID = servicos.ServiceID
