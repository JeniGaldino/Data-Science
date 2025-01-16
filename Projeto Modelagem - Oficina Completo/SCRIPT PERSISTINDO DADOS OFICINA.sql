
-- Persistindo dados nas tabelas
INSERT INTO `PersonalInformation` (`FName`, `Minit`, `LName`, `CPF`, `CNPJ`, `Gender`)
VALUES
('João', 'S', 'Silva', '12345678909', '12345678000195', 'M'),
('Maria', 'A', 'Oliveira', '98765432100', '98765432000199', 'F'),
('José', 'B', 'Costa', '11122233344', '11122233000177', 'M'),
('Ana', 'C', 'Pereira', '55544433322', '55544433000155', 'F'),
('Carlos', 'D', 'Santos', '44455566633', '44455566000166', 'M'),
('Fernanda', 'E', 'Almeida', '22233344455', '22233344000122', 'F'),
('Roberto', 'F', 'Lima', '66677788899', '66677788000188', 'M'),
('Juliana', 'G', 'Martins', '99988877766', '99988877000199', 'F'),
('Rafael', 'H', 'Soares', '33344455577', '33344455000133', 'M'),
('Larissa', 'I', 'Rodrigues', '55566677788', '55566677000155', 'F'),
('Eduardo', 'J', 'Nascimento', '88877766655', '88877766000188', 'M'),
('Beatriz', 'K', 'Pinto', '12312312345', '12312312000123', 'F'),
('Thiago', 'L', 'Gomes', '23423423456', '23423423000123', 'M'),
('Patrícia', 'M', 'Ferreira', '34534534567', '34534534000134', 'F'),
('Marco', 'N', 'Ribeiro', '45645645678', '45645645000145', 'M'),
('Juliana', 'O', 'Cardoso', '56756756789', '56756756000156', 'F'),
('Vinícius', 'P', 'Melo', '67867867890', '67867867000167', 'M'),
('Carla', 'Q', 'Azevedo', '78978978901', '78978978000178', 'F'),
('Eduardo', 'R', 'Barbosa', '89089089012', '89089088000189', 'M'),
('Isabela', 'S', 'Silveira', '90190190123', '90190190000190', 'F');

INSERT INTO `Address` (`Street`, `Number`, `Neighbourhood`, `City`, `State`, `ZipCode`)
VALUES
('Rua A', '123', 'Centro', 'São Paulo', 'SP', '01010010'),
('Avenida B', '456', 'Jardim Paulista', 'São Paulo', 'SP', '02020020'),
('Rua C', '789', 'Bela Vista', 'São Paulo', 'SP', '03030030'),
('Rua D', '101', 'Vila Maria', 'São Paulo', 'SP', '04040040'),
('Avenida E', '202', 'Morumbi', 'São Paulo', 'SP', '05050050'),
('Rua F', '303', 'Pinheiros', 'São Paulo', 'SP', '06060060'),
('Rua G', '404', 'Itaim Bibi', 'São Paulo', 'SP', '07070070'),
('Avenida H', '505', 'Brooklin', 'São Paulo', 'SP', '08080080'),
('Rua I', '606', 'Vila Progredior', 'São Paulo', 'SP', '09090090'),
('Rua J', '707', 'Cidade Jardim', 'São Paulo', 'SP', '10010100'),
('Avenida K', '808', 'Vila Nova Conceição', 'São Paulo', 'SP', '11010110'),
('Rua L', '909', 'Santa Cecília', 'São Paulo', 'SP', '12010120'),
('Avenida M', '111', 'Santo Amaro', 'São Paulo', 'SP', '13010130'),
('Rua N', '222', 'Liberdade', 'São Paulo', 'SP', '14010140'),
('Rua O', '333', 'Vila Madalena', 'São Paulo', 'SP', '15010150'),
('Avenida P', '444', 'Morumbi', 'São Paulo', 'SP', '16010160'),
('Rua Q', '555', 'Brooklin', 'São Paulo', 'SP', '17010170'),
('Rua R', '666', 'Vila Romana', 'São Paulo', 'SP', '18010180'),
('Avenida S', '777', 'Vila Olímpia', 'São Paulo', 'SP', '19010190'),
('Rua T', '888', 'Vila Congonhas', 'São Paulo', 'SP', '20010200');

