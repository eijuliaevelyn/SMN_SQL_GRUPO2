---------------------------------------
--PROCEDURE DE INSERÇÃO EM COLABORADOR
---------------------------------------
CREATE PROC SP_InsEmColaborador( 
		@NomeColaborador VARCHAR (120),
		@DataNascimento DATE,
		@DataAdmissao DATE,
		@DataDemissao DATE = NULL,
		@IdPoloEmpresa TINYINT,
		@IdCargo TINYINT,
		@IdCidadeColaborador SMALLINT,
		@DDD TINYINT,
		@Numero INT,
		@Whatsapp BIT,
		@Email VARCHAR (150),
		@IdColaborador SMALLINT
		)

		AS
		/* 
		DOCUMENTAÇÃO
		ARQUIVO FONTE....: SP_SP_InsEmColaborador.sql
		OBJETIVO.........: INSERIR DADOS NA TABELA COLABORADOR.
		AUTOR............: SMN - JÚLIA EVELYN
		DATA.............: 11/12/2023
		EX...............: EXEC [dbo].[SP_InsEmColaborador]  @NomeColaborador = 'Ricardo Vieira', @DataNascimento = '19890915', @DataAdmissao = '20120407', @DataDemissao = NULL, 
		                   @IdPoloEmpresa = 2, @IdCargo = 3, @IdCidadeColaborador = 4, @DDD = 16, @Numero = 997845223, @Whatsapp = 0, @Email = 'ricardo.smn@gmail.com', @IdColaborador = 9
	                       SELECT * FROM COLABORADOR 
						   SELECT * FROM CONTATOCOLABORADOR
		*/
		BEGIN 
			INSERT INTO Colaborador (NomeColaborador, DataNascimento, DataAdmissao, DataDemissao, IdPoloEmpresa, IdCargo, IdCidadeColaborador) 
				VALUES (@NomeColaborador, @DataNascimento, @DataAdmissao, @DataDemissao, @IdPoloEmpresa, @IdCargo, @IdCidadeColaborador) 
			INSERT INTO ContatoColaborador (DDD, Numero, Whatsapp, Email, IdColaborador)
				VALUES (@DDD, @Numero, @Whatsapp, @Email, @IdColaborador) 
		END 
	GO 

---------------------------------------
--ATUALIZANDO DADOS DA TABELA EMPRESA
---------------------------------------

