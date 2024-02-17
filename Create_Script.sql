-- Group No 5 
-- Course CSIS 2300-002 – DATABASE I
-- Members:
-- Edanur Donmez Yasuntimur (MySQL Expert)
-- Yeison Montoya			(MS SQL Expert) 
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------

-- Creating the Database
CREATE DATABASE Facility_Fusion_Database;

-- Using the Database
USE Facility_Fusion_Database;

-- 1. Building table
CREATE TABLE Building (
    BuildingID INT PRIMARY KEY NOT NULL,
    Building_Name VARCHAR(25) NOT NULL,
    Address VARCHAR(255) NOT NULL
);

-- 2. Building_Apartment table
CREATE TABLE Building_Apartment (
    BuildingID INT NOT NULL,
    ApartmentID INT NOT NULL,
    PRIMARY KEY (BuildingID, ApartmentID),
    FOREIGN KEY (BuildingID) REFERENCES Building(BuildingID) ON DELETE CASCADE
);

-- 3. Person table
CREATE TABLE Person (
    PersonID INT PRIMARY KEY NOT NULL,
    FName VARCHAR(25) NOT NULL,
    LName VARCHAR(25) NOT NULL,
    E_mail VARCHAR(50) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(20) NOT NULL,
    PersonType VARCHAR(50) NOT NULL
);

-- 4. Resident table
CREATE TABLE Resident (
    PersonID INT,
    ResidentDoB DATE NOT NULL,
    StartDate DATE NOT NULL,
    BuildingID INT NOT NULL,
    ApartmentID INT NOT NULL,
    PRIMARY KEY (PersonID),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID) ON DELETE CASCADE,
    FOREIGN KEY (BuildingID, ApartmentID) REFERENCES Building_Apartment(BuildingID, ApartmentID) ON DELETE CASCADE
);

-- 5. Resident_Dependent table
CREATE TABLE Resident_Dependent (
    PersonID INT NOT NULL,
    DependentName VARCHAR(50) NOT NULL,
    DoB DATE NOT NULL,
    Relationship VARCHAR(50) NOT NULL,
    PRIMARY KEY (PersonID, DependentName),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID) ON DELETE CASCADE
);

-- 6. Non-resident table
CREATE TABLE Non_resident (
    PersonID INT PRIMARY KEY NOT NULL,
    Address VARCHAR(255) NOT NULL,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID) ON DELETE CASCADE
);

-- 7. Employee table
CREATE TABLE Employee (
    PersonID INT PRIMARY KEY NOT NULL,
    Department VARCHAR(100) NOT NULL,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID) ON DELETE CASCADE
);

-- 8. Facility table
CREATE TABLE Facility (
    FacilityID INT PRIMARY KEY NOT NULL,
    FacilityName VARCHAR(100) NOT NULL,
    Type VARCHAR(50) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    Description TEXT NOT NULL
);

-- 9. Reservation table
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY NOT NULL,
    StartTime DATETIME NOT NULL,
    EndTime DATETIME NOT NULL,
    NumberOfGuest INT,
    ShowedUp BIT,
    FacilityID INT NOT NULL,
    PersonID INT NOT NULL,
    FOREIGN KEY (FacilityID) REFERENCES Facility(FacilityID) ON DELETE CASCADE,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID) ON DELETE CASCADE
);
