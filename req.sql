create database hotelManagementSystem;
use hotelManagementSystem;
CREATE TABLE Customer (
    customerID varchar(36) PRIMARY KEY,
    fName VARCHAR(255),
    lName VARCHAR(255),
    houseNo VARCHAR(255),
    state VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255),
    pinCode VARCHAR(10),  
    gender VARCHAR(10),   
    aadhaarNo VARCHAR(12),
    pEmail VARCHAR(255),
    password VARCHAR(255)
);
CREATE TABLE employee (
    empID VARCHAR(36) PRIMARY KEY,
    fName VARCHAR(255),
    lName VARCHAR(255), 
    houseNo VARCHAR(255),
    pincode varchar(10),
    city varchar(255),
    state varchar(255),
    country varchar(255),
    gender varchar(255),
    salary int,
    aadhaarNo varchar(12),
    role varchar(255),
	accountNo varchar(20),
    IFSCCode varchar(255),
    bankName varchar(255),
    pEmail varchar(255),
	loan int,
    loanDetails varchar(255)
);
CREATE TABLE Booking (
    bookingID VARCHAR(36) PRIMARY KEY,
    checkInDate DATE,
    checkOutDate DATE,
    noOfGuests INT,
    customerID VARCHAR(36),
    FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);

CREATE TABLE Bill (
    billID VARCHAR(36) PRIMARY KEY,
    transactionType VARCHAR(255),  
    tDate DATE,
    amount INT,
    bookingID VARCHAR(36),
    FOREIGN KEY (bookingID) REFERENCES Booking(bookingID)
);

CREATE TABLE Room_Type (
    roomCodeID VARCHAR(36) PRIMARY KEY,
    totalRooms INT,
    typeName VARCHAR(255),
    typeDescription VARCHAR(255) 
);
CREATE TABLE Room (
    roomID VARCHAR(36) PRIMARY KEY,
    roomCodeID VARCHAR(36),
    roomNo Varchar(10),
    cost INT,
    occupancyLimit INT,
    FOREIGN KEY (roomCodeID) REFERENCES Room_Type(roomCodeID)
);
CREATE TABLE Book_Room (
    roomID VARCHAR(36),
    bookingID varchar(36),
    FOREIGN KEY (roomID) REFERENCES Room(roomID),
    FOREIGN KEY (bookingID) REFERENCES Booking(bookingID)
);

CREATE TABLE Service (
    serviceID VARCHAR(36) PRIMARY KEY,
    name VARCHAR(255),
    cost INT,
    description VARCHAR(255)  
);
CREATE TABLE Services_Provided (
    serviceID VARCHAR(36),
    bookingID VARCHAR(36),
    PRIMARY KEY (serviceID, bookingID),
    FOREIGN KEY (serviceID) REFERENCES Service(serviceID),
    FOREIGN KEY (bookingID) REFERENCES Booking(bookingID)
);

INSERT INTO Room_Type (roomCodeID, totalRooms, typeName, typeDescription)
VALUES
    ('0a4585c3-9843-11ee-9a04-9c2dcd0ff028', 5, 'Deluxe', 'A Deluxe room offers a basic room with essential amenities'),
    ('0a458f41-9843-11ee-9a04-9c2dcd0ff028', 5, 'Super Deluxe', 'The Super Deluxe room is a comfortable room with additional features'),
    ('0a459099-9843-11ee-9a04-9c2dcd0ff028', 5, 'Cottage', 'The Cottage room is a luxurious choice with extra space and premium services'),
    ('0a45911b-9843-11ee-9a04-9c2dcd0ff028', 5, 'Imperial', 'The Imperial room is a budget-friendly option for cost-conscious travelers'),
    ('0a459191-9843-11ee-9a04-9c2dcd0ff028', 5, 'Club rooms with jharokha', 'The Club room with jharokha offers a spacious room with a separate living area');

