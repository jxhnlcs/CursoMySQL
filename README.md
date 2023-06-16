# Curso MySQL
Aulas do curso MySQL curso em vídeo

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11),
    nome VARCHAR(100) NOT NULL,
    dataNascimento DATE,
    endereco VARCHAR(100),
    cep VARCHAR(8),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    uf VARCHAR(2)
);

select * from clientes;

ALTER TABLE clientes
ADD COLUMN dataUltima DATETIME default(CURRENT_TIMESTAMP);

desc clientes;

insert into 
clientes(cpf, nome, dataNascimento, endereco, cep, bairro, cidade, uf)
values
('04496332780', 'João da Silva', '1969-11-25', 'Rua Antônio Numes', '88045963', 'Palmeiras', 'Londrina', 'PR'),
('05485031490', 'Ana Regina Fagundes', '1986-09-21', 'Rua Palmeias Novas', '88078923', 'Leblon', 'Rio de Janeiro', 'RJ'),
('03350314905', 'Fernando Soares', '1990-03-05', 'Rua Palmeias Novas', '88048917', 'Copacabana', 'Rio de Janeiro', 'RJ');

delete from clientes 
where cidade = 'Londrina';

truncate clientes;











create table tb01_produtos(
	id INT AUTO_INCREMENT PRIMARY KEY,
	tb01_produtos_codbarras bigint(20),
	tb01_produtos_nome varchar(120),
	tb01_produtos_preco decimal(10,2),
	tb01_produtos_qtd tinyint(4)
);

select * from tb01_produtos;

INSERT INTO tb01_produtos (tb01_produtos_codbarras, tb01_produtos_nome, tb01_produtos_preco, tb01_produtos_qtd)
VALUES (1234567890123, 'Toddy', 5.99, 50);

INSERT INTO tb01_produtos (tb01_produtos_codbarras, tb01_produtos_nome, tb01_produtos_preco, tb01_produtos_qtd)
VALUES (9876543210987, 'Nescau', 6.49, 30);


create table tb02_vendas(
	id INT AUTO_INCREMENT PRIMARY KEY,
	tb02_vendas_cod int(11),
	tb02_vendas_date date
);

select * from tb02_vendas;

INSERT INTO tb02_vendas (tb02_vendas_cod, tb02_vendas_date)
VALUES (1, '2023-3-10');

INSERT INTO tb02_vendas (tb02_vendas_cod, tb02_vendas_date)
VALUES (2, '2023-05-15');


create table tb03_itens_vendas(
	id INT AUTO_INCREMENT PRIMARY KEY,
	tb03_itens_vendas_cod int(11),
	tb03_vendas_cod int(11),
	tb03_produtos_codbarras bigint(20),
	tb03_itens_vendas_qtd tinyint(4),
	tb03_itens_vendas_preco decimal(10,2)
);

select * from tb03_itens_vendas;

INSERT INTO tb03_itens_vendas (tb03_itens_vendas_cod, tb03_vendas_cod, tb03_produtos_codbarras, tb03_itens_vendas_qtd, tb03_itens_vendas_preco)
VALUES (1, 1, 1234567890123, 2, 11.98);

INSERT INTO tb03_itens_vendas (tb03_itens_vendas_cod, tb03_vendas_cod, tb03_produtos_codbarras, tb03_itens_vendas_qtd, tb03_itens_vendas_preco)
VALUES (2, 1, 9876543210987, 3, 19.47);

INSERT INTO tb03_itens_vendas (tb03_itens_vendas_cod, tb03_vendas_cod, tb03_produtos_codbarras, tb03_itens_vendas_qtd, tb03_itens_vendas_preco)
VALUES (3, 2, 1234567890123, 1, 5.99);

SELECT tb03_itens_vendas.id, tb01_produtos.tb01_produtos_nome
FROM tb03_itens_vendas
JOIN tb01_produtos ON tb03_itens_vendas.tb03_produtos_codbarras = tb01_produtos.tb01_produtos_codbarras
order by id;

SELECT tb02_vendas.id, tb02_vendas.tb02_vendas_cod, tb02_vendas.tb02_vendas_date, tb01_produtos.tb01_produtos_nome
FROM tb02_vendas
JOIN tb03_itens_vendas ON tb02_vendas.tb02_vendas_cod = tb03_itens_vendas.tb03_vendas_cod
JOIN tb01_produtos ON tb03_itens_vendas.tb03_produtos_codbarras = tb01_produtos.tb01_produtos_codbarras
WHERE tb01_produtos.tb01_produtos_nome = 'Toddy'
order by id;
