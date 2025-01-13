use ecommerce;
show tables;

-- inserindo dados na tabela clients
INSERT INTO Clients (Fname, LName, BirthDate)
VALUES 
('João', 'Silva', '1990-05-12'),
('Maria', 'Oliveira', '1985-08-23'),
('Carlos', 'Santos', '1992-02-14'),
('Ana', 'Costa', '1987-09-10'),
('Paulo', 'Pereira', '1995-01-15'),
('Beatriz', 'Souza', '1993-07-20'),
('Lucas', 'Gomes', '1991-03-30'),
('Carla', 'Lima', '1994-04-05'),
('Juliano', 'Melo', '1988-06-17'),
('Fernanda', 'Silva', '1990-11-22');

INSERT INTO Clients (Fname, LName, BirthDate)
VALUES 
('Ricardo', 'Almeida', '1982-02-28'),
('Juliana', 'Barros', '1996-06-16'),
('Lucas', 'Martins', '1990-04-10'),
('Tatiane', 'Moura', '1987-09-22'),
('Felipe', 'Costa', '1994-12-05'),
('Cláudia', 'Dias', '1988-03-14'),
('Thiago', 'Oliveira', '1992-11-27'),
('Larissa', 'Freitas', '1995-07-03'),
('Eduardo', 'Pereira', '1985-08-11'),
('Vanessa', 'Nascimento', '1991-01-17');
SELECT * FROM Clients;

-- inserindo dados na tabela CategorYProducts
INSERT INTO CategoryProduct (CategoryName)
VALUES 
('Eletrônicos'),
('Roupas'),
('Alimentos'),
('Móveis'),
('Beleza'),
('Livros'),
('Brinquedos'),
('Calçados'),
('Esportes'),
('Ferramentas');

INSERT INTO CategoryProduct (CategoryName)
VALUES 
('Tecnologia'),
('Acessórios'),
('Alimentos e Bebidas'),
('Móveis e Decoração'),
('Cuidados Pessoais'),
('Livros e Cursos'),
('Brinquedos e Jogos'),
('Roupas e Moda'),
('Esportes e Lazer'),
('Ferramentas e Equipamentos');


-- Inserindo dados na tabela Product
INSERT INTO Product (Pname, Description, Price, Size, ProductRate, idCategoryProduct)
VALUES 
('Smartphone', 'Smartphone com 4GB de RAM', 1200.00, 'M', 4.5, 1),
('Camisa Polo', 'Camisa polo masculina', 89.90, 'G', 4.2, 2),
('Arroz', 'Arroz 5kg', 15.99, NULL, 4.8, 3),
('Sofá', 'Sofá de 3 lugares', 799.99, 'L', 4.3, 4),
('Shampoo', 'Shampoo para cabelos secos', 25.50, '500ml', 4.7, 5),
('Livro Python', 'Aprenda Python do zero', 40.00, NULL, 4.9, 6),
('Boneca', 'Boneca de pelúcia', 45.00, NULL, 4.4, 7),
('Tênis Nike', 'Tênis Nike para corrida', 250.00, '40', 4.8, 8),
('Raquete de Tênis', 'Raquete de tênis profissional', 150.00, NULL, 4.6, 9),
('Furadeira', 'Furadeira elétrica', 120.00, NULL, 4.2, 10);


