CREATE VIEW MenuNameView AS
    SELECT 
        m.MenuName
    FROM
        Menu m
            INNER JOIN
        Orders o ON o.MenuID = m.MenuID
    WHERE
        Quantity = ANY (SELECT 
                Quantity
            FROM
                Orders
            WHERE
                Quantity > 2);