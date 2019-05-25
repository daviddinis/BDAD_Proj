select Nome, NomeDeServico
from Pessoas, Servicos, Visitas
where IDcliente not in 
(
    select
    IDcliente
    from
    Visitas, Lojas, Restaurantes, Eventos
    where
    Visitas.ServiceID  = Lojas.StoreServiceID
    or
    Visitas.ServiceID = Restaurantes.RestaurantServiceID
    or
    Visitas.ServiceID = Eventos.EventServiceID
)
and 
Pessoas.ID = Visitas.IDcliente
and
Visitas.ServiceID = Servicos.ServiceID;