INSERT INTO Product (Pname, Description, Price, Size, ProductRate, idCategoryProduct)
VALUES 
('Notebook Dell', 'Notebook Dell com 8GB de RAM e 512GB SSD', 4500.00, 'Único', 4.7, 1),
('Óculos de Sol', 'Óculos de sol com lente polarizada', 150.00, 'M', 4.2, 2),
('Café Especial', 'Café em grãos de qualidade premium', 25.90, NULL, 4.9, 3),
('Sofá Retrátil', 'Sofá retrátil 3 lugares, cinza', 2200.00, 'L', 4.6, 4),
('Creme Hidratante', 'Creme hidratante para pele sensível', 39.99, '200ml', 4.3, 5),
('Curso de Marketing', 'Curso online de marketing digital', 499.00, NULL, 5.0, 6),
('Boneco de Ação', 'Boneco de ação dos Vingadores', 80.00, 'P', 4.5, 7),
('Vestido Feminino', 'Vestido de verão estampado', 129.90, 'M', 4.1, 8),
('Raquete de Badminton', 'Raquete de badminton profissional', 120.00, NULL, 4.4, 9),
('Furadeira Bosch', 'Furadeira elétrica Bosch 500W', 150.00, NULL, 4.2, 10);

-- Inserindo dados na tabela Orders
INSERT INTO Orders (OrderStatus, OrderDescription, idClient, Freight)
VALUES 
('Em andamento', 'Pedido de smartphones', 1, 20.50),
('Faturado', 'Pedido de roupas', 2, 10.00),
('Enviado', 'Pedido de alimentos', 3, 5.00),
('Em andamento', 'Pedido de móveis', 4, 30.00),
('Faturado', 'Pedido de beleza', 5, 15.00),
('Enviado', 'Pedido de livros', 6, 12.00),
('Em andamento', 'Pedido de brinquedos', 7, 8.00),
('Faturado', 'Pedido de calçados', 8, 18.00),
('Enviado', 'Pedido de esportes', 9, 25.00),
('Em andamento', 'Pedido de ferramentas', 10, 40.00);

INSERT INTO Orders (OrderStatus, OrderDescription, idClient, Freight)
VALUES 
('Em Andamento', 'Compra de notebook Dell', 11, 40.00),
('Faturado', 'Óculos de sol e acessórios', 12, 12.00),
('Enviado', 'Compra de café especial', 13, 5.50),
('Em Andamento', 'Compra de sofá retrátil', 14, 60.00),
('Faturado', 'Creme hidratante e cosméticos', 5, 8.00),
('Enviado', 'Curso online de marketing', 16, 10.00),
('Em Andamento', 'Boneco de ação Avengers', 17, 7.00),
('Faturado', 'Vestido feminino e roupas', 18, 15.00),
('Enviado', 'Raquete de badminton', 19, 18.00),
('Em Andamento', 'Furadeira Bosch e ferramentas', 20, 22.00);

-- Inserindo dados na tabela Payment
INSERT INTO Payment (OrderId, PaymentMethod, PaymentStatus, Amount, TransactionId)
VALUES 
(1, 'Cartão', 'Confirmado', 1200.00, 'T123456789'),
(2, 'Boleto', 'Pendente', 89.90, NULL),
(3, 'PIX', 'Confirmado', 15.99, 'T987654321'),
(4, 'Cartão', 'Pendente', 799.99, NULL),
(5, 'Boleto', 'Confirmado', 25.50, 'T11223344'),
(6, 'PIX', 'Confirmado', 40.00, 'T22334455'),
(7, 'Cartão', 'Confirmado', 45.00, 'T33445566'),
(8, 'Boleto', 'Pendente', 250.00, NULL),
(9, 'PIX', 'Confirmado', 150.00, 'T44556677'),
(10, 'Cartão', 'Pendente', 120.00, NULL);

INSERT INTO Payment (OrderId, PaymentMethod, PaymentStatus, Amount, TransactionId)
VALUES 
(11, 'Cartão', 'Confirmado', 4500.00, 'TX1234567890'),
(12, 'Boleto', 'Pendente', 150.00, NULL),
(13, 'PIX', 'Confirmado', 25.90, 'TX9876543210'),
(14, 'Cartão', 'Pendente', 2200.00, NULL),
(15, 'Boleto', 'Confirmado', 39.99, 'TX1122334455'),
(16, 'PIX', 'Confirmado', 499.00, 'TX5566778899'),
(17, 'Cartão', 'Confirmado', 80.00, 'TX6677889900'),
(18, 'Boleto', 'Pendente', 129.90, NULL),
(19, 'PIX', 'Confirmado', 120.00, 'TX1231231234'),
(20, 'Cartão', 'Pendente', 150.00, NULL);

