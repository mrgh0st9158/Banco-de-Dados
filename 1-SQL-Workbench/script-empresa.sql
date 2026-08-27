CREATE DATABASE empresaABC;
USE empresaABC;

CREATE TABLE empresa(
idempresa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
codigo_empresa INT NOT NULL,
rua VARCHAR(45) NOT NULL,
numero INT NOT NULL,
bairro VARCHAR(45) NOT NULL,
cidade VARCHAR(45) NOT NULL,
estado VARCHAR(45) NOT NULL,
cep INT NOT NULL
);

CREATE TABLE consultor (
idconsultor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_consultor VARCHAR(100) NOT NULL,
cpf BIGINT(11) NOT NULL,
especializacao VARCHAR(45) NOT NULL,
funcao_exercida VARCHAR(45) NOT NULL
);


CREATE TABLE unidade (
idunidade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_gerente VARCHAR(45) NOT NULL,
nome_supervisor VARCHAR(45) NOT NULL
);


CREATE TABLE departamento (
iddepartamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_departamento VARCHAR(45) NOT NULL,
sigla VARCHAR(10) NOT NULL,
centro_custo INT NOT NULL,
unidade_idunidade INT NOT NULL,
FOREIGN KEY (unidade_idunidade) REFERENCES unidade(idunidade)
);


CREATE TABLE projeto (
idprojeto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
numero_projeto INT NOT NULL,
data_inicio DATE NOT NULL,
data_fim DATE NOT NULL,
valor_projeto DECIMAL(8,2) NOT NULL,
empresa_idempresa INT,
consultor_idconsultor INT,
departamento_iddepartamento INT,
FOREIGN KEY (empresa_idempresa) REFERENCES empresa(idempresa),
FOREIGN KEY (consultor_idconsultor) REFERENCES consultor(idconsultor),
FOREIGN KEY (departamento_iddepartamento) REFERENCES departamento(iddepartamento)
);