--CreateBooking
CREATE OR REPLACE PROCEDURE CreateBooking ( 
    p_CustomerID IN NUMBER, 
    p_PackageID IN NUMBER, 
    p_TotalAmount IN NUMBER, 
    p_AgentID IN NUMBER 
) AS 
BEGIN 
    INSERT INTO Bookings (CustomerID, PackageID, TotalAmount, AgentID) 
    VALUES (p_CustomerID, p_PackageID, p_TotalAmount, p_AgentID); 
 
    DBMS_OUTPUT.PUT_LINE('Booking created successfully for Customer ID: ' || p_CustomerID); 
EXCEPTION 
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM); 
END; 
/

BEGIN 
    CreateBooking(1, 1, 1200.00, 1); 
END;
/

SELECT * FROM Bookings WHERE CustomerID = 1;

SELECT Name, Popularity FROM Destinations  
WHERE DestinationID = (SELECT DestinationID FROM TourPackages WHERE PackageID = 1);

--CancelBooking
CREATE OR REPLACE PROCEDURE CancelBooking ( 
    p_BookingID IN NUMBER 
) AS 
BEGIN 
    UPDATE Bookings 
    SET Status = 'Cancelled' 
    WHERE BookingID = p_BookingID; 
 
    DBMS_OUTPUT.PUT_LINE('Booking with ID ' || p_BookingID || ' has been cancelled.'); 
EXCEPTION 
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM); 
END; 
/

Begin  
    CancelBooking(1);  
End;
/

SELECT * FROM Bookings WHERE BookingID = 1;


--RevenueReport
CREATE OR REPLACE PROCEDURE RevenueReport IS 
    v_TotalRevenue NUMBER; 
BEGIN 
    SELECT SUM(TotalAmount) INTO v_TotalRevenue FROM Bookings WHERE Status = 'Pending'; 
    DBMS_OUTPUT.PUT_LINE('Total Revenue: ' || v_TotalRevenue); 
END; 
/

Begin 
    RevenueReport(); 
End;
/


--PopularDestinations
CREATE OR REPLACE PROCEDURE PopularDestinations IS 
    CURSOR dest_cursor IS 
        SELECT Name, Popularity FROM Destinations ORDER BY Popularity DESC; 
BEGIN 
    FOR rec IN dest_cursor LOOP 
        DBMS_OUTPUT.PUT_LINE('Destination: ' || rec.Name || ' - Popularity: ' || rec.Popularity); 
    END LOOP; 
END; 
/

Begin  
 	PopularDestinations(); 
End;
/


--SubmitReview
CREATE OR REPLACE PROCEDURE SubmitReview ( 
    p_CustomerID IN NUMBER, 
    p_PackageID IN NUMBER, 
    p_Rating IN NUMBER, 
    p_Comments IN VARCHAR2 
) AS 
BEGIN 
    INSERT INTO Reviews (CustomerID, PackageID, Rating, Comments) 
    VALUES (p_CustomerID, p_PackageID, p_Rating, p_Comments); 
 
    DBMS_OUTPUT.PUT_LINE('Review submitted successfully for Customer ID: ' || p_CustomerID); 
EXCEPTION 
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM); 
END; 
/

Begin
 SubmitReview(1, 1, 5, 'Excellent package!')
 End;
 /
 
SELECT * FROM Reviews WHERE CustomerID = 1;
