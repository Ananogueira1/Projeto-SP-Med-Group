INSERT INTO tipoUsuario (tituloTipoUsuario)
VALUES ('Administrador'), ('Medico'), ('Paciente');
GO

INSERT INTO usuario (idTipoUsuario, email, senha)
VALUES (2, 'ligia@gmail.com', 'ligia123', 3, 'alexandre@gmail.com', 'alexandre223', 1, 'fernando@gmail.com', 'fernando323',
2, 'henrique@gmail.com', 'henrique423', 1, 'joao@hotmail.com', 'joao523', 3, ' bruno@gmail.com', 'bruno623', 3, 'mariana@outlook.com', 'mariana723',
1, 'ricardo.lemos@spmedicalgroup.com.br', 'ricardo123', 1, 'roberto.possarle@spmedicalgroup.com.br', 'roberto123', 1, 'helena.souza@spmedicalgroup.com.br', 'helena123',
1, 'adm@adm.com', 'adm132')
GO

INSERT INTO clinica (nomeFantasia, CNPJ, razaoSocial, endereco)
VALUES ('Clinica Possarle', '86.400.902/0001-30', 'Sp Medical Group', 'Av. Barão Limeira,535, São Paulo, Sp')
GO

INSERT INTO especializacao (idEspecializacao)
VALUES ('Acupuntura', 'Anestesiologia', 'Angiologia', 'Cardiologia', 'Cirurgia Cardiovascular', 'Cirurgia da Mão', 'Cirurgia do Aparelho Digestivo', 'Cirurgia Geral',
'Cirurgia Pediátrica', 'Cirurgia Plástica', 'Cirurgia Torácica', 'Cirurgia Vascular', 'Dermatologia', 'Radioterapia', 'Urologia', 'Pediatria', 'Psiquiatria')
GO


INSERT INTO medico (idClinica, idEspecializacao)