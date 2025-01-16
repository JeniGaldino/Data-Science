Projeto de Oficina - Sistema de Gerenciamento de Dados

Descrição

Este projeto consiste em um sistema de gerenciamento de dados para uma oficina mecânica. Ele abrange funcionalidades como o cadastro de mecânicos e clientes, acompanhamento de serviços realizados, gerenciamento de estoque de peças e monitoramento de ordens de serviço pendentes. O objetivo é fornecer uma solução estruturada e eficiente para armazenar, consultar e manipular os dados da oficina.

Este projeto foi desenvolvido com base em um modelo de banco de dados relacional cuidadosamente planejado. A construção do sistema envolveu a criação de tabelas normalizadas, definição de relacionamentos entre entidades, e elaboração de consultas otimizadas para extrair informações relevantes de forma eficiente. O foco foi garantir integridade, escalabilidade e facilidade de uso.

Funcionalidades

1. Gerenciamento de Mecânicos

Consulta de informações completas sobre mecânicos:

Nome completo.

CPF, gênero e informações pessoais.

Endereço completo.

Especialidade do mecânico.

Times e ordens de serviço atribuídas.

2. Gerenciamento de Clientes

Consulta de dados completos de clientes:

Nome completo, CPF/CNPJ e gênero.

Endereço completo.

Veículos associados (placa e ano).

3. Histórico de Serviços

Consulta de serviços realizados para clientes com base no CPF:

Tipos de serviços: manutenção e reparo.

Detalhes do veículo associado ao cliente.

4. Movimentação de Estoque

Consulta de movimentação de peças:

Nome da peça.

Quantidade movimentada.

Tipo de movimentação (entrada/saída).

5. Monitoramento de Ordens de Serviço

Consulta de ordens de serviço pendentes:

Identificador da ordem de serviço.

Status e prazo de entrega.

Tecnologias Utilizadas

Banco de Dados: MySQL.

Linguagem de Consulta: SQL.

Estrutura do Projeto:

Tabelas principais: Mecânicos, Clientes, Serviços, Peças, Ordens de Serviço.

Relacionamentos bem definidos entre tabelas para garantir integridade referencial.

Consultas Implementadas

1. Informções completas de funcionários:

SELECT m.IdMechanic, CONCAT(p.Fname,' ',p.minit,' ', p.lname) as MechanicName, p.CPF, p.CNPJ,p.gender,
a.street, a.Number, a.Neighbourhood,a.City,a.State,a.ZipCode, m.Speciality, tm.TeamId, tm.Number_OrderService
FROM Mechanic m
INNER JOIN PersonalInformation p on m.idPersonalInformation = p.idPersonalInformation
INNER JOIN Address a on m.idAddress = a.idAddress
INNER JOIN Team_Mechanics tm on m.IdMechanic = tm.Mechanic_Code
ORDER BY m.IdMechanic;

2. Dados completos dos clientes:

SELECT c.IdClient, CONCAT(p.Fname,' ',p.minit,' ', p.lname) as ClientName, p.CPF, p.CNPJ,p.gender,
a.street, a.Number, a.Neighbourhood,a.City,a.State,a.ZipCode, au.Plate, au.Year
FROM Clients c
INNER JOIN PersonalInformation p on c.idPersonalInformation = p.idPersonalInformation
INNER JOIN Address a on c.idAddress = a.idAddress
INNER JOIN Auto au on c.IdClient = au.ClientId
ORDER BY c.IdClient;

3. Histórico de serviços para um cliente:

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

4. Movimentação de estoque de peças:

SELECT c.idCarpart, c.CarPart, s.Quantity, s.MovementType
FROM CarPart c
INNER JOIN Stock s on c.idCarPart = s.CarPartId
ORDER BY c.idCarpart;

5. Ordens de serviço pendentes:

SELECT IdOrderService, OrderServiceStatus, DeliveryDeadline
FROM ServiceOrder
WHERE OrderServiceStatus = 'Pendente';

6. Mecânicos designados a ordens de serviço:

SELECT m.IdMechanic, CONCAT(p.Fname,' ',p.minit,' ', p.lname) as MechanicName, m.Speciality, tm.OrderService_Number
FROM Mechanic m
INNER JOIN PersonalInformation p on m.idPersonalInformation = p.idPersonalInformation
INNER JOIN Team_Mechanics tm on m.IdMechanic = tm.Mechanic_Code
ORDER BY Speciality;

Possíveis Expansões

Implementar visualizações gráficas utilizando ferramentas de BI como Power BI ou Tableau.

Automatizar consultas e relatórios periódicos.

Desenvolver uma interface de usuário para facilitar o acesso aos dados.

Integrar APIs para atualizações em tempo real.

Como Executar

Certifique-se de ter o MySQL instalado e configurado.

Importe o script de criação do banco de dados e tabelas.

Execute as consultas SQL descritas acima conforme necessário.

Contribuições

Sinta-se à vontade para sugerir melhorias ou relatar problemas abrindo uma issue no repositório do projeto