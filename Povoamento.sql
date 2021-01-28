
-- ------------------------------------------------------
-- ------------------------------------------------------
-- Caso de Estudo: Cadeia de suplimento
-- Povoamento inicial da base de dados
-- Dezembro/2020
-- ------------------------------------------------------
-- ------------------------------------------------------

--
-- Esquema: "Mercearia"
USE `supplychain` ;

--
-- Permissão para fazer operações de remoção de dados.
SET SQL_SAFE_UPDATES = 0;

--
-- Povoamento da tabela "Produto_Tipo"
INSERT INTO produto_tipo
	(idProduto_Tipo, Preco, Peso_m2, Nome)
	VALUES 
		(1, 5, 6, "Ferro"),
		(2, 1, 5, "Arroz"),
		(3, 50, 5, "Portas"),
		(4, 60, 2, "Madeira"),
		(5, 3, 9, "Prateleiras"),
		(6, 56, 8, "Armario"),
		(7, 2, 8, "Peluche"),
        (8, 50, 9, "Casaco"),
        (9, 60, 5, "Cadeira"),
        (10, 75, 8, "Secretária"),
        (11, 4, 10, "Lixo"),
        (12, 6, 13, "Camisa"),
        (13, 4, 16, "Camisola"),
        (14, 4, 17, "Blusa"),
        (15, 6, 61, "Chapeu"),
        (16, 8, 71, "Colar"),
        (17, 9, 51, "Bandolete"),
        (18, 10, 22, "rosas"),
        (19, 25, 23, "Margarida"),
        (20, 1, 8, "Calças")
	;
--
-- DELETE FROM produto_Tipo;
-- SELECT * FROM produto_Tipo;

--
-- Povoamento da tabela "Produto_Fisico"
INSERT INTO produto_fisico
	(idProduto_Fisico, Preco, Quantidade, Dimensoes, Peso, Data_validade, fk_idProdutoTipo, Composto)
	VALUES 
		(1, 13, 15, 10, 15, NULL, 1, 'false'), -- Ferro
		(2, 5, 1, 40, 12, '2030-01-01', 2, 'false'), -- Arroz
		(3, 38, 55, 1, 16, NULL, 3, 'true'), -- Portas
		(4, 75, 70, 1, 11, NULL, 4, 'false'), -- Madeira
		(5, 3, 5, 90, 13, NULL, 8, 'true'), -- Prateleiras
		(6, 36, 1, NULL, 13, NULL, 6, 'true'), -- Armario
		(7, 45, 1, 45, 111, NULL, 7, 'false'), -- Peluche
        (8, 23, NULL, 25, 5, NULL, 5, 'false'), -- Madeira
        (9, 86, 1, 4, 1, '2021-04-08', 9 ,'fale'),
        (10, 64, 1, 41, NULL, NULL, 8, 'false'),
        (11, 4, 1, 2, 163, NULL, 9, 'false'),
        (12, 3, 1, 01, 0.51, '2025-01-01', 4, 'false'),
        (13, 34, 1, 01, 0.76, NULL, 5, 'false'),
        (14, 1, 1, 110, 11, '2042,01-05', 5, 'false'),
        (15, 64, 1, 5, 21, NULL, 7, 'false'),
        (16, 3, 1, 06, 1, NULL, 5, 'false'),
        (17, 2, 1, 9, 18.9, NULL, 20, 'false'),
        (18, 9, 1, 6, 1, '2030-04-01', 5, 'true'),
        (19, 7, 1, 2, 1, NULL, 5, 'false'),
        (20, 77, 1, 5, 1.89, NULL, 8, 'true'),
        (21, 4, 1, 9, 1, NULL, 5, 'false'),
        (22, 111, 1, 1, 1, NULL, 5, 'false')
	;
--
-- DELETE FROM Produto_Fisico;
-- SELECT * FROM Produto_Fisico;

--
-- Povoamento da tabela "Componentes"
INSERT INTO Componentes
	(Produto_origem, Componentes)
	VALUES 
		(5, 5),
		(6, 5),
		(6, 3),
        (3, 4),
        (3, 8),
        (3, 8),
        (3, 8),
        (3, 8),
        (3, 8),
        (3, 8),
        (3, 8),
        (3, 8),
        (3, 8),
        (3, 8),
        (3, 8)
	;

--
-- DELETE FROM Componentes;
-- SELECT * FROM Componentes;

--
-- Povoamento da tabela "Empresa"
INSERT INTO Empresa
	(idEmpresa, Nome, Contacto, Pais, Rua, Codigo_Postal, Tipo)
	VALUES 
		(1, "Joaquim Alberto lda", 969696969, 'Portugal', 'Rua Alberto Afonso', '2563-484', 'Armazenista'),
		(2, "TDFlda", 96235969, 'Portugal', 'Rua Doutor Alberto Jonas', '2563-294', 'Retalho'),
        (3, "Carpintaria Joao", 967456969, 'Portugal', 'Rua Alto Passo', '2563-28', 'Produtor'),
        (4, "Ze Manel Caridade, Venda de Lenha", 969285969, 'Portugal', 'Rua 1 de Dezembro', '2563-234', 'Fornecedor'),
        (5, "ArmazemRapido", 962956969, 'Portugal', 'Rua Renata Rio', '4830-514', 'Armazenista'),
        (6, "SantosLDA", 969121219, 'Portugal', 'Rua Alberto Afonso', '2563-234', 'Armazenista'),
		(7, "RaulLDA", 969542159, 'Italia', 'Rua Jao IV', '2563-234', 'Armazenista'),
		(8, "JaimeLDA", 969122639, 'Lituania', 'Rua Orlando Oliveira', '2563-234', 'Armazenista'),
        (9, "JoaoLDA", 969124239, 'Bulgaria', 'Rua Teresa Teles', '2596-234', 'Administrador'),
        (10, "LuisLDA", 969185619, 'Amesterdao', 'Rua Jaime Giao', '2553-234', 'Fornecedor')
	;
--
-- DELETE FROM Empresa;
-- SELECT * FROM Empresa;

--
-- Povoamento da tabela "Lote"
INSERT INTO Lote
	(idLote, Data, fk_idEMpresa_Origem, fk_idEMpresa_Destino)
	VALUES 
		(1, '2025-01-01', 4, 5), -- fornecedor -> armazem
		(2, '2020-12-01', 5, 3), -- armazem -> produtor
		(3, '2020-11-01', 3, 1), -- produtor -> armazem
		(4, '2030-10-01', 1, 2),  -- armazem -> loja
        (5, '2023-01-01', 1, 2), 
        (6, '2021-9-01', 8, 8),
        (7, '2026-11-01', 2, 3),  
        (8, '2023-01-01', 5, 2),  
        (9, '2031-01-01', 9, 1)  
	;
--
-- DELETE FROM Lote;
-- SELECT * FROM Lote;

--
-- Povoamento da tabela "Elementos"
INSERT INTO Elementos
	(fk_idLote, fk_idProduto_Fisico)
	VALUES 
		(1, 8),
		(1, 2),
		(1, 3),
		(1, 4),
        (2, 1),
		(3, 5),
		(2, 6),
		(2, 7),
        (8, 8),
        (6, 7)
	;
--
-- DELETE FROM Elementos;
-- SELECT * FROM Elementos;

