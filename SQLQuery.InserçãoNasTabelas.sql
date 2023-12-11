use smningatreinamentogrupo2

---------------------------------------
--INSERÇÃO DE DADOS EM EMPRESA
---------------------------------------
INSERT INTO Empresa (NomeEmpresa, Cnpj) VALUES 
('SMN', 09557239000131)

---------------------------------------
--INSERÇÃO DE DADOS EM POLO EMPRESA
---------------------------------------
INSERT INTO PoloEmpresa (NomeDoPolo, IdEmpresa) VALUES 
('Ingá', 1),
('Passos', 1),
('Franca', 1), 
('João Pessoa', 1)

---------------------------------------
--INSERÇÃO DE DADOS EM CARGO
---------------------------------------
INSERT INTO Cargo (NomeCargo) VALUES 
('Analista de Negócios'),
('Desenvolvedor'),
('Analista de Dados')

---------------------------------------
--INSERÇÃO DE DADOS EM ESTADO
---------------------------------------
INSERT INTO Estado (NomeEstado, UfEstado) VALUES
('Paraíba', 'PB'),
('Rio de Janeiro', 'RJ'),
('São Paulo', 'SP'), 
('Santa Catarina', 'SC')

---------------------------------------
--INSERÇÃO DE DADOS EM CIDADE
---------------------------------------
INSERT INTO CidadeColaborador (NomeCidade, IdEstado) VALUES 
('Ingá', 1), 
('Rio de Janeiro', 2),
('João Pessoa', 1),
('Franca', 3), 
('Chapecó', 4) 