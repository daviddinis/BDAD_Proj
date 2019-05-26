select IDmes, nome , nomeEspecialidade, salario, SalarioBase, bonus, HorasExtra, ExtraHora
from RegistoPagamentos,Pessoas, Funcionarios, Especialidades
INNER JOIN (
    SELECT max(IDmes) AS max
    FROM RegistoPagamentos
)b ON RegistoPagamentos.IDmes = b.max
where
RegistoPagamentos.Salario > 2500
and 
Pessoas.ID = RegistoPagamentos.ID
and
Funcionarios.IDpessoa = RegistoPagamentos.ID
and
Funcionarios.NomeEspecialidade = Especialidades.NomeEspecialidade
;