INSERT INTO `Clients` (`Authorization`, `idPersonalInformation`, `idAddress`)
VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 4),
(1, 5, 5),
(1, 6, 6),
(1, 7, 7),
(1, 8, 8),
(1, 9, 9),
(1, 10, 10),
(1, 11, 11),
(1, 12, 12),
(1, 13, 13),
(1, 14, 14),
(1, 15, 15),
(1, 16, 16),
(1, 17, 17),
(1, 18, 18),
(1, 19, 19),
(1, 20, 20);

INSERT INTO `Repair` (`RepairType`)
VALUES
('Small Repair'),
('Normal Repair'),
('Emergency Repair'),
('Small Repair'),
('Normal Repair'),
('Emergency Repair'),
('Small Repair'),
('Normal Repair'),
('Emergency Repair'),
('Small Repair'),
('Normal Repair'),
('Emergency Repair'),
('Small Repair'),
('Normal Repair'),
('Emergency Repair'),
('Small Repair'),
('Normal Repair'),
('Emergency Repair'),
('Small Repair'),
('Normal Repair');

INSERT INTO `Maintenance` (`MaintenanceType`)
VALUES
('Standard Service'),
('Preventive maintenance'),
('Emergency maintenance'),
('Standard Service'),
('Preventive maintenance'),
('Emergency maintenance'),
('Standard Service'),
('Preventive maintenance'),
('Emergency maintenance'),
('Standard Service'),
('Preventive maintenance'),
('Emergency maintenance'),
('Standard Service'),
('Preventive maintenance'),
('Emergency maintenance'),
('Standard Service'),
('Preventive maintenance'),
('Emergency maintenance'),
('Standard Service'),
('Preventive maintenance');

INSERT INTO `Services` (`RepairId`, `MaintenanceId`, `ServiceType`)
VALUES
(1, 1, 'Reparo elétrico'),
(2, 2, 'Troca de óleo'),
(3, 3, 'Substituição de peça'),
(4, 4, 'Reparo de motor'),
(5, 5, 'Manutenção preventiva'),
(6, 6, 'Reparo de suspensão'),
(7, 7, 'Troca de pastilhas de freio'),
(8, 8, 'Reparo de ar-condicionado'),
(9, 9, 'Substituição de baterias'),
(10, 10, 'Ajuste de alinhamento'),
(11, 11, 'Troca de correia'),
(12, 12, 'Reparo de câmbio'),
(13, 13, 'Manutenção do sistema de injeção'),
(14, 14, 'Troca de lâmpadas'),
(15, 15, 'Manutenção de sistema de direção'),
(16, 16, 'Verificação de sistemas eletrônicos'),
(17, 17, 'Reparo de suspensão traseira'),
(18, 18, 'Manutenção de freios'),
(19, 19, 'Troca de filtros'),
(20, 20, 'Reparo de transmissão');

INSERT INTO `Team` (`Service_idService`, `ServiceOrder_Number`)
VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105),
(6, 106),
(7, 107),
(8, 108),
(9, 109),
(10, 110),
(11, 111),
(12, 112),
(13, 113),
(14, 114),
(15, 115),
(16, 116),
(17, 117),
(18, 118),
(19, 119),
(20, 120);

