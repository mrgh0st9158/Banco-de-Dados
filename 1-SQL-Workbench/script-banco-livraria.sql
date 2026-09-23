CREATE DATABASE banco_livraria;
USE banco_livraria;

CREATE TABLE cliente(
id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_cliente VARCHAR(100) NOT NULL,
rg_cliente VARCHAR(20),
cpf_cliente VARCHAR(11) UNIQUE,
pais_cliente VARCHAR(45)
);

CREATE TABLE financiador(
id_financiador INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_financiador VARCHAR(100),
cnpj_financiador VARCHAR(45)
);

CREATE TABLE autor(
id_autor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_autor VARCHAR(100),
rg_autor VARCHAR(20)
);

CREATE TABLE editora(
id_editora INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nomeFantasia_editora VARCHAR(45),
razaoSocial VARCHAR(100),
pais_editora VARCHAR(45)
);

CREATE TABLE livro(
id_livro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
isbn_livro VARCHAR(45),
titulo_livro VARCHAR(45),
preco_livro DECIMAL(8,2),
categoria_livro VARCHAR(45),

autor_id INT,
financiador_id INT,
FOREIGN KEY(autor_id) REFERENCES autor(id_autor),
FOREIGN KEY(financiador_id) REFERENCES financiador(id_financiador)
);

CREATE TABLE pedido(
id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
qtd_pedido INT,
CHECK(qtd_pedido > 0),

livro_id INT,
cliente_id INT,
FOREIGN KEY(livro_id) REFERENCES livro(id_livro),
FOREIGN KEY(cliente_id) REFERENCES cliente(id_cliente)
);

-- modificações para condizer com as exigências
ALTER TABLE editora
MODIFY COLUMN razaoSocial VARCHAR(100) NOT NULL,
MODIFY COLUMN pais_editora VARCHAR(45) DEFAULT("Brasil"),
MODIFY COLUMN nomeFantasia_editora ENUM("Editora_A", "Editora_B", "Editora_C");

ALTER TABLE autor
MODIFY COLUMN nome_autor VARCHAR(100) NOT NULL;

ALTER TABLE cliente
MODIFY COLUMN pais_cliente VARCHAR(45) DEFAULT("Brasil");

ALTER TABLE pedido
MODIFY COLUMN qtd_pedido INT;

ALTER TABLE livro
MODIFY COLUMN preco_livro DECIMAL(8,2),
MODIFY COLUMN categoria_livro ENUM("Horror", "Ficção", "Romance", "Ação");

ALTER TABLE financiador
MODIFY COLUMN nome_financiador VARCHAR(100) DEFAULT("Financiador Público");
-- =============================================================================
-- atividade

INSERT INTO editora
(nomeFantasia_editora, razaoSocial, pais_editora)
VALUES
("Editora_A", "pipipopo", "Reino Unido"),
("Editora_B", "pepepepopopo", "Alemanha"),
("Editora_C", "papapapipipi", "Brasil");

SELECT * FROM editora;

INSERT INTO editora
(nomeFantasia_editora, pais_editora)
VALUES
("Editora_A", "Brasil");

INSERT INTO autor
(nome_autor, rg_autor)
VALUES
("Allan Poe", "123456789"),
("Clarice Lispector", "123456782"),
("Bram Stoker", "123456783");

SELECT * FROM autor;

INSERT INTO autor
(rg_autor)
VALUES
("123456781");

INSERT INTO cliente
(nome_cliente, rg_cliente, cpf_cliente, pais_cliente)
VALUES
("Manoel", "1122334455", "12345678910", "Brasil"),
("Lucas", "11223344", "12345678911", "Rússia"),
("Rafaela", "112233", "12345678912", "Irlanda");

SELECT * FROM cliente;

INSERT INTO cliente
(rg_cliente, cpf_cliente, pais_cliente)
VALUES
("112233445566", "1234567891013", "Chile");
INSERT INTO cliente
(nome_cliente, rg_cliente, cpf_cliente, pais_cliente)
VALUES
("Pedro", "112233445566", "12345678910", "Chile");

INSERT INTO pedido
(qtd_pedido)
VALUES
(1),
(2),
(3);



INSERT INTO livro
(preco_livro)
VALUES
(1),
(2),
(3);

SELECT * FROM pedido;

DESCRIBE pedido;

-- =============================================================================
