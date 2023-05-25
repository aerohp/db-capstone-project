CREATE DEFINER=`admin1`@`%` PROCEDURE `AddValidBooking`(IN paramBookingDate VARCHAR(255), IN paramTableNumber INT, IN paramCustomerID INT)
BEGIN
DECLARE bookingStatus VARCHAR(255) DEFAULT "";
IF EXISTS(SELECT DATE(BookingDate), TableNumber FROM Bookings WHERE BookingDate = paramBookingDate AND TableNumber = paramTableNumber) THEN
	SET bookingStatus = CONCAT("Table ", paramTableNumber, " is already booked ", "-", " booking cancelled");
ELSE
	START TRANSACTION;
	SELECT @bookingID:=MAX(BookingID) + 1 FROM Bookings;
	INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber) VALUES (@bookingID, paramCustomerID, paramBookingDate, paramTableNumber);
	SET bookingStatus = CONCAT("Table ", paramTableNumber, " is booked successfully");  
    COMMIT;
END IF;
SELECT bookingStatus AS 'Booking Status';
END