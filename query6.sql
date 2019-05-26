--Obter todos os carrosséis com data de manutenção nos próximos 30 dias 
--(Nome de carrossel; data a fazer a manutenção). 

SELECT 
DataProxManutencao, NomeDeServico
FROM
Carrosseis, Servicos
WHERE
DataProxManutencao < date('now','+30 days')
AND
Carrosseis.CarrousselServiceID =  Servicos.ServiceID;