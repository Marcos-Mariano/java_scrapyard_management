/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Marcos
 * Created: 26/05/2019
 */



/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Marcos
 * Created: 14/05/2019
 */



drop table usuarios;
 CREATE TABLE USUARIOS(
    ID BIGINT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
   , ROLE VARCHAR (200) NOT NULL
   , NAME VARCHAR (200) NOT NULL
   , LOGIN VARCHAR(20) NOT NULL
   ,password varchar (200) not null
);

DROP TABLE FORNECEDORES;
CREATE TABLE FORNECEDORES(
    ID BIGINT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
   , NAME VARCHAR (200) NOT NULL
);

DROP TABLE CLIENTES;
CREATE TABLE CLIENTES(
    ID BIGINT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
   , NAME VARCHAR (200) NOT NULL
   );




INSERT INTO USUARIOS VALUES(default, 'ADMIN', 'Administrador', 'admin','admin');
INSERT INTO CLIENTES VALUES(default, 'marcelo');
INSERT INTO PRODUTOS VALUES(default, 'Cobre', 200, 3,'kg');






DROP TABLE PRODUTOS;
CREATE TABLE PRODUTOS(
    id BIGINT not null primary key GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
    , NOMEPRODUTO VARCHAR (200) NOT NULL
    , VALOR VARCHAR (200) NOT NULL
    , QUANTIDADE VARCHAR (200) NOT NULL
    , UNIDADEMEDIDA VARCHAR (200) NOT NULL
);

DROP TABLE VENDAS;
CREATE TABLE VENDAS(
    id BIGINT not null primary key GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
    ,  VALOR varchar(220) NOT NULL
,  nomeproduto varchar(200) not null
,  vendedor varchar(200) not null
);