SELECT
NomeDeServico, min(RatingMedio)
FROM
eventos, servicos, atividades
WHERE eventos.EventServiceID = atividades.ActivityServiceID
and atividades.ActivityServiceID = servicos.ServiceID
