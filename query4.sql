-- Para o último mês em que houve pagamentos e para cada especialidade 
-- saber quais os funcionários que receberam um ordenado superior a 2500€ 
-- (E dar a informação que decompõe esse salário, como as horas extra, salário base, etc.)

SELECT IDmes, nomeEspecialidade, nome , salario, SalarioBase, bonus, HorasExtra, ExtraHora
FROM RegistoPagamentos,Pessoas, Funcionarios, Especialidades
INNER JOIN (
    SELECT max(IDmes) AS max
    FROM RegistoPagamentos
)b ON RegistoPagamentos.IDmes = b.max
WHERE
RegistoPagamentos.Salario > 2500
AND 
Pessoas.ID = RegistoPagamentos.ID
AND
Funcionarios.IDpessoa = RegistoPagamentos.ID
AND
Funcionarios.NomeEspecialidade = Especialidades.NomeEspecialidade;