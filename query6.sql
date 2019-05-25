" Obter todos os carrosséis com data de manutenção nos próximos 30 dias (Nome de carrossel; data a fazer a manutenção)."

select 
DataProxManutencao, NomeDeServico
from
Carrosseis, Servicos
where
DataProxManutencao < date('now','+30 days')
and
Carrosseis.CarrousselServiceID =  Servicos.ServiceID;