-- Inserindo dados na tabela Stock
INSERT INTO Stock (idStock, Quantity, idCategoryProduct)
VALUES 
(1, 100, 1),
(2, 50, 2),
(3, 200, 3),
(4, 80, 4),
(5, 60, 5),
(6, 90, 6),
(7, 120, 7),
(8, 70, 8),
(9, 150, 9),
(10, 200, 10);


INSERT INTO Stock (idStock, Quantity, idCategoryProduct)
VALUES 
(11, 50, 1),
(12, 100, 2),
(13, 200, 3),
(14, 70, 4),
(15, 150, 5),
(16, 200, 6),
(17, 120, 7),
(18, 300, 8),
(19, 100, 9),
(20, 250, 10);

-- Inserindo dados na tabela Supplier
INSERT INTO Supplier (CorporateName, idCategoryProduct)
VALUES 
('Fornecedor Eletrônicos Ltda', 1),
('Moda & Cia', 2),
('Comércio Alimentos', 3),
('Móveis e Estofados', 4),
('Cosméticos do Brasil', 5),
('Editora Livros & Cia', 6),
('Brinquedos & Diversão', 7),
('Calçados Fashion', 8),
('Esportes Brasil', 9),
('Ferramentas Power Tools', 10);

INSERT INTO Supplier (CorporateName, idCategoryProduct)
VALUES 
('Tech Supplies', 11),
('Moda e Estilo', 12),
('Alimentos Premium', 13),
('Casa & Decoração', 14),
('Beleza & Cia', 15),
('Livros & Cursos', 16),
('Diversão Ltda', 17),
('Fashion Store', 18),
('Sport Equip', 19),
('Ferramentas Pro', 20);
-- Inserindo dados na tabela Seller
INSERT INTO Seller (CorporateName, CompanyName)
VALUES 
('Vendas Eletrônicas S.A.', 'Vendas Eletrônicas'),
('Roupas Fina', 'Roupas Fina Ltda'),
('Alimentos Boa Vista', 'Alimentos Boa Vista Ltda'),
('Móveis Conforto', 'Móveis Conforto Ltda'),
('Beleza Pura', 'Beleza Pura Ltda'),
('Livros e Cultura', 'Livros e Cultura S.A.'),
('Brinquedos Diversão', 'Brinquedos Diversão Ltda'),
('Calçados Flex', 'Calçados Flex Ltda'),
('Esportes Mundo', 'Esportes Mundo Ltda'),
('Ferramentas Expert', 'Ferramentas Expert Ltda');

INSERT INTO Seller (CorporateName, CompanyName)
VALUES 
('Eletronics Corp', 'Vendas Eletrônicas'),
('Style Wear', 'Moda e Estilo Ltda'),
('Gourmet Food', 'Alimentos Gourmet S.A.'),
('Decorando', 'Decorações e Móveis S.A.'),
('Cosmeticos Pura', 'Beleza Pura Ltda'),
('Livros & Cultura', 'Livros e Educação Ltda'),
('Brinquedos e Cia', 'Brinquedos Diversão Ltda'),
('Fashion World', 'Moda e Roupas Ltda'),
('Sport Gear', 'Esportes Equipamentos Ltda'),
('Ferramentas Tools', 'Ferramentas e Equipamentos Ltda');

