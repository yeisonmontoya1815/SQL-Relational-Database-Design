-- Group No 5 
-- Course CSIS 2300-002 – DATABASE I
-- Members:
-- Edanur Donmez Yasuntimur (MySQL Expert)
-- Yeison Montoya			(MS SQL Expert) 
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------

-- Using the Database
USE Facility_Fusion_Database;

-- Insert into Building
INSERT INTO Building VALUES (1, 'Building A', '123 Main St');
INSERT INTO Building VALUES (2, 'Building B', '456 Oak St');
INSERT INTO Building VALUES (3, 'Building C', '789 Pine St');
INSERT INTO Building VALUES (4, 'Building D', '135 Elm St');
INSERT INTO Building VALUES (5, 'Building E', '246 Maple St');

-- Insert into Building_Apartment (assuming these apartments belong to the inserted buildings)
INSERT INTO Building_Apartment VALUES (1, 101);
INSERT INTO Building_Apartment VALUES (2, 102);
INSERT INTO Building_Apartment VALUES (3, 103);
INSERT INTO Building_Apartment VALUES (4, 104);
INSERT INTO Building_Apartment VALUES (5, 105);

-- Insert residents into Person
INSERT INTO Person VALUES (1, 'John', 'Doe', 'john.doe@email.com', '1234567890', 'Resident');
INSERT INTO Person VALUES (2, 'Jane', 'Smith', 'jane.smith@email.com', '2345678901', 'Resident');
INSERT INTO Person VALUES (3, 'Jim', 'Bean', 'jim.bean@email.com', '3456789012', 'Resident');
INSERT INTO Person VALUES (4, 'Lily', 'Clark', 'lily.clark@email.com', '4567890123', 'Resident');
INSERT INTO Person VALUES (5, 'Ted', 'Mosby', 'ted.mosby@email.com', '5678901234', 'Resident');

-- Insert non-residents into Person
INSERT INTO Person VALUES (6, 'Sara', 'Stone', 'sara.stone@email.com', '6789012345', 'Non_resident');
INSERT INTO Person VALUES (7, 'Lucas', 'Grey', 'lucas.grey@email.com', '7890123456', 'Non_resident');
INSERT INTO Person VALUES (8, 'Mia', 'Hart', 'mia.hart@email.com', '8901234567', 'Non_resident');
INSERT INTO Person VALUES (9, 'Omar', 'Khan', 'omar.khan@email.com', '9012345678', 'Non_resident');
INSERT INTO Person VALUES (10, 'Tina', 'Roy', 'tina.roy@email.com', '0123456789', 'Non_resident');

-- Insert employees into Person
INSERT INTO Person VALUES (11, 'Alex', 'Gordon', 'alex.gordon@email.com', '1233506789', 'Employee');
INSERT INTO Person VALUES (12, 'Betty', 'Kumar', 'betty.kumar@email.com', '2355607891', 'Employee');
INSERT INTO Person VALUES (13, 'Charlie', 'Yang', 'charlie.yang@email.com', '3445908912', 'Employee');
INSERT INTO Person VALUES (14, 'Diana', 'Lopez', 'diana.lopez@email.com', '4557809123', 'Employee');
INSERT INTO Person VALUES (15, 'Edward', 'Zhang', 'edward.zhang@email.com', '5600901234', 'Employee');

-- Insert into Resident (assuming the persons and apartments exist)
INSERT INTO Resident VALUES (1, '1980-01-01', '2020-01-01', 1, 101);
INSERT INTO Resident VALUES (2, '1985-02-02', '2019-02-01', 2, 102);
INSERT INTO Resident VALUES (3, '1990-03-03', '2023-03-01', 3, 103);
INSERT INTO Resident VALUES (4, '1995-04-04', '2021-04-01', 4, 104);
INSERT INTO Resident VALUES (5, '2000-05-05', '2023-05-01', 5, 105);

