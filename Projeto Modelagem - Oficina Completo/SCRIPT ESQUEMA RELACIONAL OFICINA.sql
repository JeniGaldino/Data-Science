-- Criando data base para  Oficina

create database workshop;
use workshop;
show tables;

CREATE TABLE `PersonalInformation` (
  `idPersonalInformation` INT AUTO_INCREMENT NOT NULL,
  `FName` VARCHAR(45) NOT NULL,
  `Minit` CHAR(1) NULL,
  `LName` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(14) UNIQUE NOT  NULL,
  `CNPJ` VARCHAR(14) UNIQUE NOT NULL,
  `Gender` ENUM('M', 'F', 'OTHER') NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idPersonalInformation`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC)
);

CREATE TABLE `Address` (
  `idAddress` INT AUTO_INCREMENT NOT NULL,
  `Street` VARCHAR(45) NOT NULL,
  `Number` VARCHAR(15) NOT NULL,
  `Neighbourhood` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` CHAR(2) NOT NULL,
  `ZipCode` VARCHAR(8) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idAddress`)
);

CREATE TABLE `Clients` (
  `IdClient` INT AUTO_INCREMENT NOT NULL,
  `Authorization` TINYINT NOT NULL DEFAULT 1,
  `idPersonalInformation` INT NOT NULL,
  `idAddress` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdClient`),
  INDEX `fk_Clientes_PersonalInformation_idx` (`idPersonalInformation`),
  INDEX `fk_Clientes_Address_idx` (`idAddress`),
  CONSTRAINT `fk_Clientes_PersonalInformation`
    FOREIGN KEY (`idPersonalInformation`)
    REFERENCES `PersonalInformation` (`idPersonalInformation`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Clientes_Address`
    FOREIGN KEY (`idAddress`)
    REFERENCES `Address` (`idAddress`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);

CREATE TABLE `Repair` (
  `idRepair` INT AUTO_INCREMENT NOT NULL,
  `RepairType` ENUM('Small Repair','Normal Repair','Emergency Repair') NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idRepair`)
);

CREATE TABLE `Maintenance` (
  `idMaintenance` INT AUTO_INCREMENT NOT NULL,
  `MaintenanceType` ENUM('Standard Service','Preventive maintenance','Emergency maintenance') NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idMaintenance`)
);

CREATE TABLE `Services` (
  `idService` INT AUTO_INCREMENT NOT NULL,
  `RepairId` INT NOT NULL,
  `MaintenanceId` INT NOT NULL,
  `ServiceType` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idService`),
  INDEX `fk_Services_Repair_idx` (`RepairId`),
  INDEX `fk_Services_Maintenance_idx` (`MaintenanceId`),
  CONSTRAINT `fk_Services_Repair`
    FOREIGN KEY (`RepairId`)
    REFERENCES `Repair` (`idRepair`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Services_Maintenance`
    FOREIGN KEY (`MaintenanceId`)
    REFERENCES `Maintenance` (`idMaintenance`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE `Team` (
  `idTeam` INT AUTO_INCREMENT NOT NULL,
  `Service_idService` INT NOT NULL,
  `ServiceOrder_Number` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idTeam`, `ServiceOrder_Number`),
  INDEX `fk_Team_Services_idx` (`Service_idService`),
  CONSTRAINT `fk_Team_Services`
    FOREIGN KEY (`Service_idService`)
    REFERENCES `Services` (`idService`)
    ON DELETE CASCADE
);

