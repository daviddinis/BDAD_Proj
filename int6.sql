-- 6 Obter todos os carrosséis com data de manutenção noo próximo ano
-- (Nome de carrossel; data a fazer a manutenção).

.mode	columns
.headers	on
.nullvalue	NULL

SELECT 
NomeDeServico, DataProxManutencao
FROM
Carrosseis, Servicos
WHERE
DataProxManutencao < date('now','+365 days')
AND
Carrosseis.CarrousselServiceID =  Servicos.ServiceID;