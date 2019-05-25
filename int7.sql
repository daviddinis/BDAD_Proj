SELECT 
Pessoas.Nome AS "Funcionário",
GROUP_CONCAT((SELECT Horarios.HoraInicio || " - " || Horarios.HoraFim WHERE Horarios.DiaSemana = "Sabado"), ", ") AS "Horarios Sábado",
GROUP_CONCAT((SELECT Horarios.HoraInicio || " - " || Horarios.HoraFim WHERE Horarios.DiaSemana = "Domingo"), ", ") AS "Horarios Domingo"
FROM Pessoas JOIN HorariosTrabalho ON HorariosTrabalho.IDfuncionario = Pessoas.ID
JOIN Horarios ON HorariosTrabalho.IDhorario = Horarios.IDhorario
GROUP BY Pessoas.Nome