-- Inserindo dados na tabela Addres
INSERT INTO Address (Street, Number, Neighborhood, City, State, ZIPCode, AddressType, idClient, idSeller, idStock)
VALUES 
('Rua A', '123', 'Centro', 'São Paulo', 'SP', '01000000', 'Residencial', 1, NULL, 1),
('Rua B', '456', 'Jardim das Flores', 'Rio de Janeiro', 'RJ', '20000000', 'Comercial', NULL, 1, 2),
('Rua C', '789', 'Vila Nova', 'Belo Horizonte', 'MG', '30100000', 'Residencial', 2, NULL, 3),
('Rua D', '101', 'Vila Imperial', 'Curitiba', 'PR', '80200000', 'Comercial', NULL, 2, 4),
('Rua E', '202', 'Centro', 'Porto Alegre', 'RS', '90000000', 'Residencial', 3, NULL, 5),
('Rua F', '303', 'Jardim das Palmeiras', 'Salvador', 'BA', '40000000', 'Comercial', NULL, 3, 6),
('Rua G', '404', 'Vila Bela', 'Fortaleza', 'CE', '60000000', 'Residencial', 4, NULL, 7),
('Rua H', '505', 'Vila dos Limoeiros', 'Manaus', 'AM', '70000000', 'Comercial', NULL, 4, 8),
('Rua I', '606', 'Rua do Sol', 'Florianópolis', 'SC', '80000000', 'Residencial', 5, NULL, 9),
('Rua J', '707', 'Vila Sol Nascente', 'Recife', 'PE', '90001000', 'Comercial', NULL, 5, 10);

INSERT INTO Address (Street, Number, Neighborhood, City, State, ZIPCode, AddressType, idClient, idSeller, idStock)
VALUES 
('Rua Nova', '88', 'Centro', 'São Paulo', 'SP', '01020000', 'Residencial', 1, NULL, 1),
('Avenida Brasil', '456', 'Jardim América', 'Rio de Janeiro', 'RJ', '20030000', 'Comercial', NULL, 1, 2),
('Rua do Sol', '789', 'Vila das Flores', 'Belo Horizonte', 'MG', '30140000', 'Residencial', 2, NULL, 3),
('Rua das Palmeiras', '101', 'Vila Imperial', 'Curitiba', 'PR', '80250000', 'Comercial', NULL, 2, 4),
('Rua das Acácias', '202', 'Centro', 'Porto Alegre', 'RS', '90060000', 'Residencial', 3, NULL, 5),
('Rua das Orquídeas', '303', 'Vila das Árvores', 'Salvador', 'BA', '40070000', 'Comercial', NULL, 3, 6),
('Rua do Limoeiro', '404', 'Vila Bela', 'Fortaleza', 'CE', '60080000', 'Residencial', 4, NULL, 7),
('Avenida das Nações', '505', 'Vila Jardim', 'Manaus', 'AM', '70090000', 'Comercial', NULL, 4, 8),
('Rua do Cruzeiro', '606', 'Rua do Sol', 'Florianópolis', 'SC', '80100000', 'Residencial', 5, NULL, 9),
('Rua São João', '707', 'Vila Horizonte', 'Recife', 'PE', '90011000', 'Comercial', NULL, 5, 10);

-- Inserindo dados na tabela ContactInfo
INSERT INTO ContactInfo (Phone, Email, CPF, CNPJ, EntityType, idClient, idSeller, idSupplier)
VALUES 
('11987654321', 'cliente1@email.com', '12345678901', NULL, 'Client', 1, NULL, NULL),
('11998765432', 'cliente2@email.com', '23456789012', NULL, 'Client', 2, NULL, NULL),
('11999887766', 'cliente3@email.com', '34567890123', NULL, 'Client', 3, NULL, NULL),
('11998887777', 'cliente4@email.com', '45678901234', NULL, 'Client', 4, NULL, NULL),
('11997766554', 'cliente5@email.com', '56789012345', NULL, 'Client', 5, NULL, NULL),
('11992223344', 'vendedor1@email.com', NULL, '12345678000199', 'Seller', NULL, 1, NULL),
('11993334455', 'vendedor2@email.com', NULL, '23456789000188', 'Seller', NULL, 2, NULL),
('11994445566', 'vendedor3@email.com', NULL, '34567890000177', 'Seller', NULL, 3, NULL),
('11995556677', 'fornecedor1@email.com', NULL, '98765432000155', 'Supplier', NULL, NULL, 1),
('11996667788', 'fornecedor2@email.com', NULL, '87654321000144', 'Supplier', NULL, NULL, 2);

