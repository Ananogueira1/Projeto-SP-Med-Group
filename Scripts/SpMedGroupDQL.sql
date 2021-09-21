USE MedicalGroup;
GO


SELECT *FROM tipoUsuario
SELECT *FROM usuario
SELECT *FROM clinica 
SELECT *FROM medico
SELECT *FROM paciente 
SELECT *FROM situacao 
SELECT *FROM consulta 
SELECT *FROM especializacao


SELECT P.nomePaciente Paciente,
       M.nomeMedico Médico,
	   E.idEspecializacao Especializacao,
	   convert(varchar(20),C.dataConsulta,110) [Dia da Consulta],
	   S.situacao situacao,
	   c.descricao [Descrição da consulta]
FROM consulta C
INNER JOIN paciente P ON P.idPaciente = C.idPaciente
INNER JOIN medico M ON M.idMedico = C.idMedico
INNER JOIN especializacao E ON M.idEspecializacao = E.idEspecializacao
INNER JOIN situacao S ON C.idSituacao = S.idSituacao


--> Usando function

CREATE FUNCTION MedpEspecialidade(@tipoEspecializacao VARCHAR(90))
RETURNS TABLE
AS
RETURN(
	SELECT @tipoEspecializacao AS ESPECIALIDADES, COUNT(idEspecializacao) [Numero De Medicos] FROM especializacao
	WHERE tipoEspecialidade LIKE '%' + @tipoEspecializacao + '%'
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