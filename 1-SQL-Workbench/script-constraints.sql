CREATE DATABASE regra_constraint;
USE regra_constraint;

CREATE TABLE usuario(
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
cpf BIGINT UNIQUE NOT NULL,
pais VARCHAR(50) DEFAULT "Brasil",
graduado ENUM("Sim", "Não"),
num_filhos INT,
CHECK (num_filhos >=0)
);

SELECT * FROM usuario;

-- Incrementar valores a todos menos ao nome
INSERT INTO usuario(nome, cpf, pais, graduado, num_filhos)
VALUES
("Lucas", 12345678912, "Brasil", "Sim", 2);

INSERT INTO usuario(nome, cpf, pais, graduado, num_filhos)
VALUES
("Manoel", 12345678913, "Brasil", "Sim", 2);

-- Deixar o nome do pais vazio (testando o DEFAULT)
INSERT INTO usuario
(nome, cpf, graduado, num_filhos)
VALUES
("Carlos", 12345678914, "Sim", 2);

INSERT INTO usuario
(nome, cpf, graduado, pais, num_filhos)
VALUES
("Carlos", 12345678915, "Sim", "Rússia", 2);

-- colocar incompleto na graduação
INSERT INTO usuario
(nome, cpf, graduado, pais, num_filhos)
VALUES
("Maria", 12345678916, "Brasil", "Incompleto", 2);

INSERT INTO usuario
(nome, cpf, graduado, pais, num_filhos)
VALUES
("Maria", 12345678916, "Brasil", "Sim", 2);

-- colocar numero de filhos negativo
INSERT INTO usuario
(nome, cpf, pais, graduado, num_filhos)
VALUES
("Camila", 12345678917, "Brasil", "Sim", -1);

INSERT INTO usuario
(nome, cpf, pais, graduado, num_filhos)
VALUES
("Camila", 12345678917, "Brasil", "Sim", 8);

SELECT nome, num_filhos FROM usuario;