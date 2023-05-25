CREATE DEFINER=`admin1`@`%` PROCEDURE `CheckBooking`(IN paramBookingDate VARCHAR(255), IN paramTableNumber INT)
BEGIN
DECLARE bookingStatus VARCHAR(255) DEFAULT "";
IF EXISTS(SELECT DATE(BookingDate), TableNumber FROM Bookings WHERE BookingDate = paramBookingDate AND TableNumber = paramTableNumber) THEN
	SET bookingStatus = CONCAT("Table ", paramTableNumber, " is already booked");
ELSE
	SET bookingStatus = CONCAT("Table ", paramTableNumber, " is available");
END IF;
SELECT bookingStatus AS "Booking Status";
END