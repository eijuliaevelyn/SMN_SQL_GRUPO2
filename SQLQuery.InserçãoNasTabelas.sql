use smningatreinamentogrupo2

---------------------------------------
--INSER��O DE DADOS EM EMPRESA
---------------------------------------
INSERT INTO Empresa (NomeEmpresa, Cnpj) VALUES 
('SMN', 09557239000131)

---------------------------------------
--INSER��O DE DADOS EM POLO EMPRESA
---------------------------------------
INSERT INTO PoloEmpresa (NomeDoPolo, IdEmpresa) VALUES 
('Ing�', 1),
('Passos', 1),
('Franca', 1), 
('Jo�o Pessoa', 1)

---------------------------------------
--INSER��O DE DADOS EM CARGO
---------------------------------------
INSERT INTO Cargo (NomeCargo) VALUES 
('Analista de Neg�cios'),
('Desenvolvedor'),
('Analista de Dados')

---------------------------------------
--INSER��O DE DADOS EM ESTADO
---------------------------------------
INSERT INTO Estado (NomeEstado, UfEstado) VALUES
('Para�ba', 'PB'),
('Rio de Janeiro', 'RJ'),
('S�o Paulo', 'SP'), 
('Santa Catarina', 'SC')

---------------------------------------
--INSER��O DE DADOS EM CIDADE
---------------------------------------
INSERT INTO CidadeColaborador (NomeCidade, IdEstado) VALUES 
('Ing�', 1), 
('Rio de Janeiro', 2),
('Jo�o Pessoa', 1),
('Franca', 3), 
('Chapec�', 4) 