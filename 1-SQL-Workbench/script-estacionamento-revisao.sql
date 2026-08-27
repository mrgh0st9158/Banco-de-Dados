CREATE DATABASE estacionamentoABC;
USE estacionamentoABC;

CREATE TABLE ticket(
id_ticket INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
codigo_barra INT NOT NULL,
observacao TEXT NOT NULL
);

CREATE TABLE estacionamento(
id_estacionamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
CNPJ BIGINT NOT NULL,
ticket_id INT,
FOREIGN KEY(ticket_id) REFERENCES ticket (id_ticket)
);

CREATE TABLE setor(
id_setor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
descricao VARCHAR(45) NOT NULL,
estacionamento_id INT,
FOREIGN KEY(estacionamento_id) REFERENCES estacionamento (id_estacionamento)
);

CREATE TABLE vaga(
id_vaga INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
numero_vagas INT NOT NULL,
setor_id INT,
FOREIGN KEY(setor_id) REFERENCES setor(id_setor) 
);

-- Apagar Chave Estrangeira
ALTER TABLE vaga
DROP FOREIGN KEY vaga_ibfk_1;

-- Adicionar Chave Estrangeira
ALTER TABLE vaga
ADD FOREIGN KEY (setor_id) REFERENCES setor (id_setor);

-- Adicionar Coluna
ALTER TABLE ticket
ADD COLUMN descricao TEXT;

-- Modifica  uma coluna
ALTER TABLE ticket
MODIFY COLUMN descricao VARCHAR(100);

-- Remover coluna
ALTER TABLE ticket
DROP COLUMN descricao;

-- Alterar o nome de uma coluna
ALTER TABLE ticket
RENAME COLUMN codigo_barra TO codigo;

-- Alterar o nome de uma tabela
ALTER TABLE estacionamento
RENAME TO parking;

DESCRIBE setor;