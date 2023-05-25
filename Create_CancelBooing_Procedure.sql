CREATE DEFINER=`admin1`@`%` PROCEDURE `CancelBooking`(IN paramBookingID INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = paramBookingID;
COMMIT;
SELECT CONCAT("Booking ", paramBookingID, " cancelled") AS "Confirmation";
END