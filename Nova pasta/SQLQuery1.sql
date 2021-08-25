USE MedicalGroup;
GO


SELECT *FROM tipoUsuario
SELECT *FROM usuario
SELECT *FROM clinica 
SELECT *FROM medico
SELECT *FROM paciente 
SELECT *FROM situacao 
SELECT *FROM consulta 

SELECT COUNT (idUsuario) FROM usuario

SELECT nomePaciente, CONVERT(VARCHAR(20),dataNascimento,105) as 'data de nascimento' FROM paciente


SELECT nomeUsuario, 'nomePaciente', email