
CREATE DATABASE COMERCIO;

SHOW DATABASES;

USE COMERCIO;

SHOW TABLES;

CREATE TABLE TB_CLIENTE (
	ID_CLIENTE BIGINT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30) NOT NULL,
    CPF VARCHAR(15) NOT NULL UNIQUE,
    SEXO ENUM ('M', 'F') NOT NULL,
    EMAIL VARCHAR(50) NOT NULL UNIQUE
);
DESC TB_CLIENTE;
DROP TABLE TB_CLIENTE;

CREATE TABLE TB_ENDERECO(
	ID_ENDERECO BIGINT PRIMARY KEY AUTO_INCREMENT,
    RUA VARCHAR(30) NOT NULL,
    BAIRRO VARCHAR(30) NOT NULL,
    CIDADE VARCHAR(30) NOT NULL,
    ESTADO CHAR(2),
    ID_CLIENTE BIGINT UNIQUE,
    FOREIGN KEY (ID_CLIENTE) REFERENCES TB_CLIENTE(ID_CLIENTE)
);
DESC TB_ENDERECO;
DROP TABLE TB_ENDERECO;

CREATE TABLE TB_TELEFONE(
	ID_TELEFONE BIGINT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
    NUMERO VARCHAR(10) NOT NULL,
    ID_CLIENTE BIGINT,
    FOREIGN KEY (ID_CLIENTE) REFERENCES TB_CLIENTE(ID_CLIENTE)
);
DESC TB_TELEFONE;
DROP TABLE TB_TELEFONE;

INSERT INTO TB_CLIENTE VALUES ( NULL, 'JOÃO','00000000001', 'M', 'JOÃO@GMAIL.COM' );
INSERT INTO TB_CLIENTE VALUES ( NULL, 'CARLA','00000000002', 'F', 'CARLA@GMAIL.COM' );
INSERT INTO TB_CLIENTE VALUES ( NULL, 'ANA','00000000003', 'F', 'ANA@GMAIL.COM' );
INSERT INTO TB_CLIENTE VALUES ( NULL, 'CLARA','00000000004', 'M', 'CLARA@GMAIL.COM' );
INSERT INTO TB_CLIENTE VALUES ( NULL, 'JORGE','00000000005', 'M', 'JORGE@GMAIL.COM' );
INSERT INTO TB_CLIENTE VALUES ( NULL, 'CELIA','00000000006', 'F', 'CELIA@GMAIL.COM' );

SELECT * FROM TB_CLIENTE;

INSERT INTO TB_ENDERECO VALUES (NULL, 'RUA PARAGUAÇU', 'CENTRO', 'SÃO PAULO','SP',1);
INSERT INTO TB_ENDERECO VALUES (NULL, 'RUA EUCLIDES DA CUNHA','JARDIM', 'NOVA OLINDA','CE',5);
INSERT INTO TB_ENDERECO VALUES (NULL, 'RUA PADRE CICERO', 'TRIANGULO', 'JUAZEIRO DO NORTE','CE',6);
INSERT INTO TB_ENDERECO VALUES (NULL, 'RUA DAS  DORES', 'ALCARIAS', 'RIO DE JANEIRO','RJ',4);
INSERT INTO TB_ENDERECO VALUES (NULL, 'RUA MONTES CLOAROS', 'CENTRO', 'RECIFE','PE',3);
INSERT INTO TB_ENDERECO VALUES (NULL, 'RUA EMILIO SANTOS', 'PEDRINHAS', 'OURICURI','PE',2);

SELECT * FROM TB_ENDERECO;

INSERT INTO TB_TELEFONE VALUES (NULL, 'RES', '1867165464', 5);
INSERT INTO TB_TELEFONE VALUES (NULL, 'COM', '5645646546', 5);
INSERT INTO TB_TELEFONE VALUES (NULL, 'COM', '6156541564', 1);
INSERT INTO TB_TELEFONE VALUES (NULL, 'CEL', '6574186787', 2);
INSERT INTO TB_TELEFONE VALUES (NULL, 'CEL', '1454545442', 1);
INSERT INTO TB_TELEFONE VALUES (NULL, 'CEL', '6541616416', 3);
INSERT INTO TB_TELEFONE VALUES (NULL, 'RES', '4556674646', 3);
INSERT INTO TB_TELEFONE VALUES (NULL, 'COM', '4444545646', 1);
INSERT INTO TB_TELEFONE VALUES (NULL, 'COM', '7154545454', 5);
INSERT INTO TB_TELEFONE VALUES (NULL, 'RES', '4154641646', 2);

SELECT * FROM TB_TELEFONE;

/* PROJEÇÃO */
SELECT 2 + 4 AS SOMA;

/* SELEÇÃO */
SELECT NOME, SEXO, EMAIL
FROM TB_CLIENTE 
WHERE SEXO = 'F';

SELECT NUMERO
FROM TB_TELEFONE
WHERE TIPO = 'CEL';

