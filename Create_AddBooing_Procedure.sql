CREATE DEFINER=`admin1`@`%` PROCEDURE `AddBooking`(IN paramBookingID INT, IN paramCustomerID INT, IN paramBookingDate VARCHAR(255), IN paramTableNumber INT)
BEGIN
INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber) VALUES (paramBookingID, paramCustomerID, paramBookingDate, paramTableNumber);
COMMIT;
SELECT "New booking added" AS 'Confirmation';
END