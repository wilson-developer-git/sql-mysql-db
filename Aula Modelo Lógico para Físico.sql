
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

/* JUNÇÃO - INNER JOIN */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM TB_CLIENTE
	INNER JOIN TB_ENDERECO
	ON TB_CLIENTE.ID_CLIENTE = TB_ENDERECO.ID_CLIENTE;

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM TB_CLIENTE
INNER JOIN TB_TELEFONE
ON TB_CLIENTE.ID_CLIENTE = TB_TELEFONE.ID_CLIENTE;

/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

SELECT
	C.NOME,
	C.SEXO,
	E.BAIRRO,
	E.CIDADE,
	T.TIPO,
	T.NUMERO
FROM TB_CLIENTE C
INNER JOIN TB_ENDERECO E
ON C.ID_CLIENTE = E.ID_CLIENTE
INNER JOIN TB_TELEFONE T
ON C.ID_CLIENTE = T.ID_CLIENTE;

/* 
	DML - DATA MANIPULATION LENGUAGE
    DDL - DATA DEFINITION LENGUAGE
    DCL - DATA CONTROL LENGUAGE
    TCL - TRANSACTION CONTROL LENGUAGE
    
 */

/* DML - DATA MANIPULATION LENGUAGE */

INSERT INTO TB_CLIENTE VALUES ( NULL, 'PAULA','1767665454', 'M', 'PAULA@GMAIL.COM');
SELECT * FROM TB_CLIENTE;
INSERT INTO TB_ENDERECO VALUES (NULL, 'RUA CATARINA', 'ALVORADA', 'NITEROI','RJ',7);

/* FILTROS */
SELECT * FROM TB_CLIENTE
WHERE SEXO = 'F';

/* UPDATE */
UPDATE TB_CLIENTE
SET SEXO = 'F'
WHERE ID_CLIENTE = '7';

/* DELETE */

INSERT INTO TB_CLIENTE VALUES ( NULL, 'XXXX','0000000', 'M', 'XXX@GMAIL.COM');

SELECT * FROM TB_CLIENTE;

DELETE FROM TB_CLIENTE
WHERE ID_CLIENTE = '13';

/* DDL - DATA DEFINITION LENGUAGE */
CREATE TABLE TB_PRODUTO(
	ID_PRODUTO BIGINT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30) NOT NULL,
    PRECO INT
);

DESC TB_PRODUTO;

/* MODIFICANDO A ESTRUTURA DA TABELA */

/* CHANGE ALTERA NOME E TIPO  */
ALTER TABLE TB_PRODUTO
CHANGE PRECO VALOR_UNITARIO DECIMAL(10,2) NOT NULL;

/* MODIFY ALTERA TIPO */
ALTER TABLE TB_PRODUTO
MODIFY NOME VARCHAR(50) NOT NULL;

/* ADICIONANDO COLUNA NA TABELA */
ALTER TABLE TB_PRODUTO
ADD PESO DECIMAL(10,2);

ALTER TABLE TB_PRODUTO
ADD PESO DECIMAL(10,2)
AFTER NOME;

ALTER TABLE TB_PRODUTO
ADD PESO DECIMAL(10,2)
FIRST;

/* DELETANDO COLUNA */
ALTER TABLE TB_PRODUTO
DROP COLUMN PESO;




