CREATE DATABASE bancoABC;
USE bancoABC;

CREATE TABLE categoria_cliente(
cod_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_categoria_cliente VARCHAR(100) NOT NULL
);

CREATE TABLE cliente(
cod_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_cliente VARCHAR(100) NOT NULL,
num_cpf_cliente VARCHAR(100) NOT NULL,
num_celular VARCHAR(20) NOT NULL,
endereco_estado VARCHAR(20) NOT NULL,
endereco_cidade VARCHAR(30) NOT NULL,
endereco_rua VARCHAR(30) NOT NULL,
endereco_numero INT(8) NOT NULL,
endereco_cep VARCHAR(20) NOT NULL,
categoria_cliente_cod_categoria_cliente INT,
FOREIGN KEY (categoria_cliente_cod_categoria_cliente) REFERENCES categoria_cliente(cod_cliente)
);

CREATE TABLE agencia(
num_conta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_agencia VARCHAR(100) NOT NULL
);

CREATE TABLE tipo_conta(
cod_tipo_conta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descricao_tipo_conta VARCHAR(100)
);

CREATE TABLE conta (
num_conta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
valor_saldo DECIMAL(10,2) NOT NULL,
tipo_conta_cod_tipo_conta INT,
cliente_cod_cliente INT,
agencia_num_conta INT,
FOREIGN KEY (tipo_conta_cod_tipo_conta) REFERENCES tipo_conta(cod_tipo_conta),
FOREIGN KEY (cliente_cod_cliente) REFERENCES cliente(cod_cliente),
FOREIGN KEY (agencia_num_conta) REFERENCES agencia(num_conta)
);

ALTER TABLE cliente
RENAME COLUMN num_celular TO telefone;

ALTER TABLE categoria_cliente
ADD COLUMN descricao TEXT;

ALTER TABLE cliente
ADD COLUMN renda DECIMAL(10,2);

ALTER TABLE cliente
MODIFY COLUMN renda DECIMAL(10,2) NOT NULL;

ALTER TABLE tipo_conta
MODIFY COLUMN descricao_tipo_conta TEXT NOT NULL;

ALTER TABLE agencia
MODIFY COLUMN nome_agencia VARCHAR(45);

ALTER TABLE cliente
DROP COLUMN endereco_estado;

ALTER TABLE categoria_cliente
RENAME TO categoria;

ALTER TABLE tipo_conta
ADD COLUMN observacao TEXT NOT NULL;

INSERT INTO categoria
(nome_categoria_cliente, descricao)
VALUES
("Private", "cliente com renda acima de 10mil"), 
("Exclusive", "cliente com renda acima de 20mil"),
("Gold", "cliente com renda acima de 30mil"),
("Básico" "cliente com renda acima de 40mil");

INSERT INTO clientes
(nome_cliente)
VALUES
("Mariom"),
("Diego"),
("Erick"),
("Luanna"),
("Tuler"),
("Matheus"),
("Tahinan"),
("Rafael");

INSERT INTO agencia
(nome_agencia)
VALUES
("Campeche"),
("Ingleses"),
("Centro");