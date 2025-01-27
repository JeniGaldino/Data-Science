-- Criando data base para  Oficina

create database workshop;
use workshop;

CREATE TABLE `PersonalInformation` (
  `idPersonalInformation` INT auto_increment NOT NULL,
  `FName` VARCHAR(45) NOT NULL,
  `Minit` CHAR(5) NULL,
  `LName` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(14) NOT NULL,
  `CNPJ` VARCHAR(14) NOT NULL,
  `Gender` ENUM('M', 'F', 'OTHER') NOT NULL,
  PRIMARY KEY (`idPersonalInformation`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC)
) ;

CREATE TABLE `Address` (
  `idAddress` INT auto_increment NOT NULL,
  `Street` VARCHAR(45) NOT NULL,
  `Number` VARCHAR(15) NOT NULL,
  `Neighbourhood` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` CHAR(2) NOT NULL,
  `ZipCode` CHAR(8) NOT NULL,
  PRIMARY KEY (`idAddress`)
) ;

CREATE TABLE `Clients` (
  `IdClient` INT auto_increment NOT NULL,
  `Authorization` TINYINT NOT NULL DEFAULT 1,
  `idPersonalInformation` INT NOT NULL,
  `idAddress` INT NOT NULL,
  PRIMARY KEY (`IdClient`),
  INDEX `fk_Clientes_PersonalInformation_idx` (`idPersonalInformation`),
  INDEX `fk_Clientes_Address_idx` (`idAddress`),
  CONSTRAINT `fk_Clientes_PersonalInformation`
    FOREIGN KEY (`idPersonalInformation`)
    REFERENCES `mydb`.`PersonalInformation` (`idPersonalInformation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clientes_Address`
    FOREIGN KEY (`idAddress`)
    REFERENCES `mydb`.`Address` (`idAddress`)
    ON DELETE CASCADE
) ;

CREATE TABLE `Repair` (
  `idRepair` INT auto_increment NOT NULL,
  PRIMARY KEY (`idRepair`)
) ENGINE = InnoDB;

CREATE TABLE `Maintenance` (
  `idMaintenance` INT NOT NULL,
  PRIMARY KEY (`idMaintenance`)
) ;

CREATE TABLE  `Services` (
  `idService` INT NOT NULL,
  `RepairId` INT NOT NULL,
  `MaintenanceId` INT NOT NULL,
  PRIMARY KEY (`idService`),
  INDEX `fk_Services_Repair_idx` (`RepairId`),
  INDEX `fk_Services_Maintenance_idx` (`MaintenanceId`),
  CONSTRAINT `fk_Services_Repair`
    FOREIGN KEY (`RepairId`)
    REFERENCES `mydb`.`Repair` (`idRepair`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Services_Maintenance`
    FOREIGN KEY (`MaintenanceId`)
    REFERENCES `mydb`.`Maintenance` (`idMaintenance`)
    ON DELETE CASCADE
) ;

CREATE TABLE `Team` (
  `idTeam` INT NOT NULL,
  `Service_idService` INT NOT NULL,
  `ServiceOrder_Number` INT NOT NULL,
  PRIMARY KEY (`idTeam`, `ServiceOrder_Number`),
  INDEX `fk_Team_Services_idx` (`Service_idService`),
  CONSTRAINT `fk_Team_Services`
    FOREIGN KEY (`Service_idService`)
    REFERENCES `mydb`.`Services` (`idService`)
    ON DELETE CASCADE
) ;

CREATE TABLE `Auto` (
  `idAuto` INT NOT NULL,
  `Plate` CHAR(7) NOT NULL,
  `Year` CHAR(4) NOT NULL,
  `ClientId` INT NOT NULL,
  `TeamId` INT NOT NULL,
  PRIMARY KEY (`idAuto`, `TeamId`),
  INDEX `fk_Auto_Team_idx` (`TeamId`),
  INDEX `fk_Auto_Clients_idx` (`ClientId`),
  UNIQUE INDEX `Plate_UNIQUE` (`Plate`),
  CONSTRAINT `fk_Auto_Team`
    FOREIGN KEY (`TeamId`)
    REFERENCES `mydb`.`Team` (`idTeam`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Auto_Clients`
    FOREIGN KEY (`ClientId`)
    REFERENCES `mydb`.`Clients` (`IdClient`)
    ON DELETE CASCADE
);

CREATE TABLE `Labour` (
  `idLabour` INT NOT NULL,
  `MaintenancePrice` DECIMAL(10, 2) NULL,
  `RepairPrice` DECIMAL(10, 2) NULL,
  PRIMARY KEY (`idLabour`)
) 

CREATE TABLE `CarPart` (
  `idCarPart` INT NOT NULL,
  `CarPart` VARCHAR(45) NOT NULL,
  `Price` DECIMAL(10, 2) NOT NULL DEFAULT 1.0,
  PRIMARY KEY (`idCarPart`)
) ;

CREATE TABLE `TotalPrice` (
  `idTotalPrice` INT NOT NULL,
  `LabourId` INT NOT NULL,
  `CarPartId` INT NOT NULL,
  PRIMARY KEY (`idTotalPrice`),
  INDEX `fk_TotalPrice_Labour_idx` (`LabourId`),
  INDEX `fk_TotalPrice_CarPart_idx` (`CarPartId`),
  CONSTRAINT `fk_TotalPrice_Labour`
    FOREIGN KEY (`LabourId`)
    REFERENCES `mydb`.`Labour` (`idLabour`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TotalPrice_CarPart`
    FOREIGN KEY (`CarPartId`)
    REFERENCES `mydb`.`CarPart` (`idCarPart`)
    ON DELETE CASCADE
) ;

CREATE TABLE `ServiceOrder` (
  `IdOrderService` INT NOT NULL,
  `IssueDate` DATE NOT NULL,
  `DeliveryDeadline` DATE NOT NULL,
  `OrderServiceStatus` ENUM('Pendente', 'Em andamento', 'Pronto', 'Cancelado') NOT NULL DEFAULT 'Pendente',
  `TotalPrice_OrderService` INT NULL,
  PRIMARY KEY (`IdOrderService`),
  INDEX `fk_ServiceOrder_TotalPrice_idx` (`TotalPrice_OrderService`),
  CONSTRAINT `fk_ServiceOrder_TotalPrice`
    FOREIGN KEY (`TotalPrice_OrderService`)
    REFERENCES `mydb`.`TotalPrice` (`idTotalPrice`)
    ON DELETE CASCADE
) ;

CREATE TABLE `Mechanic` (
  `IdMechanic` INT NOT NULL,
  `Speciality` VARCHAR(45) NOT NULL,
  `idPersonalInformation` INT NOT NULL,
  `idAddress` INT NOT NULL,
  PRIMARY KEY (`IdMechanic`),
  INDEX `fk_Mechanic_PersonalInformation_idx` (`idPersonalInformation`),
  INDEX `fk_Mechanic_Address_idx` (`idAddress`),
  CONSTRAINT `fk_Mechanic_PersonalInformation`
    FOREIGN KEY (`idPersonalInformation`)
    REFERENCES `mydb`.`PersonalInformation` (`idPersonalInformation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mechanic_Address`
    FOREIGN KEY (`idAddress`)
    REFERENCES `mydb`.`Address` (`idAddress`)
    ON DELETE CASCADE
) ;

