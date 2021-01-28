use supplychain;

DELIMITER //

-- Criaçao de uma empresa
Create procedure adiciona_Empresa(IN idEmpresa int, IN nome VARCHAR(75), IN Contacto int, IN pais VARCHAR(75), IN Rua VARCHAR(75), IN codigo_Postal VARCHAR(75), IN tipo VARCHAR(75))
Begin 
INSERT INTO Empresa(idEmpresa, Nome, Contacto, Pais, Rua, Codigo_Postal, Tipo)
	Values (idEmpresa, Nome, Contacto, Pais, Rua, Codigo_Postal, Tipo);
END //

-- Criaçao de um produto
Create procedure adiciona_produto(IN idProduto_Fisico int, IN Preco float, IN Quantidade int, IN Dimensoes float, IN Peso float, IN Data_validade Date, IN fk_idProdutoTipo INT, Composto VARCHAR(75))
Begin 
INSERT INTO produto_fisico (idProduto_Fisico, Preco, Quantidade, Dimensoes, Peso, Data_validade, fk_idProdutoTipo, Composto)
	Values (idProduto_Fisico, Preco, Quantidade, Dimensoes, Peso, Data_validade, fk_idProdutoTipo, Composto);
END //

-- Criacao de um lote
Create procedure adiciona_lote(IN idLote int, IN Data Date, IN fk_idEMpresa_Origem int, IN fk_idEMpresa_Destino INT)
Begin 
INSERT INTO lote (idLote, Data, fk_idEMpresa_Origem, fk_idEMpresa_Destino)
	Values (idLote, Data, fk_idEMpresa_Origem, fk_idEMpresa_Destino);
END //

-- Criaçao de um tipo de produto
Create procedure adiciona_produto_tipo(IN idProduto_Tipo int, IN Preco float, IN Peso_m2 float, IN Nome VARCHAR(75))
Begin 
INSERT INTO produto_tipo (idProduto_Tipo, Preco, Peso_m2, Nome)
	Values (idProduto_Tipo, Preco, Peso_m2, Nome);
END //

DELIMITER ;