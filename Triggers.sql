-- Update Popularity Trigger
CREATE OR REPLACE TRIGGER UpdatePopularity
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Destinations
    SET Popularity = Popularity + 1
    WHERE DestinationID = (SELECT DestinationID FROM TourPackages WHERE PackageID = :NEW.PackageID);
END;
/


--Assign 
CREATE OR REPLACE PROCEDURE AssignTransport (
    p_BookingID IN NUMBER,
    p_TransportID IN NUMBER
) AS
BEGIN
    -- Update the TransportID in the Bookings table
    UPDATE Bookings
    SET TransportID = p_TransportID
    WHERE BookingID = p_BookingID;

    DBMS_OUTPUT.PUT_LINE('Transport assigned successfully for Booking ID: ' || p_BookingID);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/


-- Trigger to Ensure Payment After Booking
CREATE OR REPLACE TRIGGER EnsurePayment
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    INSERT INTO Payments (BookingID, Amount, PaymentMethod)
    VALUES (:NEW.BookingID, :NEW.TotalAmount, 'Credit Card');
END;
/
