CREATE VIEW OrdersTotalCostGreaterThan150View AS
    SELECT 
        c.CustomerID,
        CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
        o.OrderID,
        o.TotalCost AS Cost,
        m.MenuName,
        co.CourseName
    FROM
        Orders o
            INNER JOIN
        Customers c ON o.CustomerID = c.CustomerID
            INNER JOIN
        Menu m ON o.MenuID = m.MenuID
            INNER JOIN
        Courses co ON co.CourseID = m.CourseID
    WHERE
        o.TotalCost > 150;