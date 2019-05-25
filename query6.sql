select 
DataProxManutencao, NomeDeServico
from
Carrosseis, Servicos
where
DataProxManutencao < date('now','+30 days')
and
Carrosseis.CarrousselServiceID =  Servicos.ServiceID;