-- 2 Obter os serviços com melhor rating médio.

.mode	columns
.headers	on
.nullvalue	NULL

SELECT
NomeDeServico, max(RatingMedio)
FROM
eventos, servicos, atividades
WHERE eventos.EventServiceID = atividades.ActivityServiceID
and atividades.ActivityServiceID = servicos.ServiceID
