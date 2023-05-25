CREATE DEFINER=`admin1`@`%` PROCEDURE `UpdateBooking`(IN paramBookingID INT, IN paramBookingDate VARCHAR(255))
BEGIN
UPDATE Bookings SET BookingDate = paramBookingDate WHERE BookingID = paramBookingID;
COMMIT;
SELECT CONCAT("Booking ", paramBookingID, " updated") AS "Confirmation";
END