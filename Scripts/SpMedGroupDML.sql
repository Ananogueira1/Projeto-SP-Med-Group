USE MedicalGroup;
GO

INSERT INTO tipoUsuario (tituloTipoUsuario)
VALUES ('Administrador'), ('Medico'), ('Paciente');
GO
SELECT *FROM USUARIO

INSERT INTO usuario (idTipoUsuario, email, senha, nome)
VALUES (2, 'ligia@gmail.com', 'ligia123', 'Ligia'), (3, 'alexandre@gmail.com', 'alexandre223', 'Alexandre'), (1, 'fernando@gmail.com', 'fernando323', 'Fernando'),
(2, 'henrique@gmail.com', 'henrique423', 'Henrique'), (1,'joao@hotmail.com', 'joao523', 'João'), (3, ' bruno@gmail.com', 'bruno623', 'Bruno'), (3, 'mariana@outlook.com', 'mariana723', 'Mariana'),
(1, 'ricardo.lemos@spmedicalgroup.com.br', 'ricardo123', 'Ricardo'), (1, 'roberto.possarle@spmedicalgroup.com.br', 'roberto123', 'Roberto'), (1, 'helena.souza@spmedicalgroup.com.br', 'helena123', 'Helena'),
(1, 'adm@adm.com', 'adm132', 'adm')
GO

INSERT INTO clinica (nomeFantasia, CNPJ, razaoSocial, endereco)
VALUES ('Clinica Possarle', '86.400.902/0001-30', 'Sp Medical Group', 'Av. Barão Limeira,535, São Paulo, Sp')
GO

SELECT *FROM clinica

INSERT INTO especializacao (tipoEspecialidade)
VALUES ('Acupuntura'), ('Anestesiologia'), ('Angiologia'), ('Cardiologia'), ('Cirurgia Cardiovascular'), ('Cirurgia da Mão'), ('Cirurgia do Aparelho Digestivo'), ('Cirurgia Geral'),
('Cirurgia Pediátrica'), ('Cirurgia Plástica'), ('Cirurgia Torácica'), ('Cirurgia Vascular'), ('Dermatologia'), ('Radioterapia'), ('Urologia'), ('Pediatria'), ('Psiquiatria')
GO


INSERT INTO medico (idClinica, idEspecializacao, idUsuario, nomeMedico, crm)
VALUES (1, 2, 8, 'Ricardo Lemos', '54356-SP'), (1, 17, 9, 'Roberto Possarle', '53452-sp'), (1, 16, 10, 'Helena Strada', '65463-sp')
GO

SELECT *FROM MEDICO

DROP TABLE paciente 

INSERT INTO paciente (idUsuario, nomePaciente, dataNascimento, telefone, rg, cpf, endereco)
VALUES (2, 'Ligia', '13-10-1983', '(11) 3456-7654', '435.22543-5-', '94839859000', 'Rua Estado de Israel 240, São Paulo, Estado de São Paulo, 04022-000')
,(3, 'Alexandre', '10-10-1978', '(11) 97208-4453', '32654345-7', '73556944057', 'Av. Paulista, 1578 - Bela Vista, São Paulo - SP, 01310-200')
,(4, 'Fernando', '23-03-2002', '(11) 9554-8879', '54636525-3', '16839338002', 'Av. Ibirapuera - Indianópolis, 2927,  São Paulo - SP, 04029-200')
,(5, 'Henrique', '13-10-1985', '(11) 3456-6543', '54366362-5', '14332654765', 'R. Vitória, 120 - Vila Sao Jorge, Barueri - SP, 06402-030')
,(6, 'João', '27-08-1975', '(11) 7656-6377', '53254444-1', '91305348010', 'R. Ver. Geraldo de Camargo, 66 - Santa Luzia, Ribeirão Pires - SP, 09405-380')
,(7, 'Bruno', '21-03-1972', '3/21-1972', '54566266-7', '79799299004', 'Alameda dos Arapanés, 945 - Indianópolis, São Paulo - SP, 04524-001')
,(8, 'Mariana', '03-05-2018', 'Nao tem', '54566266-8', '13771913039', 'R Sao Antonio, 232 - Vila Universal, Barueri - SP, 06407-140' )
GO

INSERT  INTO situacao (situacao)
VALUES ('Realizada'), ('Cancelada'), ('Agendada')
GO

INSERT INTO consulta(idPaciente, idMedico, idSituacao, dataConsulta, descricao)
VALUES (1, 3, 1, '20-01-2020  15:00:00', 'estado normal'), (2, 2, 2, '01-06-2020  10:00:00', 'estado grave'),
(3, 2, 1, '07-02-2020  11:00:00', 'estado normal'), (4, 2, 1, '06-02-2018  10:00:00', 'estado normal'), (5, 1,2, '07-02-2019  11:00:00', 'estado grave'), 
(6, 3, 3, '08-03-2020  15:00:00', 'ultra grave'), (7, 1, 3, '09-03-2020  11:00:00', 'estado normal');
GO

SELECT *FROM paciente


SELECT *FROM paciente