CREATE PROC [dbo].[SP_UpdEmpresa] (
	@Id INT,
	@NomeEmpresa VARCHAR(50) = NULL,
	@Cnpj BIGINT = NULL
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....: SQLQuery.CriaçãodeProcUpdate.sql
		OBJETIVO.........: ATUALIZANDO  DADOS NA TABELA EMPRESA
		AUTOR............: SMN - João Emanoel de Araújo Heenriques Oliveria
		DATA.............: 11/12/2023
		EX...............: EXEC [dbo].[SP_UpdEmpresa] @Id = 1, @NomeEmpresa = 'SMN', @Cnpj = 09557239000131
						   SELECT * FROM Empresa
	*/

	BEGIN
		UPDATE Empresa 
		SET	NomeEmpresa = @NomeEmpresa,
			Cnpj = @Cnpj
		WHERE Id = @Id

	END
GO

--------------------------------------------
--ATUALIZANDO DADOS DA TABELA POLO EMPRESA
--------------------------------------------

CREATE PROC [dbo].[SP_UpdPoloEmpresa] (
	@Id TINYINT,
	@IdEmpresa TINYINT = NULL,
	@NomeDoPolo VARCHAR(60) = NULL
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....: SQLQuery.CriaçãodeProcUpdate.sql
		OBJETIVO.........: ATUALIZANDO  DADOS NA TABELA POLO EMPRESA
		AUTOR............: SMN - João Emanoel de Araújo Heenriques Oliveria
		DATA.............: 11/12/2023
		EX...............: EXEC [dbo].[SP_UpdPoloEmpresa] @Id = 1, @IdEmpresa = 1, @NomeDoPolo = 'Ingá'
						   SELECT * FROM PoloEmpresa
	*/

	BEGIN
		UPDATE PoloEmpresa 
		SET	IdEmpresa = @IdEmpresa,
			NomeDoPolo = @NomeDoPolo
		WHERE Id = @Id

	END
GO

-------------------------------------
--ATUALIZANDO DADOS DA TABELA CARGO
-------------------------------------

CREATE PROC [dbo].[SP_UpdCargo] (
	@Id TINYINT,
	@NomeCargo VARCHAR(50) = NULL
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....: SQLQuery.CriaçãodeProcUpdate.sql
		OBJETIVO.........: ATUALIZANDO  DADOS NA TABELA CARGO
		AUTOR............: SMN - João Emanoel de Araújo Heenriques Oliveria
		DATA.............: 11/12/2023
		EX...............: EXEC [dbo].[SP_UpdCargo] @Id = 1, @NomeCargo = 'Analista de Negócios'
						   SELECT * FROM Cargo
	*/

	BEGIN
		UPDATE Cargo 
		SET	NomeCargo = @NomeCargo
		WHERE Id = @Id

	END
GO

--------------------------------------
--ATUALIZANDO DADOS DA TABELA ESTADO
--------------------------------------

CREATE PROC [dbo].[SP_UpdEstado] (
	@Id SMALLINT,
	@NomeEstado VARCHAR(60) = NULL,
	@UfEstado CHAR(2) = NULL
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....: SQLQuery.CriaçãodeProcUpdate.sql
		OBJETIVO.........: ATUALIZANDO  DADOS NA TABELA ESTADO
		AUTOR............: SMN - João Emanoel de Araújo Heenriques Oliveria
		DATA.............: 11/12/2023
		EX...............: EXEC [dbo].[SP_UpdEstado] @Id = 1, @NomeEstado = 'Paraíba', @UfEstado = 'PB'
						   SELECT * FROM Estado
	*/

	BEGIN
		UPDATE Estado 
		SET	NomeEstado = @NomeEstado,
			UfEstado = @UfEstado
		WHERE Id = @Id

	END
GO

--------------------------------------------------
--ATUALIZANDO DADOS DA TABELA CIDADE COLABORADOR
--------------------------------------------------

CREATE PROC [dbo].[SP_UpdCidadeColaborador] (
	@Id SMALLINT,
	@IdEstado SMALLINT = NULL,
	@NomeCidade VARCHAR(60) = NULL
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....: SQLQuery.CriaçãodeProcUpdate.sql
		OBJETIVO.........: ATUALIZANDO  DADOS NA TABELA CIDADE COLABORADOR
		AUTOR............: SMN - João Emanoel de Araújo Heenriques Oliveria
		DATA.............: 11/12/2023
		EX...............: EXEC [dbo].[SP_UpdCidadeColaborador] @Id = 1, @IdEstado = 1 , @NomeCidade = 'Ingá'
						   SELECT * FROM CidadeColaborador
	*/

	BEGIN
		UPDATE CidadeColaborador 
		SET	IdEstado = @IdEstado,
			NomeCidade = @NomeCidade
		WHERE Id = @Id

	END
GO

-------------------------------------------
--ATUALIZANDO DADOS DA TABELA COLABORADOR
-------------------------------------------

CREATE PROC [dbo].[SP_UpdColaborador] (
	@Id SMALLINT,
	@NomeColaborador VARCHAR(120) = NULL,
	@DataNascimento DATE = NULL,
	@DataAdmissao DATE = NULL,
	@DataDemissao DATE = NULL
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....: SQLQuery.CriaçãodeProcUpdate.sql
		OBJETIVO.........: ATUALIZANDO  DADOS NA TABELA COLABORADOR
		AUTOR............: SMN - João Emanoel de Araújo Heenriques Oliveria
		DATA.............: 11/12/2023
		EX...............: EXEC [dbo].[SP_UpdColaborador] @Id = 1, @NomeColaborador = 'Júlia Evelyn',
						   @DataNascimento = '20050421', @DataAdmissao = '20230801', @DataDemissao = NULL
						   SELECT * FROM Colaborador
	*/

	BEGIN

		UPDATE Colaborador 
		SET	NomeColaborador = @NomeColaborador,
			DataNascimento = @DataNascimento,
			DataAdmissao = @DataAdmissao,
			DataDemissao = @DataDemissao
		WHERE Id = @Id

	END
GO

-------------------------------------------------
--ATUALIZANDO DADOS DA TABELA CONTATO COLABORADOR
-------------------------------------------------

CREATE PROC [dbo].[SP_UpdContatoColaborador] (
	@Id SMALLINT,
	@DDD TINYINT = NULL,
	@Numero INT = NULL,
	@Whatsapp BIT = NULL,
	@Email VARCHAR(150) = NULL
	)

	AS

	/*
		DOCUMENTAÇÃO
		ARQUIVO FONTE....: SQLQuery.CriaçãodeProcUpdate.sql
		OBJETIVO.........: ATUALIZANDO  DADOS NA TABELA CIDADE COLABORADOR
		AUTOR............: SMN - João Emanoel de Araújo Heenriques Oliveria
		DATA.............: 11/12/2023
		EX...............: EXEC [dbo].[SP_UpdContatoColaborador] @Id = 1, @DDD = 83, @Numero = 982090355,
						   @Whatsapp = 1, @Email = 'julia.smn@gmail.com'
						   select * from ContatoColaborador
	*/

	BEGIN
		UPDATE ContatoColaborador 
		SET	DDD = @DDD,
			Numero = @Numero,
			Whatsapp = @Whatsapp,
			Email = @Email
		WHERE Id = @Id

	END
GO

---------------------------------------
--DELETANDO DADOS DA TABELA EMPRESA
---------------------------------------


CREATE PROC [dbo].[SP_DelEmpresa] (
	@Id INT = NULL,
	@NomeEmpresa VARCHAR(50) = NULL,
	@Cnpj BIGINT = NULL
	)

	AS

	/*
	DOCUMENTAÇÃO
	ARQUIVO FONTE....: SQLQuery.CriaçãodeProcUpdate.sql
	OBJETIVO.........: DELETANDO DADOS NA TABELA EMPRESA
	AUTOR............: SMN - João Emanoel de Araújo Heenriques Oliveria
	DATA.............: 11/12/2023
	EX...............: EXEC [dbo].[SP_DelEmpresa] @Id = NULL, @NomeEmpresa = 'Spc', @Cnpj = NULL
					   SELECT * FROM Empresa
	*/

	BEGIN

		DELETE FROM Empresa
		WHERE (@Id IS NULL OR Id = @Id) AND
			  (@NomeEmpresa IS NULL OR NomeEmpresa = @NomeEmpresa) AND
			  (@Cnpj IS NULL OR Cnpj = @Cnpj)

	END

GO

---------------------------------------
--DELETANDO DADOS DA TABELA POLO EMPRESA
---------------------------------------


CREATE PROC [dbo].[SP_DelPoloEmpresa] (
	@Id TINYINT = NULL,
	@IdEmpresa TINYINT = NULL,
	@NomeDoPolo VARCHAR(60) = NULL
	)

	AS

	/*
	DOCUMENTAÇÃO
	ARQUIVO FONTE....: SQLQuery.CriaçãodeProcUpdate.sql
	OBJETIVO.........: DELETANDO DADOS NA TABELA POLO EMPRESA
	AUTOR............: SMN - João Emanoel de Araújo Heenriques Oliveria
	DATA.............: 11/12/2023
	EX...............: EXEC [dbo].[SP_DelPoloEmpresa] @Id = 5, @IdEmpresa = NULL, @NomeDoPolo = NULL
					   SELECT * FROM PoloEmpresa
	*/

	BEGIN

		DELETE FROM PoloEmpresa
		WHERE (@Id IS NULL OR Id = @Id) AND
			  (@IdEmpresa IS NULL OR IdEmpresa = @IdEmpresa) AND
			  (@NomeDoPolo IS NULL OR NomeDoPolo = @NomeDoPolo)

	END

GO

---------------------------------------
--DELETANDO DADOS DA TABELA CARGO
---------------------------------------


CREATE PROC [dbo].[SP_DelCargo] (
	@Id TINYINT = NULL,
	@NomeCargo VARCHAR(50) = NULL
	)

	AS

	/*
	DOCUMENTAÇÃO
	ARQUIVO FONTE....: SQLQuery.CriaçãodeProcUpdate.sql
	OBJETIVO.........: DELETANDO DADOS NA TABELA CARGO
	AUTOR............: SMN - João Emanoel de Araújo Heenriques Oliveria
	DATA.............: 11/12/2023
	EX...............: EXEC [dbo].[SP_DelCargo] @Id = NULL, @NomeCargo = 'Pedreiro'
					   SELECT * FROM Cargo
	*/

	BEGIN

		DELETE FROM Cargo
		WHERE (@Id IS NULL OR Id = @Id) AND
			  (@NomeCargo IS NULL OR NomeCargo = @NomeCargo)

	END

GO

---------------------------------------
--DELETANDO DADOS DA TABELA ESTADO
---------------------------------------


CREATE PROC [dbo].[SP_DelEstado] (
	@Id SMALLINT = NULL,
	@NomeEstado VARCHAR(60) = NULL,
	@UfEstado CHAR(2) = NULL
	)

	AS

	/*
	DOCUMENTAÇÃO
	ARQUIVO FONTE....: SQLQuery.CriaçãodeProcUpdate.sql
	OBJETIVO.........: DELETANDO DADOS NA TABELA ESTADO
	AUTOR............: SMN - João Emanoel de Araújo Heenriques Oliveria
	DATA.............: 11/12/2023
	EX...............: EXEC [dbo].[SP_DelEstado] @Id = NULL, @NomeEstado = NULL, @UfEstado = 'ES'
					   SELECT * FROM Estado
	*/

	BEGIN

		DELETE FROM Estado
		WHERE (@Id IS NULL OR Id = @Id) AND
			  (@NomeEstado IS NULL OR NomeEstado = @NomeEstado) AND
			  (@UfEstado IS NULL OR UfEstado = @UfEstado)

	END

GO

----------------------------------------------
--DELETANDO DADOS DA TABELA CIDADE COLABORADOR
----------------------------------------------


CREATE PROC [dbo].[SP_DelCidadeColaborador] (
	@Id SMALLINT = NULL,
	@IdEstado SMALLINT = NULL,
	@NomeCidade VARCHAR(60) = NULL
	)

	AS

	/*
	DOCUMENTAÇÃO
	ARQUIVO FONTE....: SQLQuery.CriaçãodeProcUpdate.sql
	OBJETIVO.........: DELETANDO DADOS NA TABELA ESTADO
	AUTOR............: SMN - João Emanoel de Araújo Heenriques Oliveria
	DATA.............: 11/12/2023
	EX...............: EXEC [dbo].[SP_DelCidadeColaborador] @Id = NULL, @IdEstado = NULL, @NomeCidade = 'Riachão'
					   SELECT * FROM CidadeColaborador
	*/

	BEGIN

		DELETE FROM CidadeColaborador
		WHERE (@Id IS NULL OR Id = @Id) AND
			  (@IdEstado IS NULL OR IdEstado = @IdEstado) AND
			  (@NomeCidade IS NULL OR NomeCidade = @NomeCidade)

	END

GO

---------------------------------------
--DELETANDO DADOS DA TABELA CONTATO COLABORADOR
---------------------------------------


CREATE PROC [dbo].[SP_DelContatoColaborador] (
	@Id SMALLINT,
	@DDD TINYINT = NULL,
	@Numero INT = NULL,
	@Whatsapp BIT = NULL,
	@Email VARCHAR(150) = NULL
	)

	AS

	/*
	DOCUMENTAÇÃO
	ARQUIVO FONTE....: SQLQuery.CriaçãodeProcUpdate.sql
	OBJETIVO.........: DELETANDO DADOS NA TABELA ESTADO
	AUTOR............: SMN - João Emanoel de Araújo Heenriques Oliveria
	DATA.............: 11/12/2023
	EX...............: EXEC [dbo].[SP_DelContatoColaborador] @Id = 8, @DDD = NULL, @Numero = NULL, @Whatsapp = NULL, @Email = NULL
					   SELECT * FROM ContatoColaborador
	*/

	BEGIN

		DELETE FROM ContatoColaborador
		WHERE (@Id IS NULL OR Id = @Id) AND
			  (@DDD IS NULL OR DDD = @DDD) AND
			  (@Numero IS NULL OR Numero = @Numero) AND
			  (@Whatsapp IS NULL OR Whatsapp = @Whatsapp) AND
			  (@Email IS NULL OR Email = @Email) 

	END

GO

---------------------------------------
--DELETANDO DADOS DA TABELA COLABORADOR
---------------------------------------


CREATE PROC [dbo].[SP_DelColaborador] (
	@Id SMALLINT = NULL,
	@NomeColaborador VARCHAR(120) = NULL,
	@DataNascimento DATE = NULL,
	@DataAdmissao DATE = NULL,
	@DataDemissao DATE = NULL
	)

	AS

	/*
	DOCUMENTAÇÃO
	ARQUIVO FONTE....: SQLQuery.CriaçãodeProcUpdate.sql
	OBJETIVO.........: DELETANDO DADOS NA TABELA ESTADO
	AUTOR............: SMN - João Emanoel de Araújo Heenriques Oliveria
	DATA.............: 11/12/2023
	EX...............: EXEC [dbo].[SP_DelColaborador] @Id = 7, @NomeColaborador = NULL,
					   @DataNascimento = NULL, @DataAdmissao = NULL, @DataDemissao = NULL
					   SELECT * FROM Colaborador
	*/

	BEGIN

		DELETE FROM Colaborador
		WHERE (@Id IS NULL OR Id = @Id) AND
			  (@NomeColaborador IS NULL OR NomeColaborador = @NomeColaborador) AND
			  (@DataNascimento IS NULL OR DataNascimento = @DataNascimento) AND
			  (@DataAdmissao IS NULL OR DataAdmissao = @DataAdmissao) AND
			  (@DataDemissao IS NULL OR DataDemissao = @DataDemissao)

	END

GO

---------------------------------------
--PROCEDURE DE SELECT EM COLABORADOR
---------------------------------------
ALTER PROC SP_SelColaborador(
		@NomeColaborador VARCHAR (120) = NULL,
		@DataNascimento DATE = NULL,
		@PoloEmpresa VARCHAR (60) = NULL,
		@Cargo VARCHAR (50) = NULL,
		@CidadeColaborador VARCHAR(60) = NULL,
		@DDD TINYINT = NULL,
		@Numero INT = NULL,
		@Whatsapp BIT = NULL,
		@Email VARCHAR (150) = NULL
		)
		
		AS 
		/* 
		DOCUMENTAÇÃO
		ARQUIVO FONTE....: SP_SelColaborador.sql
		OBJETIVO.........: SELECIONAR A TABELA COLABORADOR.
		AUTOR............: SMN - JÚLIA EVELYN
		DATA.............: 11/12/2023
		EX...............: EXEC [dbo].[SP_SelColaborador] @NomeColaborador = NULL, @DataNascimento = NULL, @PoloEmpresa = 'Ingá', @Cargo = 'Analista de Negócios', 
		                   @CidadeColaborador = NULL, @DDD = NULL, @Numero = NULL, @Whatsapp = NULL, @Email = NULL
		*/
		BEGIN 
			SELECT 
			    CONCAT(e.NomeEmpresa, ' - ',  p.NomeDoPolo) AS Empresa,
				cl.NomeColaborador AS Nome,
				ct.Email, 
				CONCAT(ct.DDD, ' - ',  ct.Numero) AS Telefone,
				CASE WHEN ct.Whatsapp = 1 THEN 'SIM' ELSE 'NÃO' END AS Whatsapp,
				cg.NomeCargo,
				c.NomeCidade
				FROM Colaborador cl
					INNER JOIN CidadeColaborador c
					ON cl.IdCidadeColaborador = c.Id
					INNER JOIN Cargo cg
					ON cl.IdCargo = cg.Id
					INNER JOIN ContatoColaborador ct
					ON ct.IdColaborador = cl.Id
					INNER JOIN PoloEmpresa p
					ON cl.IdPoloEmpresa = p.Id
					INNER JOIN Empresa e
					ON p.IdEmpresa = e.Id
				
			WHERE (@NomeColaborador IS NULL OR cl.NomeColaborador = @NomeColaborador) AND 
				  (@DataNascimento IS NULL OR cl.DataNascimento = @DataNascimento) AND 
				  (@CidadeColaborador IS NULL OR c.NomeCidade = @CidadeColaborador) AND
				  (@Cargo IS NULL OR cg.NomeCargo = @Cargo) AND
				  (@DDD IS NULL OR ct.DDD = @DDD) AND
				  (@Numero IS NULL OR ct.Numero = @Numero) AND
				  (@PoloEmpresa IS NULL OR p.NomeDoPolo = @PoloEmpresa) 
		END 
	GO

---------------------------------------
--PROCEDURE DE SELECT EM COLABORADOR
---------------------------------------
CREATE PROC SP_SelColaborador(
        @NomeColaborador VARCHAR (120) = NULL,
        @DataNascimento DATE = NULL,
        @PoloEmpresa VARCHAR (60) = NULL,
        @Cargo VARCHAR (50) = NULL,
        @CidadeColaborador VARCHAR(60) = NULL,
        @DDD TINYINT = NULL,
        @Numero INT = NULL,
        @Whatsapp BIT = NULL,
        @Email VARCHAR (150) = NULL
        )

        AS 
        /* 
        DOCUMENTAÇÃO
        ARQUIVO FONTE....: SP_SelColaborador.sql
        OBJETIVO.........: SELECIONAR A TABELA COLABORADOR.
        AUTOR............: SMN - JÚLIA EVELYN
        DATA.............: 11/12/2023
        EX...............: EXEC [dbo].[SP_SelColaborador] 

        */
        BEGIN 
            SELECT 
                cl.id AS Identificacao,
                CONCAT(e.NomeEmpresa, '-',  p.NomeDoPolo) AS Empresa,
                cl.NomeColaborador AS Nome,
                ct.Email, 
                CONCAT('(', ct.DDD, ') ', ct.Numero) AS Telefone,
                CASE WHEN ct.Whatsapp = 1 THEN 'SIM' ELSE 'NÃO' END AS Whatsapp,
                cg.NomeCargo AS Cargo,
                CONCAT (c.NomeCidade, '-', es.UfEstado) AS Cidade
                FROM Colaborador cl
                    INNER JOIN CidadeColaborador c
                    ON cl.IdCidadeColaborador = c.Id
                    INNER JOIN Cargo cg
                    ON cl.IdCargo = cg.Id
                    INNER JOIN ContatoColaborador ct
                    ON ct.IdColaborador = cl.Id
                    INNER JOIN PoloEmpresa p
                    ON cl.IdPoloEmpresa = p.Id
                    INNER JOIN Empresa e
                    ON p.IdEmpresa = e.Id
                    INNER JOIN Estado es
                    ON c.IdEstado = es.Id
            WHERE ct.Whatsapp = 1
     END
GO