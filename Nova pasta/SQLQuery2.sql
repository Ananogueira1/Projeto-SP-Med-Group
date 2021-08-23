CREATE DATABASE MedicalGroup
GO

USE MedicalGroup 
GO 

CREATE TABLE tipoUsuario(
  idTipoUsuario INT PRIMARY KEY IDENTITY,
  tituloTipoUsuario VARCHAR (50)NOT NULL
);
GO

CREATE TABLE usuario(
 idUsuario INT PRIMARY KEY IDENTITY,
 idTipoUsuario INT FOREIGN KEY REFERENCES  TIPOUSUARIO (idTipoUsuario),
 email VARCHAR(90) NOT NULL UNIQUE,
 senha VARCHAR (45)NOT NULL UNIQUE,
 nome VARCHAR (45)NOT NULL UNIQUE 
 );
 GO

  CREATE TABLE clinica(
  idClinica INT PRIMARY KEY IDENTITY,
  nomeFantasia VARCHAR (50) UNIQUE NOT NULL, 
  CNPJ VARCHAR (50) UNIQUE NOT NULL,
  razaoSocial VARCHAR (200) UNIQUE NOT NULL,
  endereco VARCHAR (150) UNIQUE NOT NULL
  );
  GO

 CREATE TABLE especializacao(
	idEspecializacao INT PRIMARY KEY IDENTITY,
	tipoEspecialidade VARCHAR(90) UNIQUE NOT NULL,
 );
 GO

 CREATE TABLE medico(
  idMedico INT PRIMARY KEY IDENTITY,
  idClinica INT FOREIGN KEY REFERENCES CLINICA (idClinica),
  idUsuario INT FOREIGN KEY REFERENCES USUARIO (idUsuario),
  idEspecializacao INT FOREIGN KEY REFERENCES ESPECIALIZACAO (idEspecializacao),
 );
 GO

 CREATE  TABLE paciente(
 idPaciente INT  PRIMARY KEY IDENTITY,
 idUsuario INT FOREIGN KEY REFERENCES USUARIO (idUsuario),
 nomePaciente VARCHAR (50) UNIQUE NOT NULL,
 dataNascimento VARCHAR (25) NOT NULL,
 telefone VARCHAR (20) UNIQUE NOT NULL,
 rg VARCHAR (20) UNIQUE NOT NULL,
 cpf VARCHAR (20) UNIQUE NOT NULL,
 endereco VARCHAR (150) NOT NULL
 );
 GO

 SELECT *FROM usuario

 CREATE TABLE situacao(
 idSituacao INT PRIMARY KEY IDENTITY, 
 situacao VARCHAR (80) NOT NULL,
 dataConsulta DATE NOT NULL, 
 descricao VARCHAR (600) DEFAULT ('N�o tem descri��o de sintomas')
 );
 GO

 CREATE TABLE consulta(
 idConsulta INT PRIMARY KEY IDENTITY,
 idPaciente INT FOREIGN KEY REFERENCES PACIENTE (idPaciente),
 idMedico INT FOREIGN KEY REFERENCES MEDICO (idMedico),
 idSituacao INT FOREIGN KEY REFERENCES SITUACAO (idSituacao)
 );
 GO