INSERT INTO ContactInfo (Phone, Email, CPF, CNPJ, EntityType, idClient, idSeller, idSupplier)
VALUES 
('11987654321', 'ricardo@email.com', '12345678901', NULL, 'Client', 11, NULL, NULL),
('11998765432', 'juliana@email.com', '23456789012', NULL, 'Client', 12, NULL, NULL),
('11999887766', 'lucas@email.com', '34567890123', NULL, 'Client', 13, NULL, NULL),
('11998887777', 'tatiane@email.com', '45678901234', NULL, 'Client', 14, NULL, NULL),
('11997766554', 'felipe@email.com', '56789012345', NULL, 'Client', 15, NULL, NULL),
('11992223344', 'stylewear@email.com', NULL, '12345678000199', 'Seller', NULL, 11, NULL),
('11993334455', 'gourmetfood@email.com', NULL, '23456789000188', 'Seller', NULL, 12, NULL),
('11994445566', 'livroscursos@email.com', NULL, '34567890000177', 'Seller', NULL, 13, NULL),
('11995556677', 'tools@email.com', NULL, '98765432000155', 'Supplier', NULL, NULL, 11),
('11996667788', 'fashionworld@email.com', NULL, '87654321000144', 'Supplier', NULL, NULL, 12);

-- Inserindo dados na tabela Product_Seller
INSERT INTO Products_Seller (idSeller, ProductId, Quantity)
VALUES
(1, 1, 10),  
(2, 2, 30), 
(3, 3, 20),  
(1, 4, 50), 
(2, 5, 15),  
(3, 6, 25),  
(1, 7, 40),  
(2, 8, 60), 
(3, 9, 35),  
(1, 10, 45); 

INSERT INTO Products_Seller (idSeller, ProductId, Quantity)
VALUES
(11, 11, 10),  
(12, 12, 30), 
(13, 13, 20),  
(14, 14, 50), 
(15, 15, 15),  
(16, 16, 25),  
(17, 17, 40),  
(18, 18, 60), 
(19, 19, 35),  
(20, 20, 45); 


-- Inserindo dados na tabela Product_Order
INSERT INTO Product_Order (ProductId, OrderId, idClient, Quantity, OrderStatus)
VALUES
(1, 1, 1, 1, 'Disponível'),   
(2, 2, 2, 2, 'Indisponível'), 
(3, 3, 3, 3, 'Disponível'),   
(4, 4, 4, 4, 'Disponível'),   
(5, 5, 5, 1, 'Indisponível'),     
(6, 6, 6, 2, 'Indisponível'),   
(7, 7, 7, 5, 'Disponível'),      
(8, 8, 8, 3, 'Disponível'), 
(9, 9, 9, 1, 'Disponível'),      
(10, 10, 10, 2, 'Indisponível'); 

INSERT IGNORE INTO Product_Order (ProductId, OrderId, idClient, Quantity, OrderStatus)
VALUES
(1, 10, 1, 1, 'Disponível'),   
(1, 20, 2, 2, 'Indisponível'), 
(1, 13, 3, 3, 'Disponível'),   
(17, 14, 4, 4, 'Disponível'),   
(14, 15, 5, 1, 'Indisponível'),     
(13, 16, 6, 2, 'Indisponível'),   
(10, 17, 7, 5, 'Disponível'),      
(10, 18, 8, 3, 'Disponível'), 
(9, 19, 9, 1, 'Disponível'),      
(10, 11, 10, 2, 'Indisponível'); 


SELECT * FROM PRODUCT;
SELECT * FROM ORDERS;
SELECT * FROM CLIENTS;