-- Insert into Resident_Dependent (assuming the residents exist)
INSERT INTO Resident_Dependent VALUES (1, 'Alice Doe', '2010-06-01', 'Daughter');
INSERT INTO Resident_Dependent VALUES (1, 'Bob Doe', '2012-07-02', 'Son');
INSERT INTO Resident_Dependent VALUES (1, 'Mary Doe', '1983-09-01', 'Wife');
INSERT INTO Resident_Dependent VALUES (3, 'Charlie Bean', '2014-08-03', 'Son');
INSERT INTO Resident_Dependent VALUES (4, 'Marshall Clark', '2020-08-03', 'Husband');
INSERT INTO Resident_Dependent VALUES (4, 'Daisy Clark', '2016-09-04', 'Daughter');
INSERT INTO Resident_Dependent VALUES (4, 'Marvin Clark', '2020-10-05', 'Son');

-- Insert into Non_resident (assuming these are different people than the residents)
INSERT INTO Non_resident VALUES (6, '789 Oak St');
INSERT INTO Non_resident VALUES (7, '135 Pine St');
INSERT INTO Non_resident VALUES (8, '246 Elm St');
INSERT INTO Non_resident VALUES (9, '123 Maple St');
INSERT INTO Non_resident VALUES (10, '456 Main St');

-- Insert into Employee (assuming these are different people than the residents and non-residents)
INSERT INTO Employee VALUES (11, 'Maintenance');
INSERT INTO Employee VALUES (12, 'Security');
INSERT INTO Employee VALUES (13, 'Management');
INSERT INTO Employee VALUES (14, 'Reception');
INSERT INTO Employee VALUES (15, 'Cleaning');

-- Insert into Facility
INSERT INTO Facility VALUES (1, 'Gym', 'Recreational', '1st Floor', 'Fully equipped gym');
INSERT INTO Facility VALUES (2, 'Pool', 'Recreational', 'Rooftop', 'Heated swimming pool');
INSERT INTO Facility VALUES (3, 'Conference Room', 'Business', '2nd Floor', 'Conference room with AV setup');
INSERT INTO Facility VALUES (4, 'Spa', 'Wellness', '3rd Floor', 'Full service spa and sauna');
INSERT INTO Facility VALUES (5, 'Rooftop Patio', 'Recreational', 'Rooftop', 'Rooftop patio with grilling area');

-- Inserting sample reservation data into the Reservation table with columns: 
-- ReservationID, StartTime, EndTime, NumberOfGuest, ShowedUp, FacilityID, PersonID
INSERT INTO Reservation -- Different from MySQL (true, false) in MSSQL Boolean values are (1,0)
VALUES (1, '2021-11-01T10:00:00', '2021-11-01T11:00:00', 2, 1, 1, 1),
       (2, '2020-06-02T12:00:00', '2020-06-02T13:00:00', 3, 0, 2, 2),
       (3, '2023-07-13T14:00:00', '2023-07-13T15:00:00', 5, 1, 3, 6),
       (4, '2022-12-04T16:00:00', '2022-12-04T17:00:00', 1, 1, 4, 11),
       (5, '2023-09-05T18:00:00', '2023-09-05T19:00:00', 4, 0, 5, 3),
       (6, '2023-11-01T08:00:00', '2023-11-01T10:00:00', 1, 1, 1, 1),
       (7, '2021-10-23T11:00:00', '2021-10-23T13:00:00', 2, 0, 2, 2),
       (8, '2023-04-05T14:00:00', '2023-04-05T16:00:00', 1, 1, 1, 3),
       (9, '2022-03-06T09:00:00', '2022-03-06T10:00:00', 3, 1, 3, 4),
       (10, '2023-10-07T20:00:00', '2023-10-07T22:00:00', 4, 1, 2, 5),
       (11, '2023-09-08T09:00:00', '2023-09-08T11:00:00', 2, 1, 4, 6),
       (12, '2023-05-19T12:00:00', '2023-05-19T14:00:00', 3, 1, 3, 7),
       (13, '2022-02-10T15:00:00', '2023-02-10T17:00:00', 1, 1, 1, 8),
       (14, '2020-04-11T18:00:00', '2020-04-11T20:00:00', 3, 0, 4, 9),
       (15, '2021-08-12T10:00:00', '2023-08-12T12:00:00', 6, 1, 5, 10);