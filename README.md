# pl-sql-project
# Name: Siddhesh Gite
# Gmail: siddheshgite2004@gmail.com

# Tourism and Travel Management System

## Overview
The **Tourism and Travel Management System** is a database-driven application that helps manage various operations in a tourism and travel agency. This system is developed using **SQL (Structured Query Language)** and covers key functionalities such as customer management, travel package management, booking details, and payment processing.

---

## Database Structure
The system consists of the following tables:

### 1. `Customers`
| Column Name    | Data Type         | Description                    |
|----------------|-------------------|--------------------------------|
| CustomerID     | NUMBER            | Unique ID for each customer     |
| Name           | VARCHAR2(100)     | Name of the customer            |
| Email          | VARCHAR2(100)     | Email address of the customer   |
| Phone          | VARCHAR2(15)      | Phone number of the customer    |
| Address        | VARCHAR2(200)     | Address of the customer         |
| CreatedDate    | DATE              | Date the customer was created   |

### 2. `Agents`
| Column Name    | Data Type         | Description                     |
|----------------|-------------------|---------------------------------|
| AgentID        | NUMBER            | Unique ID for each agent        |
| Name           | VARCHAR2(100)     | Name of the agent               |
| Email          | VARCHAR2(100)     | Email address of the agent      |
| Phone          | VARCHAR2(15)      | Phone number of the agent       |
| CommissionRate | NUMBER(5, 2)      | Commission rate for the agent   |

### 3. `Destinations`
| Column Name    | Data Type         | Description                     |
|----------------|-------------------|---------------------------------|
| DestinationID  | NUMBER            | Unique ID for each destination  |
| Name           | VARCHAR2(100)     | Name of the destination         |
| Country        | VARCHAR2(100)     | Country of the destination      |
| Description    | VARCHAR2(500)     | Description of the destination  |
| Popularity     | NUMBER            | Popularity score of the destination |

### 4. `TourPackages`
| Column Name    | Data Type         | Description                     |
|----------------|-------------------|---------------------------------|
| PackageID      | NUMBER            | Unique ID for each package      |
| Name           | VARCHAR2(100)     | Name of the tour package        |
| DestinationID  | NUMBER            | Foreign key referencing `Destinations` |
| Description    | VARCHAR2(500)     | Description of the package      |
| Price          | NUMBER(10, 2)     | Price of the package            |
| Duration       | NUMBER            | Duration of the package (in days) |

### 5. `Bookings`
| Column Name    | Data Type         | Description                     |
|----------------|-------------------|---------------------------------|
| BookingID      | NUMBER            | Unique ID for each booking      |
| CustomerID     | NUMBER            | Foreign key referencing `Customers` |
| PackageID      | NUMBER            | Foreign key referencing `TourPackages` |
| BookingDate    | DATE              | Date of booking                 |
| TotalAmount    | NUMBER(10, 2)     | Total amount of the booking     |
| AgentID        | NUMBER            | Foreign key referencing `Agents` |
| Status         | VARCHAR2(50)      | Status of the booking (e.g., Pending, Confirmed) |

### 6. `Payments`
| Column Name    | Data Type         | Description                     |
|----------------|-------------------|---------------------------------|
| PaymentID      | NUMBER            | Unique ID for each payment      |
| BookingID      | NUMBER            | Foreign key referencing `Bookings` |
| PaymentDate    | DATE              | Date of payment                 |
| Amount         | NUMBER(10, 2)     | Payment amount                  |
| PaymentMethod  | VARCHAR2(50)      | Method of payment (e.g., Credit Card, UPI) |

### 7. `Transport`
| Column Name    | Data Type         | Description                     |
|----------------|-------------------|---------------------------------|
| TransportID    | NUMBER            | Unique ID for each transport    |
| Type           | VARCHAR2(50)      | Type of transport (e.g., Flight, Bus) |
| Capacity       | NUMBER            | Capacity of the transport       |
| PricePerSeat   | NUMBER(10, 2)     | Price per seat for the transport |

### 8. `Reviews`
| Column Name    | Data Type         | Description                     |
|----------------|-------------------|---------------------------------|
| ReviewID       | NUMBER            | Unique ID for each review       |
| CustomerID     | NUMBER            | Foreign key referencing `Customers` |
| PackageID      | NUMBER            | Foreign key referencing `TourPackages` |
| Rating         | NUMBER            | Rating given by the customer (1 to 5) |
| Comments       | VARCHAR2(1000)    | Comments given by the customer  |
| ReviewDate     | DATE              | Date of the review              |

---

