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

 CREATE TABLE USUARIOS(
    ID BIGINT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
   , ROLE VARCHAR (200) NOT NULL
   , NAME VARCHAR (200) NOT NULL
   , LOGIN VARCHAR(20) NOT NULL
  ,  PASSWORDHASH BIGINT NOT NULL
);


CREATE TABLE FORNECEDORES(
    ID BIGINT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
   , NAME VARCHAR (200) NOT NULL
);


CREATE TABLE CLIENTES(
    ID BIGINT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
   , NAME VARCHAR (200) NOT NULL
   );




INSERT INTO USUARIOS VALUES(default, 'ADMIN', 'Administrador', 'admin', 1509442);





CREATE TABLE PRODUTOS(
    id BIGINT not null primary key GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
    , NOME VARCHAR (200) NOT NULL
    , VALOR DOUBLE PRECISION NOT NULL
    , QUANTIDADE DOUBLE NOT NULL
    , UNIDADEMEDIDA VARCHAR (200) NOT NULL
);

;
CREATE TABLE VENDAS(
    id BIGINT not null primary key GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
    ,  ALOR DOUBLE PRECISION
);