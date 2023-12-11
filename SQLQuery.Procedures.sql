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