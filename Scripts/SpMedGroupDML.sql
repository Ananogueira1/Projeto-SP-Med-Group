USE MedicalGroup;
GO

--------------------------------- DML ---------------------------------

INSERT INTO tipoUsuario (tituloTipoUsuario)
VALUES		('Administrador'),('Médico'),('Paciente');
GO

INSERT INTO Usuario (idTipoUsuario, email, senha, nome)
VALUES	(2, 'ricardo.lemos@spmedicalgroup.com.br', 'ricardo123','Ricardo Lemos'),(2, 'roberto.possarle@spmedicalgroup.com.br', 'possarle456','Roberto Possarle'),
(2, 'helena.souza@spmedicalgroup.com.br', 'helena789', 'Helena Strada'),(3, 'ligia@gmail.com', 'ligia123','Ligia'),(3, 'alexandre@gmail.com', 'alexandre456','Alexandre'),
(3, 'fernando@gmail.com', 'fernando789','Fernando'),(3, 'henrique@gmail.com', 'henrique987','Henrique'),(3, 'joao@gmail.com', 'joao654','João'),(3, 'bruno@gmail.com', 'bruno123','Bruno'),
(3, 'mariana@outlook.com', 'mariana987','Mariana'),(1, 'adm@spmedicalgroup.com.br', 'adm4545','Adiministração');
GO


INSERT INTO Especialidade (tipoEspecialidade)
VALUES	('Acupuntura'),('Anestesiologia'),('Angiologia'),('Cardiologia'),('Cirurgia Cardiovascular'),('Cirurgia de Mão'),
('Cirurgia do Aparelho Digestivo'),('Cirurgia Geral'),('Cirurgia Pediátrica'),('Cirurgia Plástica'),('Cirurgia Torácica'),
('Cirurgia Vascular'),('Dermatologia'),('Radioterapia'),('Urologia'),('Pediatria'),('Psiquiatria');
GO

INSERT INTO clinica  (nomeFantasia, CNPJ, razaoSocial, endereco)
VALUES		('Clinica Possarle ','86400902000130', 'SP Médical Group', 'Av. Barão Limeira, 532, São Paulo, SP');
GO
 select * from clinica

INSERT INTO medico  (idClinica, idEspecialidade, idUsuario, nomeMedico, crm)
VALUES	(1, 2, 1,'Ricardo Lemos','54356-SP'),(1, 17, 1, 'Roberto Possarle' ,'53852-SP') ,(1, 16, 1, 'Helena Strada' ,'65463-SP');
GO

select * from Medico



INSERT INTO Paciente (idUsuario, nomePaciente, RG, CPF, endereco, dataNascimento, Telefone)
VALUES	(4, 'Ligia', '435225435','94839859000', 'Rua Estado de Israel 240, São Paulo, Estado de São Paulo, 04022-000', '03/10/1983', '1134567654'),
(5, 'Alexandre', '326543457','73556944057', 'Av. Paulista, 1578 - Bela Vista, São Paulo - SP, 01310-200', '03/07/2001', '11987656543'),
(6, 'Fernando', '546365253','16839338002', 'Av. Ibirapuera - Indianópolis, 2927,  São Paulo - SP, 04029-200', '10/10/1978', '11972084453'),
(7, 'Henrique', '543663625','14332654765', 'R. Vitória, 120 - Vila Sao Jorge, Barueri - SP, 06402-030', '13/10/1985', '1134566543'),
(8, 'João', '325444441','91305348010', 'R. Ver. Geraldo de Camargo, 66 - Santa Luzia, Ribeirão Pires - SP, 09405-380', '27/08/1975', '1176566377'),
(9, 'Bruno', '545662667','79799299004', 'Alameda dos Arapanés, 945 - Indianópolis, São Paulo - SP, 04524-001', '21/03/1972', '11954368769'),
(10, 'Mariana','545662668','13771913039', 'R Sao Antonio, 232 - Vila Universal, Barueri - SP, 06407-140', '05/03/2018', NULL)
;
GO

INSERT INTO situacao  (situacao)
VALUES	('Realizada'),('Cancelada'),('Agendada');
GO

select *from paciente


INSERT INTO Consulta (idPaciente, idMedico, idSituacao, dataConsulta, descricao)
VALUES (4, 1, 1, '20/04/2020', 'Dores abdominais '),(5, 2, 2, '01/06/2021', 'Diz que esta com vontade de tirar a propria vida'),
(6, 3, 1, '02/07/2021', 'Paciente completamente triste'),(7, 2, 1, '02/06/2018', 'Esta com depressão profunda'),
(8, 2, 2, '02/07/2021', ''),(9, 3, 3, '03/08/2020', 'Machucou a cabeça'),(10, 1, 3, '09/03/2020', 'Dor de Cabeça');
GO

select *from Consulta

select *from  Medico