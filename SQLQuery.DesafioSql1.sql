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
	IdEmpresa TINYINT,
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