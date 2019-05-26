
.mode	columns
.headers	on
.nullvalue	NULL

-- 2 Obter os serviços com melhor rating médio.
SELECT
NomeDeServico, max(RatingMedio)
FROM
servicos, atividades
WHERE atividades.ActivityServiceID = servicos.ServiceID

-- 2 Obter os serviços com pior rating médio.
SELECT
NomeDeServico, min(RatingMedio)
FROM
servicos, atividades
WHERE atividades.ActivityServiceID = servicos.ServiceID