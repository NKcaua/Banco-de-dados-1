CREATE DATABASE ATIVIDADE2
CREATE TABLE CLIENTE (
    ID_Cliente VARCHAR(10) PRIMARY KEY,
    NomeCliente VARCHAR(50),
    EmailCliente VARCHAR(100)
);

CREATE TABLE PRODUTO (
    ID_Produto VARCHAR(10) PRIMARY KEY,
    NomeProduto VARCHAR(50),
    CategoriaProduto VARCHAR(50),
    PrecoUnitario DECIMAL(10,2)
);

CREATE TABLE NIVEL_COMISSAO (
    NivelVendedor VARCHAR(10) PRIMARY KEY,
    PercentualComissao DECIMAL(5,2)
);

CREATE TABLE VENDEDOR (
    VendedorID VARCHAR(10) PRIMARY KEY,
    NomeVendedor VARCHAR(50),
    NivelVendedor VARCHAR(10),
    FOREIGN KEY (NivelVendedor) REFERENCES NIVEL_COMISSAO(NivelVendedor)
);

CREATE TABLE VENDA (
    ID_Venda VARCHAR(10) PRIMARY KEY,
    DataVenda DATE,
    ID_Cliente VARCHAR(10),
    VendedorID VARCHAR(10),
    FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE(ID_Cliente),
    FOREIGN KEY (VendedorID) REFERENCES VENDEDOR(VendedorID)
);

CREATE TABLE ITEM_VENDA (
    ID_Venda VARCHAR(10),
    ID_Produto VARCHAR(10),
    Quantidade INT,
    DescontoAplicado DECIMAL(5,2),
    PRIMARY KEY (ID_Venda, ID_Produto),
    FOREIGN KEY (ID_Venda) REFERENCES VENDA(ID_Venda),
    FOREIGN KEY (ID_Produto) REFERENCES PRODUTO(ID_Produto)
);
