CREATE SCHEMA atividade_01;

USE atividade_01;

-- Criando as tabelas

CREATE TABLE produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT
);

CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(100)
);

CREATE TABLE vendas(
	id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    id_cliente INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    quantidade INT,
    data_venda DATE
);

-- INSERINDO DADOS
INSERT INTO produtos (nome, categoria, preco, estoque)
VALUES
('Tv Roku 70 polegadas', 'Televisao', 5080.99, 105),
('Cafeteira Nespresso', 'Cafeteira', 678.95, 205),
('Headphone JBL', 'Fones', 345.98, 57),
('Iphone 14 pro', 'Smartphone', 4250.00, 15),
('Umidificador', 'Ventilador', 700.00, 102),
('Monitor AOC 32 polegadas','Monitores', 864.90, 500);

INSERT INTO clientes(nome, email, telefone)
VALUES
('Luciana Medeiros','lumedeiros@gmail.com','(81) 9 6980-8907'),
('Catarina Silva','catsilva@gmail.com','(81) 9 7834-6809'),
('Mathias Bernardo','mathiasbnb@gmail.com','(81) 9 3421-1567'),
('Solange Albuquerque','solalbuq@gmail.com','(81) 9 8096-6009'),
('Tereza Marques','tetemarques@gmail.com','(53) 9 8907-4787');

INSERT INTO vendas (id_produto, id_cliente, quantidade, data_venda)
VALUES
    (1, 1, 2, '2024-10-02'), -- Lucia Medeiros comprou 1 Tv Roku
    (2, 2, 1, '2024-06-08'), -- Catarina Silva comprou 1 Cafeteira
    (3, 3, 3, '2024-07-29'), -- Mathias Bernardo comprou 1 Headphone
    (4, 4, 5, '2024-04-10'), -- Solange Albuquerque comprou 1 Iphone 
    (5, 1, 4, '2024-12-20'), -- Tereza Marques comprou 1 Umidificador
    (1, 2, 1, '2024-05-17'), -- Luciana Medeiros comprou 1 ventilador
    (6, 3, 10, '2024-11-18'), -- Catarina Silva comprou 2 TVs
    (2, 4, 6, '2024-02-28'), -- Mathias Bernardo comprou 2 Iphones
    (3, 5, 2, '2024-03-08'), -- Solange Albuquerque comprou 1 Pc gamer
    (4, 1, 1, '2024-10-01'); -- Tereza Marques comprou 2 Smartphones


-- Atualizacao de preços e telefones
UPDATE produtos SET preco = 5080.45
WHERE id_produto = 3;

UPDATE clientes SET telefone = '(81) 9 555-798'
WHERE id_cliente = 1; 

-- Removendo dados
DELETE FROM vendas WHERE id_cliente = 1;
DELETE FROM clientes WHERE id_cliente = 1;

-- Ordernando valores
SELECT preco FROM produtos ORDER BY preco ASC;

-- Consultas
SELECT * FROM produtos WHERE categoria = 'Televisao';
SELECT * FROM vendas WHERE data_venda = '2024-10-02';

SELECT id_produto, SUM(quantidade) AS total_vendas
FROM vendas
GROUP BY id_produto;

-- Calculando o valor da receita total
SELECT
	clientes.id_cliente,
    clientes.nome,
    SUM(vendas.quantidade * produtos.preco) as receita_total
    FROM vendas
    JOIN produtos ON vendas.id_produto = produtos.id_produto
    JOIN clientes ON vendas.id_cliente = clientes.id_cliente
    GROUP BY clientes.id_cliente;
-- Ordenando na ordem Ascendente e Descendente
SELECT nome FROM produtos ORDER BY nome ASC;
SELECT nome FROM clientes ORDER BY nome DESC;

SELECT * FROM clientes;
SELECT * FROM vendas;