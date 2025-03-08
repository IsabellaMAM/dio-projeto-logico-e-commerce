-- criação do banco de dados para o cenário anterior de E-commerce 
-- drop  database ecommerce;
create database ecommerce_isabellamam;
use ecommerce_isabellamam;

-- criar tabela Cliente
create table Cliente(
    idCliente int auto_increment primary key,
    nome varchar(255),
    conta enum('CPF','CNPJ'),
    identificacao varchar(14),
    endereco varchar(100)
);

alter table Cliente auto_increment=1;

-- desc Cliente;

-- criar tabela Pedido
create table Pedido(
    idPedido int auto_increment primary key,
    descricao varchar(100),
    valor float,
    frete float,
    data_pedido date,
    status_pedido enum('Pendente', 'Aprovado', 'Processando', 'Enviado', 'Entregue') default 'Pendente'
    );
    
alter table Pedido auto_increment=1;

-- desc Pedido;

-- criar tabela entrega
create table Entrega(
    idEntrega int auto_increment primary key,
    idEPedido int,
    idECliente int,
    data_envio date,
    data_prevista date,
    frete float,
    codigo_rastreio varchar(20),
    status_entrega enum('Em Processo', 'Enviado', 'Entregue') default 'Em Processo',
    constraint fk_entrega_pedido foreign key (idEPedido) references Pedido(idPedido),
    constraint fk_entrega_cliente foreign key (idECliente) references Cliente(idCliente)
);

-- desc Entrega;

alter table Entrega auto_increment=1;

-- criar tabela Pagamento
create table Pagamento(
    idPagamento int auto_increment primary key,
    idPPedido int,
    idPCliente int,
    valor float,
    forma_de_pagamento varchar(45),
    data_pagamento date,
    constraint fk_pagamento_pedido foreign key (idPPedido) references Pedido(idPedido),
    constraint fk_pagamento_cliente foreign key (idPCliente) references Cliente(idCliente)    
);

-- desc Pagamento;

alter table Pagamento auto_increment=1;
    
-- criar tabela Produto
create table Produto(
    idProduto int auto_increment primary key,
    categoria varchar(15),
    descricao varchar(100),
    valor float
);

-- desc Produto;

alter table Produto auto_increment=1;

-- criar tabela ProdutoPedido
create table ProdutoPedido(
    idPOProduto int,
    idPOPedido int,
    quantidade int,
    primary key (idPOProduto, idPOPedido),
    constraint fk_produtopedido_produto foreign key (idPOProduto) references Produto(idProduto),
    constraint fk_produtopedido_pedido foreign key (idPOPedido) references Pedido(idPedido)
);

-- desc ProdutoPedido;

-- criar tabela Terceiro - Vendedor
create table Terceiro_Vendedor (
	idTerceiro_Vendedor int auto_increment primary key,
    razao_social varchar(80),
    local varchar(100)
);

-- desc Terceiro_Vendedor;

alter table Terceiro_Vendedor auto_increment=1;

-- criar tabela Produto_Terceiro_Vendedor
create table Produto_Terceiro_Vendedor(
    idPTVVendedor int,
    idPTVProduto int,
    quantidade int,
    primary key (idPTVVendedor, idPTVProduto),
    constraint fk_produtoterceirovendedor_vendedor foreign key (idPTVVendedor) references Terceiro_Vendedor(idTerceiro_Vendedor),
    constraint fk_produtoterceirovendedor_produto foreign key (idPTVProduto) references Produto(idProduto)
);

-- desc Produto_Terceiro_Vendedor;
    
-- criar tabela Estoque
create table Estoque(
    idEstoque int auto_increment primary key,
    local varchar(100)
);

-- desc Estoque;

alter table Estoque auto_increment=1;

-- create tabela Produto_Estoque
create table Produto_Estoque(
    idPEProduto int,
    idPEEstoque int,
    quantidade int,
    primary key (idPEProduto, idPEEstoque),
    constraint fk_produtoestoque_produto foreign key (idPEProduto) references Produto(idProduto),
    constraint fk_produtoestoque_estoque foreign key (idPEEstoque) references Estoque(idEstoque)
);

-- desc Produto_Estoque;
    
-- criar tabela Fornecedor
create table Fornecedor(
    idFornecedor int auto_increment primary key,
    razao_social varchar(80),
    cnpj char(14)
);

-- desc Fornecedor;

alter table Fornecedor auto_increment=1;

-- criar tabela Produto_Fornecedor
create table Produto_Fornecedor(
    idPFFornecedor int,
    idPFProduto int,
    primary key (idPFFornecedor, idPFProduto),
	constraint fk_produtofornecedor_fornecedor foreign key (idPFFornecedor) references Fornecedor(idFornecedor),
    constraint fk_produtofornecedor_produto foreign key (idPFProduto) references Produto(idProduto)
);

-- desc Produto_Fornecedor;