INSERT INTO service (serviceID, name, cost, description) 
Values
	(uuid(), "Spa", 500, "Spa"),
    (uuid(), "Restaurant Reseravtions", 600, "Restaurant Reseravtions"),
    (uuid(), "House Keeping", 400, "House Keeping"),
    (uuid(), "Laundry", 400, "Laundry");

CREATE TABLE Admin(
emailID VARCHAR(255),
password VARCHAR(20)
);
INSERT INTO Admin (emailID, password) VALUES ('admin1@abc.com', 'password1');

SET SQL_SAFE_UPDATES = 0;

INSERT INTO Room (roomID, roomCodeID, roomNo, cost, occupancyLimit)
VALUES 
    (UUID(), '0a4585c3-9843-11ee-9a04-9c2dcd0ff028', '101', 1000, 2),
    (UUID(), '0a4585c3-9843-11ee-9a04-9c2dcd0ff028', '201', 1000, 2),
    (UUID(), '0a4585c3-9843-11ee-9a04-9c2dcd0ff028', '301', 1000, 3),
    (UUID(), '0a4585c3-9843-11ee-9a04-9c2dcd0ff028', '401', 1000, 3),
    (UUID(), '0a4585c3-9843-11ee-9a04-9c2dcd0ff028', '501', 1000, 3);

INSERT INTO Room (roomID, roomCodeID, roomNo, cost, occupancyLimit)
VALUES 
    (UUID(), '0a458f41-9843-11ee-9a04-9c2dcd0ff028', '102', 2000, 2),
    (UUID(), '0a458f41-9843-11ee-9a04-9c2dcd0ff028', '202', 2000, 2),
    (UUID(), '0a458f41-9843-11ee-9a04-9c2dcd0ff028', '302', 2000, 3),
    (UUID(), '0a458f41-9843-11ee-9a04-9c2dcd0ff028', '402', 2000, 3),
    (UUID(), '0a458f41-9843-11ee-9a04-9c2dcd0ff028', '502', 2000, 3);

INSERT INTO Room (roomID, roomCodeID, roomNo, cost, occupancyLimit)
VALUES 
    (UUID(), '0a459099-9843-11ee-9a04-9c2dcd0ff028', '103', 3000, 2),
    (UUID(), '0a459099-9843-11ee-9a04-9c2dcd0ff028', '203', 3000, 2),
    (UUID(), '0a459099-9843-11ee-9a04-9c2dcd0ff028', '303', 3000, 2),
    (UUID(), '0a459099-9843-11ee-9a04-9c2dcd0ff028', '403', 3000, 3),
    (UUID(), '0a459099-9843-11ee-9a04-9c2dcd0ff028', '503', 3000, 3);

INSERT INTO Room (roomID, roomCodeID, roomNo, cost, occupancyLimit)
VALUES 
    (UUID(), '0a45911b-9843-11ee-9a04-9c2dcd0ff028', '104', 4000, 2),
    (UUID(), '0a45911b-9843-11ee-9a04-9c2dcd0ff028', '204', 4000, 2),
    (UUID(), '0a45911b-9843-11ee-9a04-9c2dcd0ff028', '304', 4000, 3),
    (UUID(), '0a45911b-9843-11ee-9a04-9c2dcd0ff028', '404', 4000, 3),
    (UUID(), '0a45911b-9843-11ee-9a04-9c2dcd0ff028', '504', 4000, 3);

INSERT INTO Room (roomID, roomCodeID, roomNo, cost, occupancyLimit)
VALUES 
    (UUID(), '0a459191-9843-11ee-9a04-9c2dcd0ff028', '105', 5000, 2),
    (UUID(), '0a459191-9843-11ee-9a04-9c2dcd0ff028', '205', 5000, 2),
    (UUID(), '0a459191-9843-11ee-9a04-9c2dcd0ff028', '305', 5000, 3),
    (UUID(), '0a459191-9843-11ee-9a04-9c2dcd0ff028', '405', 5000, 3),
    (UUID(), '0a459191-9843-11ee-9a04-9c2dcd0ff028', '505', 5000, 3);
