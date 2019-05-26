--Obter os serviços com melhor rating médio.

SELECT
NomeDeServico, max(RatingMedio)
FROM
eventos, servicos, atividades
WHERE eventos.EventServiceID = atividades.ActivityServiceID
and atividades.ActivityServiceID = servicos.ServiceID
