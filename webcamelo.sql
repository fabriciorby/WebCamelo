DROP DATABASE IF EXISTS webcamelo;

CREATE DATABASE webcamelo;
USE webcamelo;

CREATE TABLE estados (
    idEstado INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(255),
    PRIMARY KEY (idEstado)
);

CREATE TABLE tipoUsuario (
    idUsuario INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(255),
    PRIMARY KEY (idUsuario)
);

CREATE TABLE usuarios (
    id INT NOT NULL AUTO_INCREMENT,
    login VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    tipoUsuario INT NOT NULL,
    idEstado INT NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	carteira DECIMAL(10 , 2) NOT NULL,
    FOREIGN KEY (idEstado)
        REFERENCES estados (idEstado),
	FOREIGN KEY (tipoUsuario)
        REFERENCES tipoUsuario (idUsuario),
    PRIMARY KEY (id),
    CONSTRAINT UNIQUE (login),
    CONSTRAINT UNIQUE (email),
    CONSTRAINT UNIQUE (cpf)
);

CREATE TABLE estadoProduto (
    idEstadoProduto INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(255),
    PRIMARY KEY (idEstadoProduto)
);

CREATE TABLE estadoVenda (
    idEstadoVenda INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(255),
    PRIMARY KEY (idEstadoVenda)
);

CREATE TABLE produtos (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(10 , 2) NOT NULL,
    estadoProduto INT NOT NULL,
    estadoVenda INT NOT NULL,
    idVendedor INT NOT NULL,
    FOREIGN KEY (estadoProduto)
        REFERENCES estadoProduto (idEstadoProduto),
    FOREIGN KEY (estadoVenda)
        REFERENCES estadoVenda (idEstadoVenda),
    FOREIGN KEY (idVendedor)
        REFERENCES usuarios (id),
    PRIMARY KEY (id)
);

INSERT INTO estados (descricao)
VALUES
('Acre'),
('Alagoas'),
('Amapá'),
('Amazonas'),
('Bahia'),
('Ceará'),
('Distrito Federal'),
('Espírito Santo'),
('Goiás'),
('Maranhão'),
('Mato Grosso'),
('Mato Grosso do Sul'),
('Minas Gerais'),
('Pará'),
('Paraíba'),
('Paraná'),
('Pernambuco'),
('Piauí'),
('Rio de Janeiro'),
('Rio Grande do Norte'),
('Rio Grande do Sul'),
('Rondônia'),
('Roraima'),
('Santa Catarina'),
('São Paulo'),
('Sergipe'),
('Tocantins');

INSERT INTO tipoUsuario (descricao) VALUES ('Comum'), ('Administrador');
INSERT INTO estadoProduto (descricao) VALUES ('Novo'), ('Usado');
INSERT INTO estadoVenda (descricao) VALUES ('À venda'), ('Vendido');

INSERT INTO usuarios
(login, senha, nome, email, endereco, tipoUsuario, idEstado, cpf, carteira)
VALUES
('fabriciorby', '123', 'Fabrício Yamamoto', 'fabriciorby@lol.com', 'Rua Dona Maria Custódia', 2, 25, 44391496541, 100.00),
('teste.teste', 'teste123', 'Teste da Silva', 'teste@teste.com', 'Rua do Teste', 1, 12, 12365478900, 0.50),
('alo.voce', 'ai123', 'Me da Dinheiro', 'alo@voce.ai', 'Al. Dinheiro Ai', 1, 19, 45678123654, 0.15),
('batman123', 'coringa123', 'Bruce Wayne', 'batman.oficial@hotmail.com', 'Batcaverna', 1, 7, 7894561230, 0.00);

INSERT INTO produtos
(nome, descricao, preco, estadoProduto, estadoVenda, idVendedor)
VALUES
('Melocotom', 'Brinquedo da Eliana, raríssimo.', 22.50, 1, 1, 1),
('Olho de Thundera', 'O olho que tudo vê.', 45.00, 1, 1, 1),
('Beyblade', 'Let it rip', 15.00, 1, 1, 1),
('Bandana de Konoha', 'Utilizada pelos ninjas da aldeia da folha.', 40.00, 1, 1, 1);