## Table Creation Scripts
```sql
-- Creating Customers table
CREATE TABLE Customers (
    CustomerID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) UNIQUE NOT NULL,
    Phone VARCHAR2(15),
    Address VARCHAR2(200),
    CreatedDate DATE DEFAULT SYSDATE
);

-- Creating Agents table
CREATE TABLE Agents (
    AgentID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100),
    Phone VARCHAR2(15),
    CommissionRate NUMBER(5, 2) DEFAULT 10
);

-- Creating Destinations table
CREATE TABLE Destinations (
    DestinationID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Country VARCHAR2(100) NOT NULL,
    Description VARCHAR2(500),
    Popularity NUMBER DEFAULT 0
);

-- Creating TourPackages table
CREATE TABLE TourPackages (
    PackageID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    DestinationID NUMBER REFERENCES Destinations(DestinationID),
    Description VARCHAR2(500),
    Price NUMBER(10, 2) NOT NULL,
    Duration NUMBER NOT NULL -- in days
);

-- Creating Bookings table
CREATE TABLE Bookings (
    BookingID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    CustomerID NUMBER REFERENCES Customers(CustomerID),
    PackageID NUMBER REFERENCES TourPackages(PackageID),
    BookingDate DATE DEFAULT SYSDATE,
    TotalAmount NUMBER(10, 2) NOT NULL,
    AgentID NUMBER REFERENCES Agents(AgentID),
    Status VARCHAR2(50) DEFAULT 'Pending'
);

-- Creating Payments table
CREATE TABLE Payments (
    PaymentID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    BookingID NUMBER REFERENCES Bookings(BookingID),
    PaymentDate DATE DEFAULT SYSDATE,
    Amount NUMBER(10, 2) NOT NULL,
    PaymentMethod VARCHAR2(50) CHECK (PaymentMethod IN ('Credit Card', 'Debit Card', 'UPI', 'Net Banking'))
);

-- Creating Transport table
CREATE TABLE Transport (
    TransportID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Type VARCHAR2(50) CHECK (Type IN ('Flight', 'Bus', 'Train', 'Car', 'Helicopter', 'Boat', 'Bike', 'Metro', 'Tram', 'SUV')),
    Capacity NUMBER NOT NULL,
    PricePerSeat NUMBER(10, 2) NOT NULL
);

-- Creating Reviews table
CREATE TABLE Reviews (
    ReviewID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    CustomerID NUMBER REFERENCES Customers(CustomerID),
    PackageID NUMBER REFERENCES TourPackages(PackageID),
    Rating NUMBER CHECK (Rating BETWEEN 1 AND 5),
    Comments VARCHAR2(1000),
    ReviewDate DATE DEFAULT SYSDATE
);
```

---

## Insertion Scripts
```sql
-- Inserting data into Customers table
INSERT INTO Customers (Name, Email, Phone, Address) VALUES ('John Doe', 'john.doe@example.com', '1234567890', '123 Main Street');
INSERT INTO Customers (Name, Email, Phone, Address) VALUES ('Jane Smith', 'jane.smith@example.com', '9876543210', '456 Park Avenue');

-- Inserting data into Agents table
INSERT INTO Agents (Name, Email, Phone, CommissionRate) VALUES ('Michael Brown', 'michael.brown@example.com', '555667788', 12.5);
INSERT INTO Agents (Name, Email, Phone, CommissionRate) VALUES ('Lisa White', 'lisa.white@example.com', '666778899', 15);

-- Inserting data into Destinations table
INSERT INTO Destinations (Name, Country, Description, Popularity) VALUES ('Paris', 'France', 'The city of lights and love', 5);
INSERT INTO Destinations (Name, Country, Description, Popularity) VALUES ('Rome', 'Italy', 'The eternal city with rich history', 4);

-- Inserting data into TourPackages table
INSERT INTO TourPackages (Name, DestinationID, Description, Price, Duration) VALUES ('Romantic Getaway', 1, 'A romantic trip to Paris', 2500.00, 7);
INSERT INTO TourPackages (Name, DestinationID, Description, Price, Duration) VALUES ('Historical Tour', 2, 'Discover the ancient wonders of Rome', 3000.00, 10);
```

---

## Procedure to Calculate Total Payments
```sql
CREATE OR REPLACE PROCEDURE Calculate_Total_Payments
AS
    Total_Amount NUMBER;
BEGIN
    SELECT SUM(Amount) INTO Total_Amount FROM Payments;
    DBMS_OUTPUT.PUT_LINE('Total Payment Amount: ' || Total_Amount);
END;
/
```

---

## Trigger to Update Payment Status
```sql
CREATE OR REPLACE TRIGGER Update_Payment_Status
AFTER INSERT ON Payments
FOR EACH ROW
BEGIN
    UPDATE Bookings
    SET Status = 'Paid'
    WHERE BookingID = :NEW.BookingID;
END;
/
```

---

## How to Run
1. Clone this repository:
```bash
git clone https://github.com/yourusername/tourism-travel-management.git
```
2. Connect to your Oracle Database using SQL*Plus or any preferred tool.
3. Execute the scripts in the following order:
   - `table_creation.sql`
   - `data_insertion.sql`
   - `procedures.sql`
   - `triggers.sql`
4. Test the procedures and triggers to ensure the system is working as expected.

---

## Future Enhancements
- Implement a front-end interface using web technologies.
- Add more features such as user authentication, reporting, and analytics.
- Improve error handling in PL/SQL scripts.

---

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

