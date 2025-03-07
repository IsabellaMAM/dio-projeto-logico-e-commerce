use ecommerce_isabellamam;

-- Quantos pedidos foram feitos por cada cliente?
select idCliente, nome, COUNT(idPedido) as total_pedidos from Pedido
right join Cliente on idCliente = idCliente
group by idCliente, nome
order by total_pedidos desc;

-- Algum vendedor também é fornecedor?
select idTerceiro_Vendedor, tv.cnpj as cnpj_tr_vendedor, idFornecedor, f.cnpj as cnpj_fornecedor
from Terceiro_Vendedor tv
join Fornecedor f on f.cnpj = tv.cnpj;

-- Relação de produtos fornecedores e estoques
select p.idProduto, p.descricao as produto_descricao, 
       f.idFornecedor, f.razao_social as fornecedor_razao_social, 
       e.idEstoque, e.local as estoque_local, 
       pe.quantidade as estoque_quantidade 
from Produto p
join Produto_Fornecedor pf on p.idProduto = pf.idPFProduto
join Fornecedor f on pf.idPFFornecedor = f.idFornecedor
join Produto_Estoque pe on p.idProduto = pe.idPEProduto
join Estoque e on pe.idPEEstoque = e.idEstoque
order by p.idProduto, f.idFornecedor, e.idEstoque;

-- Relação de nomes dos fornecedores e nomes dos produtos
select f.razao_social as fornecedor_nome, p.descricao as produto_nome
from Produto_Fornecedor pf
join Produto p on pf.idPFProduto = p.idProduto
join Fornecedor f on pf.idPFFornecedor = f.idFornecedor;

-- Total de vendas
select sum(valor) as total_vendas from Pedido;

-- Total de pedidos
select count(idPedido) as total_pedidos from Pedido;

-- Produdos mais vendidos
select descricao as produto, SUM(quantidade) as quantidade
from Produto_Pedido 
join Produto on idPOProduto = idProduto
group by descricao
order by quantidade desc;

desc Produto_Pedido;

-- Período com mais vendas
select data_pedido as mes, sum(valor) as total_vendas
from Pedido
group by mes
order by total_vendas desc;