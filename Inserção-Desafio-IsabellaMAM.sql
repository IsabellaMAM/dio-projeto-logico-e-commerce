use ecommerce_isabellamam;

-- inserir dados na tabela Cliente
insert into Cliente (nome, conta, identificacao, endereco) values
('João Silva', 'CPF', '12345678901', 'Rua A, 123, São Paulo'),
('Maria Oliveira', 'CPF', '98765432109', 'Rua B, 456, Rio de Janeiro'),
('Carlos Souza', 'CNPJ', '12345678000199', 'Av. C, 789, Belo Horizonte'),
('Fernanda Costa', 'CPF', '56473829102', 'Rua D, 101, Porto Alegre'),
('Paula Mendes', 'CNPJ', '99887766000100', 'Rua E, 202, Curitiba');

-- inserir dados na tabela Pedido
insert into Pedido (descricao, valor, frete, data_pedido, status_pedido) values
('Pedido 001', 150.00, 10.00, '2025-03-01', default),  
('Pedido 002', 250.00, 15.00, '2025-03-02', 'Aprovado'),
('Pedido 003', 500.00, 20.00, '2025-03-03', 'Enviado'),
('Pedido 004', 300.00, 10.00, '2025-03-04', 'Entregue'),
('Pedido 005', 450.00, 12.50, '2025-03-05', 'Processando');

-- inserir dados na tabela Entrega
insert into Entrega (data_envio, data_prevista, frete, codigo_rastreio, status_entrega) values
('2025-03-02', '2025-03-06', 15.00, 'R123456789', default), 
('2025-03-03', '2025-03-07', 20.00, 'R987654321', 'Enviado'),
('2025-03-04', '2025-03-08', 10.00, 'R112233445', 'Entregue');

-- inserir dados na tabela Pagamento
insert into Pagamento (valor, forma_de_pagamento, data_pagamento) values
(150.00, 'Cartão de Crédito', '2025-03-01'),
(250.00, 'Boleto', '2025-03-02'),
(500.00, 'Pix', '2025-03-03'),
(300.00, 'Cartão de Crédito', '2025-03-04'),
(450.00, 'Boleto', '2025-03-05');

-- inserir dados na tabela Produto
insert into Produto (categoria, descricao, valor) values
('Eletrônicos', 'Celular', 1200.00),
('Móveis', 'Mesa de jantar', 800.00),
('Informática', 'Laptop', 3000.00),
('Vestuário', 'Camiseta', 50.00),
('Calçados', 'Tênis', 150.00);

-- inserir dados na tabela Produto_Pedido
insert into Produto_Pedido (idPOProduto, idPOPedido, quantidade) values
(1, 1, 2),
(2, 2, 1),
(3, 3, 1),
(4, 4, 3),
(5, 5, 2);

-- inserir dados na tabela Terceiro_Vendedor
insert into Terceiro_Vendedor (razao_social, local) values
('Vendedor A', 'São Paulo'),
('Vendedor B', 'Rio de Janeiro'),
('Vendedor C', 'Belo Horizonte'),
('Vendedor D', 'Curitiba'),
('Vendedor E', 'Porto Alegre');

-- inserir dados na tabela Produto_Terceiro_Vendedor
insert into Produto_Terceiro_Vendedor (idptvvendedor, idptvproduto, quantidade) values
(1, 1, 10),
(2, 2, 15),
(3, 3, 5),
(4, 4, 20),
(5, 5, 30);

-- inserir dados na tabela Estoque
insert into Estoque (local) values
('São Paulo'),
('Rio de Janeiro'),
('Belo Horizonte'),
('Curitiba'),
('Porto Alegre');

-- inserir dados na tabela Produto_Estoque
insert into Produto_Estoque (idpeproduto, idpeestoque, quantidade, e_local) values
(1, 1, 50, 'São Paulo'),
(2, 2, 30, 'Rio de Janeiro'),
(3, 3, 20, 'Belo Horizonte'),
(4, 4, 40, 'Curitiba'),
(5, 5, 60, 'Porto Alegre');

-- inserir dados na tabela Fornecedor
insert into Fornecedor (razao_social, cnpj) values
('Fornecedor A', '12345678000100'),
('Fornecedor B', '98765432000199'),
('Fornecedor C', '11223344000155'),
('Fornecedor D', '99887766000122'),
('Fornecedor E', '55667788000111');

-- inserir dados na tabela Produto_Fornecedor
insert into Produto_Fornecedor (idpffornecedor, idpfproduto) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);