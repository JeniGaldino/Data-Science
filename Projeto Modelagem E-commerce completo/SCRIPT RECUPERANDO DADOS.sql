-- Recuperando dados e-commerce
use ecommerce;
-- Algum vendedor também é fornecedor?
SELECT 'Seller' AS EntityType, S.CorporateName, NULL AS SupplierName
FROM ContactInfo c
INNER JOIN Seller S ON c.idSeller = S.idSeller
WHERE c.EntityType = 'Seller'

UNION ALL

SELECT 'Supplier' AS EntityType, NULL AS SellerName, Su.CorporateName
FROM ContactInfo c
INNER JOIN Supplier Su ON c.idSupplier = Su.idSupplier
WHERE c.EntityType = 'Supplier';
;
-- Relação de produtos fornecedores e estoques;
SELECT P.pname as NomeProduto, SU.CorporateName as Fornecedor, S.Quantity as Estoque
FROM Product P 
inner join Supplier SU on P.idCategoryProduct = SU.idCategoryProduct
inner join Stock S on P.idCategoryProduct = S.idCategoryProduct;

-- Relação de nomes dos fornecedores e nomes dos produtos;
SELECT P.pname as NomeProduto, SU.CorporateName as NomeFornecedor
FROM Product P 
inner join Supplier SU on P.idCategoryProduct = SU.idCategoryProduct
order by SU.CorporateName
;
-- Quantos pedidos foram realizados por cada cliente?
SELECT concat(c.fNAME,' ',c.Lname) as ClientName, COUNT(O.orderId) AS Total_Orders
FROM Clients C
INNER JOIN Orders O ON C.idClient = O.idClient
GROUP BY C.idClient
HAVING COUNT(O.orderId) != 0
ORDER BY Total_Orders DESC;

-- Quais produtos foram comprados mais vezes e quantas vezes?
SELECT P.Pname, COUNT(po.ProductId) as Total_Sold
FROM Product p
inner join Product_Order po on p.ProductId = po.ProductId
Group by P.ProductID
order by Total_Sold desc;

-- Qual a quantidade total de produtos em estoque?
SELECT SUM(S.Quantity) AS Total_Stock
FROM Stock S;

-- Quais produtos estão disponíveis e quantas unidades estão em estoque?
SELECT P.Pname, S.Quantity, PA.Avaiability
FROM Product P
INNER JOIN InStock ISK ON P.ProductId = ISK.ProductId
INNER JOIN Stock S ON ISK.idStock = S.idStock
INNER JOIN ProductAvaiability PA ON P.ProductId = PA.ProductId
ORDER BY S.Quantity DESC;

-- Qual a média de preços dos produtos em cada categoria?
SELECT C.CategoryName, round(AVG(P.Price),2) AS Avg_Price
FROM Product P
INNER JOIN CategoryProduct C ON P.idCategoryProduct = C.idCategoryProduct
GROUP BY C.CategoryName
HAVING AVG(P.Price) > 1
ORDER BY Avg_Price DESC;

-- Quais são os pedidos em andamento e quem são os clientes?
SELECT O.OrderId, concat(C.Fname,' ', C.LName) as NomeCliente, O.OrderStatus
FROM Orders O
INNER JOIN Clients C ON O.idClient = C.idClient
WHERE O.OrderStatus = 'Em andamento'
ORDER BY O.OrderId;

-- Qual o total de vendas realizadas por cada vendedor?

SELECT S.CorporateName, SUM(PO.Quantity) AS Total_Sales
FROM Seller S
INNER JOIN Products_Seller PS ON S.idSeller = PS.idSeller
INNER JOIN Product_Order PO ON PS.ProductId = PO.ProductId
GROUP BY S.idSeller
HAVING SUM(PO.Quantity) > 1
ORDER BY Total_Sales DESC;

-- lista os clientes, os produtos que compraram, a quantidade e o total gasto, mas agora apenas para os clientes que gastaram mais do que a média de todos os clientes
SELECT CONCAT(c.Fname,' ', c.LName) as ClientName, p.Pname AS ProductName, po.Quantity, 
       (po.Quantity * p.Price) AS TotalSpent
FROM Clients c
JOIN Orders o ON c.idClient = o.idClient
JOIN Product_Order po ON o.OrderId = po.OrderId
JOIN Product p ON po.ProductId = p.ProductId
WHERE (po.Quantity * p.Price) > (
      SELECT AVG(po2.Quantity * p2.Price)
      FROM Product_Order po2
      JOIN Product p2 ON po2.ProductId = p2.ProductId
)
ORDER BY TotalSpent DESC;

