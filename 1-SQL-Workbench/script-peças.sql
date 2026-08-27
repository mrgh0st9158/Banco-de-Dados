CREATE DATABASE pecasABC;
USE pecasABC;

CREATE TABLE categoria(
idcategoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(45)
);

CREATE TABLE fornecedor(
idfornecedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_fornecedor VARCHAR(45) NOT NULL,
nacionalidade_fornecedor VARCHAR(45) NOT NULL
);

CREATE TABLE peca(
idpeca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_peca VARCHAR(45),
peso_peca DECIMAL(8,2),
ano_fabricacao DATE,
fornecedor_idfornecedor INT,
categoria_idcategoria INT,
FOREIGN KEY(fornecedor_idfornecedor) REFERENCES fornecedor(idfornecedor),
FOREIGN KEY(categoria_idcategoria) REFERENCES categoria(idcategoria)
);