CREATE TABLE `Auto` (
  `idAuto` INT AUTO_INCREMENT NOT NULL,
  `Plate` CHAR(7) NOT NULL,
  `Year` CHAR(4) NOT NULL,
  `ClientId` INT NOT NULL,
  `TeamId` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idAuto`, `TeamId`),
  INDEX `fk_Auto_Team_idx` (`TeamId`),
  INDEX `fk_Auto_Clients_idx` (`ClientId`),
  UNIQUE INDEX `Plate_UNIQUE` (`Plate`),
  CONSTRAINT `fk_Auto_Team`
    FOREIGN KEY (`TeamId`)
    REFERENCES `Team` (`idTeam`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Auto_Clients`
    FOREIGN KEY (`ClientId`)
    REFERENCES `Clients` (`IdClient`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE `Labour` (
  `idLabour` INT AUTO_INCREMENT NOT NULL,
  `MaintenancePrice` DECIMAL(10, 2) NULL,
  `RepairPrice` DECIMAL(10, 2) NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idLabour`)
);

CREATE TABLE `CarPart` (
  `idCarPart` INT NOT NULL AUTO_INCREMENT,
  `CarPart` VARCHAR(45) NOT NULL,
  `Price` DECIMAL(10, 2) NOT NULL DEFAULT 1.0,
  PRIMARY KEY (`idCarPart`)
);

CREATE TABLE `Stock` (
  `idStock` INT NOT NULL AUTO_INCREMENT,
  `CarPartId` INT NOT NULL,           
  `Quantity` INT NOT NULL,            
  `MovementType` ENUM('Entrada', 'Saída') NOT NULL, 
  `MovementDate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  PRIMARY KEY (`idStock`),
  FOREIGN KEY (`CarPartId`) REFERENCES `CarPart` (`idCarPart`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE `TotalPrice` (
  `idTotalPrice` INT NOT NULL AUTO_INCREMENT,
  `LabourId` INT NOT NULL,
  `CarPartId` INT NOT NULL,
  PRIMARY KEY (`idTotalPrice`),
  INDEX `fk_TotalPrice_Labour_idx` (`LabourId`),
  INDEX `fk_TotalPrice_CarPart_idx` (`CarPartId`),
  CONSTRAINT `fk_TotalPrice_Labour`
    FOREIGN KEY (`LabourId`)
    REFERENCES `Labour` (`idLabour`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TotalPrice_CarPart`
    FOREIGN KEY (`CarPartId`)
    REFERENCES `CarPart` (`idCarPart`)
    ON DELETE CASCADE
);


CREATE TABLE `ServiceOrder` (
  `IdOrderService` INT NOT NULL AUTO_INCREMENT,
  `IssueDate` DATE NOT NULL,
  `DeliveryDeadline` DATE NOT NULL,
  `OrderServiceStatus` ENUM('Pendente', 'Em andamento', 'Pronto', 'Cancelado') NOT NULL DEFAULT 'Pendente',
  `TotalPrice_OrderService` INT NULL,  
  PRIMARY KEY (`IdOrderService`),
  INDEX `fk_ServiceOrder_TotalPrice_idx` (`TotalPrice_OrderService`),
  CONSTRAINT `fk_ServiceOrder_TotalPrice`
    FOREIGN KEY (`TotalPrice_OrderService`)
    REFERENCES `TotalPrice` (`idTotalPrice`)
    ON DELETE CASCADE
);


CREATE TABLE `Mechanic` (
  `IdMechanic` INT AUTO_INCREMENT NOT NULL,
  `Speciality` VARCHAR(45) NOT NULL,
  `idPersonalInformation` INT NOT NULL,
  `idAddress` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdMechanic`),
  INDEX `fk_Mechanic_PersonalInformation_idx` (`idPersonalInformation`),
  INDEX `fk_Mechanic_Address_idx` (`idAddress`),
  CONSTRAINT `fk_Mechanic_PersonalInformation`
    FOREIGN KEY (`idPersonalInformation`)
    REFERENCES `PersonalInformation` (`idPersonalInformation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mechanic_Address`
    FOREIGN KEY (`idAddress`)
    REFERENCES `Address` (`idAddress`)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `Team_Mechanics` (
  `TeamID` INT NOT NULL,
  `Number_OrderService` INT NOT NULL,
  `Mechanic_Code` INT NOT NULL,
  `OrderService_Number` INT NOT NULL,
  `Total_OrderService` INT NOT NULL,
  PRIMARY KEY (`TeamID`, `Number_OrderService`, `Mechanic_Code`, `OrderService_Number`, `Total_OrderService`),
  INDEX `fk_Team_Mechanics_Mechanic_idx` (`Mechanic_Code` ASC),
  INDEX `fk_Team_Mechanics_Team_idx` (`TeamID` ASC, `Number_OrderService` ASC),
  INDEX `fk_Team_Mechanics_ServiceOrder_idx` (`OrderService_Number` ASC, `Total_OrderService` ASC),
  CONSTRAINT `fk_Team_Mechanics_Team`
    FOREIGN KEY (`TeamID`, `Number_OrderService`)
    REFERENCES `Team` (`idTeam`, `ServiceOrder_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Team_Mechanics_Mechanic`
    FOREIGN KEY (`Mechanic_Code`)
    REFERENCES `Mechanic` (`IdMechanic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Team_Mechanics_ServiceOrder`
    FOREIGN KEY (`OrderService_Number`, `Total_OrderService`)
    REFERENCES `ServiceOrder` (`IdOrderService`, `TotalPrice_OrderService`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
SHOW TABLES;
CREATE TABLE IF NOT EXISTS `ServiceOrder_CarPart` (
  `Number_OrderService` INT NOT NULL,
  `CarPart_id` INT NOT NULL,
  PRIMARY KEY (`Number_OrderService`, `CarPart_id`),
  INDEX `fk_ServiceOrder_CarPart_CarPart_idx` (`CarPart_id` ASC),
  INDEX `fk_ServiceOrder_CarPart_ServiceOrder_idx` (`Number_OrderService` ASC),
  CONSTRAINT `fk_ServiceOrder_CarPart_ServiceOrder`
    FOREIGN KEY (`Number_OrderService`)
    REFERENCES `ServiceOrder` (`IdOrderService`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServiceOrder_CarPart_CarPart`
    FOREIGN KEY (`CarPart_id`)
    REFERENCES `CarPart` (`idCarPart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS `Service_OrderService` (
  `ServiceOId` INT NOT NULL,
  `Number_OrderService` INT NOT NULL,
  PRIMARY KEY (`ServiceOId`, `Number_OrderService`),
  INDEX `fk_Service_OrderService_Service_idx` (`ServiceOId` ASC),
  INDEX `fk_Service_OrderService_ServiceOrder_idx` (`Number_OrderService` ASC),
  CONSTRAINT `fk_Service_OrderService_Service`
    FOREIGN KEY (`ServiceOId`)
    REFERENCES `Services` (`idService`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Service_OrderService_ServiceOrder`
    FOREIGN KEY (`Number_OrderService`)
    REFERENCES `ServiceOrder` (`IdOrderService`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);





