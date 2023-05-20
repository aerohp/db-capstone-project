CREATE PROCEDURE `GetMaxQuantity` ()
BEGIN
SELECT Quantity AS "MAX Quantity in Order" FROM Orders ORDER BY Quantuty DESC;
END
