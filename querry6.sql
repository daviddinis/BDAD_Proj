select 
DataProxManutencao
from
Carrosseis
where 
DataProxManutencao > (CURRENT_TIME + 30);


