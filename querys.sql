SET GLOBAL log_bin_trust_function_creators = 1;

use supplychain;

-- 1. Lista de todos os produtos
select Nome from produto_tipo order by Nome ASC;

-- 2. Informaçoes de todos os Lote
select l.idLote, l.data, emp1.nome as EmpresaOrigem, emp2.nome as EmpresaDestino, e.fk_idProduto_Fisico as IdProdutoFisico 
from lote l, elementos e, empresa emp1, empresa emp2 
where l.idLote = e.fk_idLote 
AND emp1.idEmpresa = l.fk_idEmpresa_Origem 
AND emp2.idEmpresa = l.fk_idEmpresa_Destino;

-- 3. Lista de todas as empresas 
select * from Empresa;

-- 4. Lista de todos os fornecedores
select * from Empresa where Tipo in ('Fornecedor');

-- 5. Lista de todos os armazenistas
select * from Empresa where Tipo in ('Armazenista');

-- 6. Lista de todas as produtoras
select * from Empresa where Tipo in ('Produtor');

-- 7. Lista de todos os retalhos
select * from Empresa where Tipo in ('Retalho');

-- 8. Lista da validade de produtos fisicos
select pt.Nome, pf.idProduto_Fisico, pf.data_validade < CURRENT_TIMESTAMP as ForaValidade from produto_fisico pf, produto_tipo pt 
where pf.fk_idProdutoTipo = pt.idProduto_Tipo AND pf.data_validade is not null order by pt.Nome ASC;

-- 9. Componentes dos protudos
select c.produto_origem, pf.idProduto_Fisico as IdProdutoOrigem, pt.Nome as NomeProdutoOrigem,
c.componentes, pf1.idProduto_Fisico as IdProdutoComponentes, pt1.Nome as NomeProdutoComponentes
from produto_tipo pt, produto_fisico pf, componentes c, produto_tipo pt1, produto_fisico pf1
where c.Produto_origem = pf.idProduto_Fisico
AND pf.fk_idProdutoTipo = pt.idProduto_Tipo 
AND c.componentes = pf1.idProduto_Fisico 
AND pf1.fk_idProdutoTipo = pt1.idProduto_Tipo 
order by c.Produto_origem;

-- 10. Todos os Produtos Fisicos
select * from produto_fisico pf, produto_tipo pt where pf.fk_idProdutoTipo = pt.idProduto_Tipo order by pf.fk_idProdutoTipo;

-- 11. Top Empresas com mais lotes recebidos
select e.idEmpresa, e.nome, e.pais from empresa e, lote l where e.idEmpresa = l.fk_idEmpresa_Destino order by e.nome asc;

-- 12. Calcular preco de um lote
DELIMITER //
create function precoLote (idLote int) returns float
BEGIN
declare price float;
select sum(p.preco) INTO price
from elementos e, produto_fisico p
where v.fk_idProdutoFisico = p.idProduto_Fisico
and v.fk_ifLote = idLote;
return price;
END//
DELIMITER ;



