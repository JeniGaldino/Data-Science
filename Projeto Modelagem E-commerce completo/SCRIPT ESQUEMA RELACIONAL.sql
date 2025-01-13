/*---Criação do banco de dados para o cenário de E-commerce*/

drop database ecommerce;
create database ecommerce;
use ecommerce;
show tables;
/*criando tabela cliente*/
CREATE TABLE Clients (
  idClient INT NOT NULL AUTO_INCREMENT,  
  Fname VARCHAR(50) NOT NULL,            
  LName VARCHAR(50) NOT NULL,           
  BirthDate DATE NOT NULL,               
  PRIMARY KEY (idClient)               
);
desc clients;
/*Criando tabela Categoria*/
CREATE TABLE CategoryProduct (
  idCategoryProduct INT NOT NULL AUTO_INCREMENT,
  CategoryName VARCHAR(45) NOT NULL DEFAULT 'Outros',
  PRIMARY KEY (idCategoryProduct));
desc CategoryProduct;

/*criando tabela produto*/
CREATE TABLE Product (
  ProductId INT NOT NULL AUTO_INCREMENT,
  Pname VARCHAR(45) NOT NULL,
  Description VARCHAR(100) NOT NULL,
  Price decimal(10,2) NOT NULL DEFAULT 0.1,
  Size VARCHAR(10),
  ProductRate FLOAT DEFAULT 0,
  idCategoryProduct INT NOT NULL, 
  PRIMARY KEY (ProductId),
  INDEX fk_Product_idCategoryProduct_idx (idCategoryProduct ASC) VISIBLE,
  CONSTRAINT fk_Product_idCategoryProduct
    FOREIGN KEY (idCategoryProduct)
    REFERENCES CategoryProduct (idCategoryProduct)
    ON DELETE CASCADE
);
desc product;

/*criando tabela pedido*/

CREATE TABLE Orders (
  OrderId INT NOT NULL AUTO_INCREMENT,
  OrderStatus ENUM('Em andamento', 'Em processamento', 'Faturado', 'Enviado', 'Entregue', 'Cancelado', 'Confirmado') NOT NULL DEFAULT 'Em andamento',
  OrderDescription VARCHAR(255) NULL,
  idClient INT NOT NULL,
  Freight FLOAT,
  PRIMARY KEY (orderId), 
  INDEX fk_Orders_idClient_idx (idClient ASC) VISIBLE,
  CONSTRAINT fk_Orders_Clients
    FOREIGN KEY (idClient)
    REFERENCES Clients (idClient)
    ON DELETE CASCADE
);
desc orders;
/* Criando a tabela de Pagamentos */
CREATE TABLE Payment (
  PaymentId INT NOT NULL AUTO_INCREMENT,
  OrderId INT NOT NULL,
  PaymentMethod ENUM('Cartão', 'Dinheiro', 'PIX', 'Boleto') NOT NULL,
  PaymentStatus ENUM('Pendente', 'Confirmado', 'Falhou') NOT NULL,
  PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  Amount decimal(10,2) NOT NULL,
  TransactionId VARCHAR(100) NULL, 
  PRIMARY KEY (PaymentId),
  INDEX fk_Payment_Orders_idx (OrderId ASC) VISIBLE,
  CONSTRAINT fk_Payment_Orders
    FOREIGN KEY (OrderId)
    REFERENCES Orders (OrderId)
    ON DELETE CASCADE
);
desc payment;
/*Criando tabela estoque*/
CREATE TABLE Stock (
  idStock INT NOT NULL,
  Quantity INT NOT NULL default 0,
  idCategoryProduct INT NOT NULL, 
  PRIMARY KEY (idStock),
  INDEX fk_Stock_CategoryProduct_idx (idCategoryProduct ASC) VISIBLE,
  CONSTRAINT fk_Stock_CategoryProduct
    FOREIGN KEY (idCategoryProduct)
    REFERENCES CategoryProduct (idCategoryProduct)
    ON DELETE CASCADE)
    ;
    desc stock;
