USE smningatreinamentogrupo2

-----------------------------------
--CRIA플O DA TABELA EMPRESA
-----------------------------------
CREATE TABLE Empresa(
	Id TINYINT PRIMARY KEY IDENTITY, 
	NomeEmpresa VARCHAR (50) NOT NULL,
	Cnpj BIGINT NOT NULL 
);

-----------------------------------
--CRIA플O DA TABELA POLO EMPRESA
-----------------------------------
CREATE TABLE PoloEmpresa(
	Id TINYINT PRIMARY KEY IDENTITY,
	IdEmpresa TINYINT NOT NULL,
	NomeDoPolo VARCHAR (60) NOT NULL,
	FOREIGN KEY (IdEmpresa) REFERENCES Empresa (Id) 
);

-----------------------------------
--CRIA플O DA TABELA CARGO
-----------------------------------
CREATE TABLE Cargo(
	Id TINYINT PRIMARY KEY IDENTITY, 
	NomeCargo VARCHAR (50) NOT NULL
); 

-----------------------------------
--CRIA플O DA TABELA ESTADO
-----------------------------------
CREATE TABLE Estado(
	Id SMALLINT PRIMARY KEY IDENTITY, 
	NomeEstado VARCHAR (60) NOT NULL,
	UfEstado CHAR (2) NOT NULL
);

------------------------------------
--CRIA플O DA TABELA CIDADE
------------------------------------
CREATE TABLE CidadeColaborador (
	Id SMALLINT PRIMARY KEY IDENTITY,
	IdEstado SMALLINT NOT NULL,
	NomeCidade VARCHAR(60) NOT NULL,
	FOREIGN KEY (IdEstado) REFERENCES Estado(Id) 
);

------------------------------------
--CRIA플O DA TABELA COLABORADOR
------------------------------------
CREATE TABLE Colaborador (
	Id SMALLINT PRIMARY KEY IDENTITY,
	IdEmpresa TINYINT NOT NULL,
	IdCargo TINYINT NOT NULL,
	IdCidadeColaborador SMALLINT NOT NULL,
	NomeColaborador VARCHAR(120) NOT NULL,
	DataNascimento DATE NOT NULL,
	DataAdmissao DATE NOT NULL,
	DataDemissao DATE,
	FOREIGN KEY (IdEmpresa) REFERENCES Empresa(Id),
	FOREIGN KEY (IdCargo) REFERENCES Cargo(Id),
	FOREIGN KEY (IdCidadeColaborador) REFERENCES CidadeColaborador(Id) 
);

---------------------------------------
--CRIA플O DA TABELA CONTATO COLABORADOR
---------------------------------------
CREATE TABLE ContatoColaborador (
	IdContatoColaborador SMALLINT PRIMARY KEY IDENTITY,
	IdColaborador SMALLINT NOT NULL,
	DDD TINYINT NOT NULL,
	Numero INT NOT NULL,
	Whatsapp BIT NOT NULL,
	Email VARCHAR(150) NOT NULL
	FOREIGN KEY (IdColaborador) REFERENCES Colaborador(Id)
);