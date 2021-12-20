USE MedicalGroup;
GO

--------------------------------- DML ---------------------------------

INSERT INTO tipoUsuario (tituloTipoUsuario)
VALUES		('Administrador'),('M�dico'),('Paciente');
GO

INSERT INTO Usuario (idTipoUsuario, email, senha, nome)
VALUES	(2, 'ricardo.lemos@spmedicalgroup.com.br', 'ricardo123','Ricardo Lemos'),(2, 'roberto.possarle@spmedicalgroup.com.br', 'possarle456','Roberto Possarle'),
(2, 'helena.souza@spmedicalgroup.com.br', 'helena789', 'Helena Strada'),(3, 'ligia@gmail.com', 'ligia123','Ligia'),(3, 'alexandre@gmail.com', 'alexandre456','Alexandre'),
(3, 'fernando@gmail.com', 'fernando789','Fernando'),(3, 'henrique@gmail.com', 'henrique987','Henrique'),(3, 'joao@gmail.com', 'joao654','Jo�o'),(3, 'bruno@gmail.com', 'bruno123','Bruno'),
(3, 'mariana@outlook.com', 'mariana987','Mariana'),(1, 'adm@spmedicalgroup.com.br', 'adm4545','Adiministra��o');
GO


INSERT INTO Especialidade (tipoEspecialidade)
VALUES	('Acupuntura'),('Anestesiologia'),('Angiologia'),('Cardiologia'),('Cirurgia Cardiovascular'),('Cirurgia de M�o'),
('Cirurgia do Aparelho Digestivo'),('Cirurgia Geral'),('Cirurgia Pedi�trica'),('Cirurgia Pl�stica'),('Cirurgia Tor�cica'),
('Cirurgia Vascular'),('Dermatologia'),('Radioterapia'),('Urologia'),('Pediatria'),('Psiquiatria');
GO

INSERT INTO clinica  (nomeFantasia, CNPJ, razaoSocial, endereco)
VALUES		('Clinica Possarle ','86400902000130', 'SP M�dical Group', 'Av. Bar�o Limeira, 532, S�o Paulo, SP');
GO
 select * from clinica

INSERT INTO medico  (idClinica, idEspecialidade, idUsuario, nomeMedico, crm)
VALUES	(1, 2, 1,'Ricardo Lemos','54356-SP'),(1, 17, 1, 'Roberto Possarle' ,'53852-SP') ,(1, 16, 1, 'Helena Strada' ,'65463-SP');
GO

select * from Medico



INSERT INTO Paciente (idUsuario, nomePaciente, RG, CPF, endereco, dataNascimento, Telefone)
VALUES	(4, 'Ligia', '435225435','94839859000', 'Rua Estado de Israel 240, S�o Paulo, Estado de S�o Paulo, 04022-000', '03/10/1983', '1134567654'),
(5, 'Alexandre', '326543457','73556944057', 'Av. Paulista, 1578 - Bela Vista, S�o Paulo - SP, 01310-200', '03/07/2001', '11987656543'),
(6, 'Fernando', '546365253','16839338002', 'Av. Ibirapuera - Indian�polis, 2927,  S�o Paulo - SP, 04029-200', '10/10/1978', '11972084453'),
(7, 'Henrique', '543663625','14332654765', 'R. Vit�ria, 120 - Vila Sao Jorge, Barueri - SP, 06402-030', '13/10/1985', '1134566543'),
(8, 'Jo�o', '325444441','91305348010', 'R. Ver. Geraldo de Camargo, 66 - Santa Luzia, Ribeir�o Pires - SP, 09405-380', '27/08/1975', '1176566377'),
(9, 'Bruno', '545662667','79799299004', 'Alameda dos Arapan�s, 945 - Indian�polis, S�o Paulo - SP, 04524-001', '21/03/1972', '11954368769'),
(10, 'Mariana','545662668','13771913039', 'R Sao Antonio, 232 - Vila Universal, Barueri - SP, 06407-140', '05/03/2018', NULL)
;
GO

INSERT INTO situacao  (situacao)
VALUES	('Realizada'),('Cancelada'),('Agendada');
GO

select *from paciente


INSERT INTO Consulta (idPaciente, idMedico, idSituacao, dataConsulta, descricao)
VALUES (4, 1, 1, '20/04/2020', 'Dores abdominais '),(5, 2, 2, '01/06/2021', 'Diz que esta com vontade de tirar a propria vida'),
(6, 3, 1, '02/07/2021', 'Paciente completamente triste'),(7, 2, 1, '02/06/2018', 'Esta com depress�o profunda'),
(8, 2, 2, '02/07/2021', ''),(9, 3, 3, '03/08/2020', 'Machucou a cabe�a'),(10, 1, 3, '09/03/2020', 'Dor de Cabe�a');
GO

select *from Consulta

select *from  Medico