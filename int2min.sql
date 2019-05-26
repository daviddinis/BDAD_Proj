-- 2 Obter os serviços com pior rating médio.

.mode	columns
.headers	on
.nullvalue	NULL

SELECT
NomeDeServico, min(RatingMedio)
FROM
servicos, atividades
WHERE atividades.ActivityServiceID = servicos.ServiceID
