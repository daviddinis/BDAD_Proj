-- 2 Obter os serviços com melhor rating médio.

.mode	columns
.headers	on
.nullvalue	NULL

SELECT
NomeDeServico, max(RatingMedio)
FROM
servicos, atividades
WHERE atividades.ActivityServiceID = servicos.ServiceID