/*Criando tabela fornecedor*/
CREATE TABLE Supplier (
  idSupplier INT NOT NULL AUTO_INCREMENT,
  CorporateName VARCHAR(45) NOT NULL,
  idCategoryProduct INT NOT NULL,
  PRIMARY KEY (idSupplier, idCategoryProduct),
  INDEX fk_Supplier_CategoryProduct_idx (idCategoryProduct ASC) VISIBLE,
  CONSTRAINT fk_Supplier_CategoryProduct
    FOREIGN KEY (idCategoryProduct)
    REFERENCES CategoryProduct (idCategoryProduct)
    ON DELETE CASCADE );
desc supplier;
/*Criando tabela vendedor*/
CREATE TABLE Seller (
  idSeller INT NOT NULL AUTO_INCREMENT,
  CorporateName VARCHAR(45) NOT NULL,
  CompanyName VARCHAR(45) NOT NULL,
  PRIMARY KEY (idSeller));
desc Seller;
/*criando tabela geral para endereços*/
CREATE TABLE Address (
  idAddress INT NOT NULL AUTO_INCREMENT,  
  Street VARCHAR(255) NOT NULL,           
  Number VARCHAR(20) NOT NULL,            
  Neighborhood VARCHAR(100) NOT NULL,    
  City VARCHAR(100) NOT NULL,            
  State CHAR(2) NOT NULL,               
  ZIPCode CHAR(8) NOT NULL,             
  AddressType ENUM('Residencial', 'Comercial') NOT NULL,
  idClient INT NULL,                     
  idSeller INT NULL,  
  idStock INT NULL,
  PRIMARY KEY (idAddress),
  CONSTRAINT fk_Address_Client FOREIGN KEY (idClient) REFERENCES Clients(idClient) ON DELETE CASCADE,
  CONSTRAINT fk_Address_Seller FOREIGN KEY (idSeller) REFERENCES Seller(idSeller) ON DELETE CASCADE,
  CONSTRAINT fk_Address_Stock FOREIGN KEY (idStock) REFERENCES Stock(idStock) ON DELETE CASCADE
);
desc Address;
/*Criando a tabela de informações gerais para clientes/vendedores/fornecedores*/
CREATE TABLE ContactInfo (
  idContactInfo INT NOT NULL AUTO_INCREMENT,  
  Phone VARCHAR(20) NULL,                     
  Email VARCHAR(100) NULL,                    
  CPF CHAR(14) NULL,                          
  CNPJ CHAR(14) NULL,                         
  EntityType ENUM('Client', 'Seller', 'Supplier') NOT NULL,  
  idClient INT NULL,                           
  idSeller INT NULL,                           
  idSupplier INT NULL,                         
  PRIMARY KEY (idContactInfo),                 
  CONSTRAINT fk_ContactInfo_Client FOREIGN KEY (idClient) 
    REFERENCES Clients(idClient) 
    ON DELETE CASCADE,                        
  CONSTRAINT fk_ContactInfo_Seller FOREIGN KEY (idSeller) 
    REFERENCES Seller(idSeller) 
    ON DELETE CASCADE,                        --
  CONSTRAINT fk_ContactInfo_Supplier FOREIGN KEY (idSupplier) 
    REFERENCES Supplier(idSupplier) 
    ON DELETE CASCADE,                        
  CHECK ( (EntityType = 'Client' AND idClient IS NOT NULL) OR 
         (EntityType = 'Seller' AND idSeller IS NOT NULL) OR
         (EntityType = 'Supplier' AND idSupplier IS NOT NULL) )
);
Desc ContactInfo;
-- RELAÇÃO PRODUTO VENDEDOR
CREATE TABLE Products_Seller (
  idSeller INT NOT NULL,
  ProductId INT NOT NULL,
  Quantity INT NULL,
  PRIMARY KEY (idSeller, ProductId),
  INDEX fk_Seller_has_Product_Product1_idx (ProductId ASC) VISIBLE,
  INDEX fk_Seller_has_Product_Seller1_idx (idSeller ASC) VISIBLE,
  CONSTRAINT fk_Seller_has_Product_Seller1
    FOREIGN KEY (idSeller)
    REFERENCES Seller (idSeller)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Seller_has_Product
    FOREIGN KEY (ProductId)
    REFERENCES Product (ProductId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
desc products_seller;
-- Relaçãao produto pedido
CREATE TABLE Product_Order (
  ProductId INT NOT NULL,
  OrderId INT NOT NULL,
  idClient INT NOT NULL,
  Quantity VARCHAR(45) NULL,
  OrderStatus ENUM('Disponível', 'Indisponível') NULL DEFAULT 'Disponível',
  PRIMARY KEY (ProductId, OrderId, idClient),
  INDEX fk_Product_has_Order_Order11_idx (OrderId ASC, idClient ASC) VISIBLE,
  INDEX fk_Product_has_Order_Product1_idx (ProductId ASC) VISIBLE,
  UNIQUE INDEX Product_ProductId_UNIQUE (ProductId ASC) VISIBLE,
  UNIQUE INDEX Order_OrderId_UNIQUE (OrderId ASC) VISIBLE,
  CONSTRAINT fk_Product_has_Order_Product1
    FOREIGN KEY (ProductId)
    REFERENCES Product (ProductId),
  CONSTRAINT fk_Product_has_Order_Order1
    FOREIGN KEY (OrderId , idClient)
    REFERENCES Orders (OrderId , idClient)
   );
desc product_order;
-- Relação em estoque
CREATE TABLE InStock (
  ProductId INT NOT NULL,
  idStock INT NOT NULL,
  PRIMARY KEY (ProductId, idStock),
  INDEX fk_Product_has_Stock_Stock1_idx (idStock ASC) VISIBLE,
  INDEX fk_Product_has_Stock_Product1_idx (ProductId ASC) VISIBLE,
  CONSTRAINT fk_Product_has_Stock_Product1
    FOREIGN KEY (ProductId)
    REFERENCES Product (ProductId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Product_has_Stock_Stock1
    FOREIGN KEY (idStock)
    REFERENCES Stock (idStock))
;

desc InStock;
-- Relação Disponibilidade de produto

CREATE TABLE ProductAvaiability (
  ProductId INT NOT NULL,
  idSupplier INT NOT NULL,
  Quantity INT NOT NULL default 1,
  Avaiability ENUM('SIM', 'NÃO') NULL DEFAULT 'SIM',
  PRIMARY KEY (ProductId, idSupplier),
  INDEX fk_Product_has_Supplier_Supplier_idx (idSupplier ASC) VISIBLE,
  INDEX fk_Product_has_Supplier_Product_idx (ProductId ASC) VISIBLE,
  CONSTRAINT fk_Product_has_Supplier_Product
    FOREIGN KEY (ProductId)
    REFERENCES Product (ProductId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Product_has_Supplier_Supplier1
    FOREIGN KEY (idSupplier)
    REFERENCES Supplier (idSupplier)
    );
desc ProductAvaiability;

-- Tabela Shipment
CREATE TABLE Shipment (
  idShipment INT NOT NULL AUTO_INCREMENT,
  OrderId INT NOT NULL, -- Relacionamento com a tabela de Pedidos
  TrackingCode VARCHAR(50) NOT NULL, -- Código de rastreio
  ShippingStatus ENUM('Pendente', 'Em trânsito', 'Entregue', 'Cancelado') NOT NULL, -- Status da entrega
  ShippingDate DATE NULL, -- Data de envio
  DeliveryDate DATE NULL, -- Data de entrega
  PRIMARY KEY (idShipment),
  INDEX fk_Shipment_OrderId_idx (OrderId ASC),
  CONSTRAINT fk_Shipment_OrderId FOREIGN KEY (OrderId) 
    REFERENCES Orders (OrderId)
    ON DELETE CASCADE
);
desc shipment;