INSERT INTO `Auto` (`Plate`, `Year`, `ClientId`, `TeamId`)
VALUES
('ABC1234', '2020', 1, 1),
('DEF5678', '2019', 2, 2),
('GHI9101', '2018', 3, 3),
('JKL1122', '2017', 4, 4),
('MNO3344', '2020', 5, 5),
('PQR5566', '2021', 6, 6),
('STU7788', '2022', 7, 7),
('VWX9900', '2016', 8, 8),
('YZA2233', '2020', 9, 9),
('BCD4455', '2018', 10, 10),
('EFG6677', '2019', 11, 11),
('HIJ8899', '2020', 12, 12),
('KLM1010', '2021', 13, 13),
('NOP2121', '2022', 14, 14),
('QRS4343', '2020', 15, 15),
('TUV6565', '2021', 16, 16),
('WXY8787', '2019', 17, 17),
('ZAB0909', '2020', 18, 18),
('CDE1212', '2022', 19, 19),
('FGH3434', '2020', 20, 20);

INSERT INTO `Labour` (`MaintenancePrice`, `RepairPrice`)
VALUES
(150.00, 100.00),
(200.00, 120.00),
(250.00, 180.00),
(300.00, 150.00),
(100.00, 80.00),
(220.00, 110.00),
(180.00, 140.00),
(270.00, 200.00),
(160.00, 130.00),
(210.00, 90.00),
(190.00, 140.00),
(250.00, 180.00),
(230.00, 160.00),
(270.00, 220.00),
(200.00, 110.00),
(300.00, 250.00),
(240.00, 170.00),
(280.00, 210.00),
(220.00, 180.00),
(260.00, 190.00);

INSERT INTO `CarPart` (`CarPart`, `Price`)
VALUES
('Filtro de óleo', 40.00),
('Pastilha de freio', 80.00),
('Bateria', 150.00),
('Correia dentada', 100.00),
('Suspensão', 200.00),
('Farol', 120.00),
('Pneu', 250.00),
('Radiador', 300.00),
('Amortecedor', 220.00),
('Bicos injetores', 180.00),
('Alternador', 350.00),
('Distribuidor', 90.00),
('Embreagem', 400.00),
('Câmbio', 500.00),
('Módulo de injeção', 550.00),
('Tampa de válvula', 180.00),
('Pivô de suspensão', 130.00),
('Sensor de estacionamento', 250.00),
('Trem de direção', 450.00),
('Comando de válvulas', 600.00);

INSERT INTO `Stock` (`CarPartId`, `Quantity`, `MovementType`)
VALUES
(1, 50, 'Entrada'),
(2, 40, 'Entrada'),
(3, 30, 'Entrada'),
(4, 20, 'Entrada'),
(5, 15, 'Entrada'),
(6, 25, 'Entrada'),
(7, 10, 'Entrada'),
(8, 5, 'Entrada'),
(9, 60, 'Entrada'),
(10, 55, 'Entrada'),
(11, 35, 'Entrada'),
(12, 45, 'Entrada'),
(13, 50, 'Entrada'),
(14, 40, 'Entrada'),
(15, 25, 'Entrada'),
(16, 30, 'Entrada'),
(17, 10, 'Entrada'),
(18, 20, 'Entrada'),
(19, 50, 'Entrada'),
(20, 40, 'Entrada'),
(1, 25, 'Saída'),
(2, 20, 'Saída'),
(3, 15, 'Saída'),
(4, 10, 'Saída'),
(5, 5, 'Saída'),
(6, 12, 'Saída'),
(7, 8, 'Saída'),
(8, 3, 'Saída'),
(9, 18, 'Saída'),
(10, 22, 'Saída');

INSERT INTO `TotalPrice` (`LabourId`, `CarPartId`)
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
(10, 10),
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


