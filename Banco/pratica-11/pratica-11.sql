DROP DATABASE IF EXISTS lanchonete;
CREATE DATABASE lanchonete;
USE lanchonete;
CREATE TABLE unidade (
  codigo   INT AUTO_INCREMENT PRIMARY KEY,
  nome     VARCHAR(60) NOT NULL,
  endereco VARCHAR(150) NULL
) COMMENT = 'Unidades da rede de lanchonete';
CREATE TABLE cliente (
  codigo   INT AUTO_INCREMENT PRIMARY KEY,
  nome     VARCHAR(80) NOT NULL,
  telefone VARCHAR(15) UNIQUE
);
CREATE TABLE produto (
  codigo       INT AUTO_INCREMENT PRIMARY KEY,
  nome         VARCHAR(60) NOT NULL UNIQUE,
  preco_tabela DECIMAL(6,2) NOT NULL
               CHECK (preco_tabela > 0)
);
CREATE TABLE entregador (
  codigo INT AUTO_INCREMENT PRIMARY KEY,
  nome   VARCHAR(60) NOT NULL
);
CREATE TABLE pedido (
  numero            INT AUTO_INCREMENT PRIMARY KEY,
  data_hora         DATETIME NOT NULL,
  cliente_codigo    INT NOT NULL,
  unidade_codigo    INT NOT NULL,
  entregador_codigo INT NULL,
  FOREIGN KEY (cliente_codigo) REFERENCES cliente (codigo),
  FOREIGN KEY (unidade_codigo) REFERENCES unidade (codigo),
  FOREIGN KEY (entregador_codigo) REFERENCES entregador (codigo)
);
CREATE TABLE item_pedido (
  pedido_numero INT NOT NULL,
  produto_codigo INT NOT NULL,
  quantidade    INT NOT NULL CHECK (quantidade > 0),
  preco_cobrado DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (pedido_numero, produto_codigo),
  FOREIGN KEY (pedido_numero) REFERENCES pedido (numero),
  FOREIGN KEY (produto_codigo) REFERENCES produto (codigo)
);
ALTER TABLE produto ADD disponivel CHAR(1) NOT NULL DEFAULT 'S';
CREATE TABLE estoque (
  unidade_codigo INT NOT NULL,
  produto_codigo INT NOT NULL,
  quantidade     INT NOT NULL DEFAULT 0,
  PRIMARY KEY (unidade_codigo, produto_codigo),
  FOREIGN KEY (unidade_codigo) REFERENCES unidade (codigo),
  FOREIGN KEY (produto_codigo) REFERENCES produto (codigo)
);