INSERT INTO Product_Order (ProductId, OrderId, idClient, Quantity, OrderStatus)
VALUES
(11, 11, 11, 1, 'Disponível'),   
(12, 12, 12, 2, 'Indisponível'), 
(13, 13, 13, 3, 'Disponível'),   
(14, 14, 14, 4, 'Disponível'),   
(15, 15, 15, 1, 'Indisponível'),     
(16, 16, 16, 2, 'Indisponível'),   
(17, 17, 17, 5, 'Disponível'),      
(18, 18, 18, 3, 'Disponível'), 
(19, 19, 19, 1, 'Disponível'),      
(20, 20, 20, 2, 'Indisponível'); 


-- Inserindo dados na tabela InStock
INSERT INTO InStock (ProductId, idStock)
VALUES
(1, 1), 
(2, 2),  
(3, 3),  
(4, 4),  
(5, 5),  
(6, 6),  
(7, 7), 
(8, 8),  
(9, 9),  
(10, 10); 

INSERT INTO InStock (ProductId, idStock)
VALUES
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

drop table ProductAvaiability;
-- Inserindo dados na tabela Avaiability
INSERT INTO ProductAvaiability (ProductId, idSupplier, Avaiability)
VALUES
(1, 1, 'SIM'),  
(2, 2, 'SIM'), 
(3, 3, 'SIM'),  
(4, 1, 'SIM'), 
(5, 2, 'SIM'),  
(6, 3, 'SIM'),  
(7, 1, 'SIM'),  
(8, 2, 'SIM'),  
(9, 3, 'SIM'),  
(10, 1, 'SIM'); 

INSERT INTO ProductAvaiability (ProductId, idSupplier, Avaiability)
VALUES
(11, 11, 'SIM'),
(12, 12, 'SIM'),
(13, 13, 'SIM'),
(14, 14, 'SIM'),
(15, 15, 'SIM'),
(16, 16, 'SIM'),
(17, 17, 'SIM'),
(18, 18, 'SIM'),
(19, 19, 'SIM'),
(20, 20, 'SIM');

-- Inserindo dados na tabela Shipment
INSERT INTO Shipment (OrderId, ShippingStatus, TrackingCode, ShippingDate) VALUES
(1, 'Em trânsito', 'TRK123456789', '2025-01-15'),
(2, 'Entregue', 'TRK987654321', '2025-01-10'),
(3, 'Pendente', 'TRK112233445', '2025-01-17'),
(4, 'Em trânsito', 'TRK223344556', '2025-01-12'),
(5, 'Cancelado', 'TRK556677889', '2025-01-05'),
(6, 'Em trânsito', 'TRK667788990', '2025-01-20'),
(7, 'Entregue', 'TRK334455667', '2025-01-03'),
(8, 'Pendente', 'TRK778899001', '2025-01-22'),
(9, 'Em trânsito', 'TRK889900112', '2025-01-10'),
(10, 'Entregue', 'TRK991122334', '2025-01-08');

INSERT INTO Shipment (OrderId, ShippingStatus, TrackingCode, ShippingDate) 
VALUES
(11, 'Em trânsito', 'TRK11223344', '2025-01-10'),
(12, 'Entregue', 'TRK22334455', '2025-01-05'),
(13, 'Pendente', 'TRK33445566', '2025-01-15'),
(14, 'Em trânsito', 'TRK44556677', '2025-01-12'),
(15, 'Cancelado', 'TRK55667788', '2025-01-07'),
(16, 'Em trânsito', 'TRK66778899', '2025-01-17'),
(17, 'Entregue', 'TRK77889900', '2025-01-02'),
(18, 'Pendente', 'TRK88990011', '2025-01-19'),
(19, 'Em trânsito', 'TRK99001122', '2025-01-09'),
(20, 'Entregue', 'TRK10111213', '2025-01-04')
;