INSERT INTO `ServiceOrder` (`IssueDate`, `DeliveryDeadline`, `OrderServiceStatus`, `TotalPrice_OrderService`)
VALUES
('2025-01-10', '2025-01-15', 'Pendente', 1),
('2025-01-11', '2025-01-16', 'Em andamento', 2),
('2025-01-12', '2025-01-17', 'Pronto', 3),
('2025-01-13', '2025-01-18', 'Cancelado', 4),
('2025-01-14', '2025-01-19', 'Pendente', 5),
('2025-01-15', '2025-01-20', 'Em andamento', 6),
('2025-01-16', '2025-01-21', 'Pronto', 7),
('2025-01-17', '2025-01-22', 'Cancelado', 8),
('2025-01-18', '2025-01-23', 'Pendente', 9),
('2025-01-19', '2025-01-24', 'Em andamento', 10),
('2025-01-20', '2025-01-25', 'Pronto', 11),
('2025-01-21', '2025-01-26', 'Cancelado', 12),
('2025-01-22', '2025-01-27', 'Pendente', 13),
('2025-01-23', '2025-01-28', 'Em andamento', 14),
('2025-01-24', '2025-01-29', 'Pronto', 15),
('2025-01-25', '2025-01-30', 'Cancelado', 16),
('2025-01-26', '2025-01-31', 'Pendente', 17),
('2025-01-27', '2025-02-01', 'Em andamento', 18),
('2025-01-28', '2025-02-02', 'Pronto', 19),
('2025-01-29', '2025-02-03', 'Cancelado', 20);


INSERT INTO `Mechanic` (`Speciality`, `idPersonalInformation`, `idAddress`)
VALUES
('Eletricista', 1, 1),
('Mecânico de suspensão', 2, 2),
('Reparador de motor', 3, 3),
('Pintor de carros', 4, 4),
('Reparo de câmbio', 5, 5),
('Mecânico geral', 6, 6),
('Especialista em freios', 7, 7),
('Reparo de injeção', 8, 8),
('Reparo de suspensão', 9, 9),
('Eletricista automotivo', 10, 10),
('Mecânico de transmissão', 11, 11),
('Mecânico de direção', 12, 12),
('Mecânico de motores diesel', 13, 13),
('Reparo de sistemas eletrônicos', 14, 14),
('Reparo de ar-condicionado', 15, 15),
('Mecânico de escapamento', 16, 16),
('Mecânico de rodas e pneus', 17, 17),
('Especialista em alinhamento', 18, 18),
('Mecânico de carros importados', 19, 19),
('Mecânico de veículos pesados', 20, 20);


INSERT INTO `Team_Mechanics` (`TeamID`, `Number_OrderService`, `Mechanic_Code`, `OrderService_Number`, `Total_OrderService`)
VALUES
(1, 101, 1, 20, 1),  
(2, 102, 2, 21, 2),  
(3, 103, 3, 22, 3),  
(4, 104, 4, 23, 4),  
(5, 105, 5, 24, 5), 
(6, 106, 6, 25, 6),  
(7, 107, 7, 26, 7), 
(8, 108, 8, 27, 8),  
(9, 109, 9, 28, 9),  
(10, 110, 10, 29, 10), 
(11, 111, 11, 30, 11),
(12, 112, 12, 31, 12),
(13, 113, 13, 32, 13),
(14, 114, 14, 33, 14),
(15, 115, 15, 34, 15),
(16, 116, 16, 35, 16),
(17, 117, 17, 36, 17),
(18, 118, 18, 37, 18),
(19, 119, 19, 38, 19),
(20, 120, 20, 39, 20);



INSERT INTO ServiceOrder_CarPart (Number_OrderService, CarPart_id) VALUES
(20, 1),
(21, 2),
(22, 3),
(23, 4),
(24, 5),
(25, 6),
(26, 7),
(27, 8),
(28, 9),
(29, 10),
(30, 11),
(31, 12),
(32, 13),
(33, 14),
(34, 15),
(35, 16),
(36, 17),
(37, 18),
(38, 19),
(39, 20);

INSERT INTO Service_OrderService (ServiceOId, Number_OrderService) VALUES
(1, 20),
(2, 21),
(3, 22),
(4, 23),
(5, 24),
(6, 25),
(7, 26),
(8, 27),
(9, 28),
(10, 29),
(11, 30),
(12, 31),
(13, 32),
(14, 33),
(15, 34),
(16, 35),
(17, 36),
(18, 37),
(19, 38),
(20, 39);















