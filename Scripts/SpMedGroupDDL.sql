CREATE DATABASE MedicalGroup
GO

USE MedicalGroup 
GO 

CREATE TABLE tipoUsuario
(
	idTipoUsuario INT PRIMARY KEY IDENTITY,
	tituloTipoUsuario VARCHAR(50) NOT NULL
);
GO --Tabela Criada

CREATE TABLE Especialidade
(
		idEspecialidade INT PRIMARY KEY IDENTITY,
		tipoEspecialidade VARCHAR (90) UNIQUE NOT NULL
);
GO --Tabela Criada

--DROP TABLE Usuario;

CREATE TABLE Usuario
(
		idUsuario INT PRIMARY KEY IDENTITY,
		idTipoUsuario INT FOREIGN KEY REFERENCES tipoUsuario(idTipoUsuario),
		email VARCHAR (90) UNIQUE NOT NULL,
		senha VARCHAR (45) NOT NULL,
		nome VARCHAR (45)	 NULL
);
GO --Tabela Criada


--DROP TABLE Consulta;
--DROP TABLE Medico;
--DROP TABLE Clinica;


CREATE TABLE Clinica
(
		idClinica INT PRIMARY KEY IDENTITY,
		CNPJ CHAR(50) UNIQUE NOT NULL,
		endereco VARCHAR (150) UNIQUE NOT NULL,
		nomeFantasia VARCHAR (50) UNIQUE NOT NULL,
		RazaoSocial VARCHAR (200) UNIQUE NOT NULL
);
GO --Tabela Criada

--drop table medico

CREATE TABLE Medico
(
		idMedico INT PRIMARY KEY IDENTITY,
		idUsuario INT FOREIGN KEY REFERENCES Usuario (idUsuario),
		idEspecialidade INT FOREIGN KEY REFERENCES Especialidade (idEspecialidade),
		idClinica INT FOREIGN KEY REFERENCES Clinica (idClinica),
		nomeMedico VARCHAR (50) NOT NULL,
		crm VARCHAR (40) UNIQUE NOT NULL
);
GO --Tabela Criada

--drop table Paciente

CREATE TABLE Paciente
(
		idPaciente INT PRIMARY KEY IDENTITY,
		idUsuario INT FOREIGN KEY REFERENCES Usuario(idUsuario),
		nomePaciente VARCHAR(50) NOT NULL,
		rg CHAR(20) UNIQUE NOT NULL,
		cpf CHAR (20) UNIQUE NOT NULL,
		endereco VARCHAR (150) UNIQUE NOT NULL,
		dataNascimento DATETIME NOT NULL,
		telefone VARCHAR(20),	
)
GO--Tabela Criada

--SELECT * FROM Paciente

CREATE TABLE Situacao
(
		idSituacao INT PRIMARY KEY IDENTITY,
		Situacao VARCHAR (80) NOT NULL
);
GO--Tabela Criada
--drop table consulta

CREATE TABLE Consulta
(
	idConsulta INT PRIMARY KEY IDENTITY,
	idMedico INT FOREIGN KEY REFERENCES Medico(idMedico),
	idPaciente INT FOREIGN KEY REFERENCES Paciente(idPaciente),
	idSituacao INT FOREIGN KEY REFERENCES Situacao(idSituacao),
	dataConsulta DATE NOT NULL,
	descricao VARCHAR (100) default ('Não apresenta uma descrição dos sintomas')
);
GO--Tabela Criada

 ---Criou um evento para que a idade do usuário seja calculada todos os dias
ALTER TABLE paciente
ADD idadePaciente TINYINT


CREATE PROCEDURE SP_IDADE_PACIENTE
AS
BEGIN

UPDATE paciente SET idadePaciente = DATEDIFF(YEAR,dataNascimento,GETDATE())

END 

EXEC SP_IDADE_PACIENTE

SELECT * FROM paciente