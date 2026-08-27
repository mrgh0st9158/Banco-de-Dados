CREATE DATABASE escolaABC;
USE escolaABC;

CREATE TABLE sala(
idsala INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_turma VARCHAR(45) NOT NULL,
periodo VARCHAR(45) NOT NULL,
sala_idsala INT
);

CREATE TABLE turma(
idturma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_turma VARCHAR(45) NOT NULL,
periodo VARCHAR(45) NOT NULL,
sala_idsala INT,
FOREIGN KEY (sala_idsala) REFERENCES sala(idsala)
);

CREATE TABLE professor(
idprofessor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_prof VARCHAR(45) NOT NULL,
formacao_prof VARCHAR(45),
turma_idturma INT,
FOREIGN KEY(turma_idturma) REFERENCES turma(idturma)
);

CREATE TABLE aulas(
idaulas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_aula VARCHAR(45) NOT NULL,
professor_idprofessor INT,
FOREIGN KEY (professor_idprofessor) REFERENCES professor(idprofessor)
);