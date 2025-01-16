-- Respondendo perguntas com consultas 
use workshop;

-- Informações completas Funcionários
SELECT m.IdMechanic, CONCAT(p.Fname,' ',p.minit,' ', p.lname) as MechanicName, p.CPF, p.CNPJ,p.gender,
a.street, a.Number, a.Neighbourhood,a.City,a.State,a.ZipCode, m.Speciality, tm.TeamId, tm.Number_OrderService
FROM Mechanic m
INNER JOIN PersonalInformation p on m.idPersonalInformation = p.idPersonalInformation
INNER JOIN Address a on m.idAddress = a.idAddress
INNER JOIN Team_Mechanics tm on m.IdMechanic = tm.Mechanic_Code
order by m.IdMechanic;

-- Informações completas dos clientes
SELECT c.IdClient, CONCAT(p.Fname, ' ', p.minit, ' ', p.lname) AS ClientName, 
p.CPF, p.CNPJ, p.gender, a.street, a.Number, a.Neighbourhood, a.City, a.State, a.ZipCode, 
COUNT(au.Plate) AS TotalVehicles
FROM Clients c
INNER JOIN PersonalInformation p ON c.idPersonalInformation = p.idPersonalInformation
INNER JOIN Address a ON c.idAddress = a.idAddress
INNER JOIN Auto au ON c.IdClient = au.ClientId
GROUP BY c.IdClient, CONCAT(p.Fname, ' ', p.minit, ' ', p.lname), p.CPF, p.CNPJ, 
p.gender, a.street, a.Number, a.Neighbourhood, a.City, a.State, a.ZipCode
ORDER BY c.IdClient;

-- Quais serviços de manutenção e reparo foram realizados para um determinado cliente com base no CPF?
SELECT c.idClient, CONCAT(p.Fname,' ',p.minit,' ', p.lname) as ClientName, p.CPF, a.Plate AS VehiclePlate,
s.ServiceType AS ServiceType, r.RepairType AS RepairType, m.MaintenanceType AS MaintenanceType
FROM PersonalInformation p
INNER JOIN Clients c ON p.idPersonalInformation = c.idPersonalInformation
INNER JOIN Auto a ON c.IdClient = a.ClientId
INNER JOIN Team t ON a.TeamId = t.idTeam
INNER JOIN Services s ON t.Service_idService = s.idService
LEFT JOIN Repair r ON s.RepairId = r.idRepair
LEFT JOIN Maintenance m ON s.MaintenanceId = m.idMaintenance
WHERE p.CPF = '33344455577';

-- Movimentação do estoque de peças;

SELECT c.idCarpart, c.CarPart, s.Quantity, s.MovementType
FROM CarPart c
INNER JOIN Stock s on c.idCarPart = s.CarPartId
order by c.idCarpart;

-- Quantas ordens de serviço ainda estão pendentes e qual é o prazo de entrega para cada uma?
SELECT IdOrderService, OrderServiceStatus, DeliveryDeadline FROM  ServiceOrder
where OrderServiceStatus = 'Pendente'
;
-- Quais mecânicos estão designados a ordens de serviço específicas e quais são suas especialidades?
SELECT m.IdMechanic, CONCAT(p.Fname,' ',p.minit,' ', p.lname) as MechanicName, m.Speciality, tm.OrderService_Number
FROM Mechanic m 
INNER JOIN PersonalInformation p on m.idPersonalInformation = p.idPersonalInformation
INNER JOIN Team_Mechanics tm on m.IdMechanic = tm.Mechanic_Code
Order by Speciality;

-- Quais mecânicos realizaram mais de 5 ordens de serviço e quais são suas especialidades?
SELECT m.IdMechanic, CONCAT(p.Fname, ' ', p.minit, ' ', p.lname) AS MechanicName, m.Speciality, COUNT(tm.OrderService_Number) AS TotalOrders
FROM Mechanic m
INNER JOIN PersonalInformation p ON m.idPersonalInformation = p.idPersonalInformation
INNER JOIN Team_Mechanics tm ON m.IdMechanic = tm.Mechanic_Code
GROUP BY m.IdMechanic, m.Speciality, MechanicName
HAVING COUNT(tm.OrderService_Number) != 0
ORDER BY TotalOrders DESC;


