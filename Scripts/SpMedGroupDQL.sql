USE MedicalGroup;
GO

--------------------------------- DQL ---------------------------------


SELECT P.nomePaciente Paciente,
       M.nomeMedico Médico,
	   E.tipoEspecialidade Especializacao,
	   convert(varchar(20),C.dataConsulta,110) [Dia da Consulta],
	   S.situacao situacao,
	   c.descricao [Descrição da consulta]
FROM consulta C
INNER JOIN paciente P ON P.idPaciente = C.idPaciente
INNER JOIN medico M ON M.idMedico = C.idMedico
INNER JOIN Especialidade E ON M.idEspecialidade = E.tipoEspecialidade
INNER JOIN situacao S ON C.idSituacao = S.idSituacao


--> Usando function

CREATE FUNCTION MedpEspecialidade(@idEspecialidade VARCHAR(90))
RETURNS TABLE
AS
RETURN(
	SELECT @idEspecialidade AS ESPECIALIDADES, COUNT(tipoEspecialidade) [Numero De Medicos] FROM Especialidade
	WHERE tipoEspecialidade LIKE '%' + @idEspecialidade + '%'
)
GO

SELECT * FROM MedpEspecialidade('Pediatria');
GO


-- calculo de idade
CREATE PROCEDURE idadePaciente
@idade VARCHAR (20)
AS
BEGIN 
	
	SELECT nomePaciente, DATEDIFF(YEAR, dataNascimento, GETDATE())  AS Idade FROM PACIENTE
	where nomePaciente = @idade
		
END
GO

exec idadePaciente 'Mariana'
GO

--quantidade de usuarios
SELECT COUNT(idUsuario) QuantidadeUsuario FROM USUARIO
GO