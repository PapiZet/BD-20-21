use supplychain;

-- Lista de todos os tipos de produtos
create view ListaProdutosTipos as 
select Nome from produto_tipo order by Nome ASC;

-- Lista de todos os produtos
create view ListaProdutos as 
select distinct Nome from produto_fisico pf, produto_tipo pt where pf.fk_idProdutoTipo = pt.idProduto_Tipo order by pf.fk_idProdutoTipo ASC;

-- Lista de todas as empresas
create view ListaEmpresas as
select * from Empresa;

-- Lista de todos os lotes
create view ListaLotes as
select l.idLote, l.data, emp1.nome as EmpresaOrigem, emp2.nome as EmpresaDestino, e.fk_idProduto_Fisico as IdProdutoFisico 
from lote l, elementos e, empresa emp1, empresa emp2 
where l.idLote = e.fk_idLote 
AND emp1.idEmpresa = l.fk_idEmpresa_Origem 
AND emp2.idEmpresa = l.fk_idEmpresa_Destino;


