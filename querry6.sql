
/*Obter todos os clientes que foram só a um tipo de serviço e não aos outros 2. (E o serviço a que foram)*/

select 
Nome, NomeDeServico
from
Pessoas, Servicos, Visitas, Clientes, Lojas, Restaurantes, Atividades
where
Pessoas.ID =  Clientes.IDpessoa
and
Visitas.ServiceID = Lojas.StoreServiceID;
