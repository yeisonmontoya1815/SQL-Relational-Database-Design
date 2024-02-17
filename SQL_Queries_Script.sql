-- Group No 5 
-- Course CSIS 2300-002 – DATABASE I
-- Members:
-- Edanur Donmez Yasuntimur (MySQL Expert)
-- Yeison Montoya			(MS SQL Expert) 
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------

-- Using the Database
USE Facility_Fusion_Database;


-- 1. What residents' first names, last names, and their building names are retrieved?
-- Retrieves the first names, last names, and building names of residents by performing an inner join on the Resident, Person, and Building tables.
SELECT Person.FName, Person.LName, Building.Building_Name
FROM Resident
INNER JOIN Person ON Resident.PersonID = Person.PersonID
INNER JOIN Building ON Resident.BuildingID = Building.BuildingID;

-- 2. Who are the non-residents, and what are their first names, last names, and addresses?
-- Retrieves the first names, last names, and addresses of non-residents by performing a left join on the Non_resident and Person tables.
SELECT P.FName, P.LName, NR.Address
FROM Non_resident NR
LEFT JOIN Person P ON NR.PersonID = P.PersonID
WHERE P.FName IS NOT NULL AND P.LName IS NOT NULL AND NR.Address IS NOT NULL;

-- 3. Which facilities have reservation information, including start and end times?
-- Retrieves facility names along with reservation start and end times by performing a right join on the Facility and Reservation tables.
SELECT Facility.FacilityName, Reservation.StartTime, Reservation.EndTime
FROM Facility
RIGHT JOIN Reservation ON Facility.FacilityID = Reservation.FacilityID
WHERE Facility.FacilityName IS NOT NULL AND Reservation.StartTime IS NOT NULL AND Reservation.EndTime IS NOT NULL;

-- 4. Who are the employees, and what are their first names, last names, and departments?
-- Retrieves the first names, last names, and departments of employees by performing an inner join on the Person and Employee tables.
SELECT
    Person.FName,
    Person.LName,
    Employee.Department
FROM
    Person
JOIN
    Employee ON Person.PersonID = Employee.PersonID
WHERE
    Person.FName IS NOT NULL
    AND Person.LName IS NOT NULL
    AND Employee.Department IS NOT NULL;

-- 5. What combinations of persons and facilities are retrieved?
-- Retrieves all combinations of persons and facilities by performing a cross join on the Person and Facility tables.
SELECT Person.FName, Person.LName, Facility.FacilityName
FROM Person
CROSS JOIN Facility
WHERE Person.FName IS NOT NULL AND Person.LName IS NOT NULL AND Facility.FacilityName IS NOT NULL;

-- 6. What is the updated facility type for the facility with ID 3?
-- Updates the facility type to 'Meeting Room' for the facility with ID 3.
UPDATE Facility
SET Type = 'Meeting Room'
WHERE FacilityID = 3;

-- 7. What reservation is deleted with ReservationID 7?
-- Deletes the reservation with ReservationID 7.
DELETE FROM Reservation
WHERE ReservationID = 7;

-- 8. What new reservation is inserted with ReservationID 7, start time, end time, number of guests, etc.?
-- Inserts a new reservation with ReservationID 7, start time, end time, number of guests, etc.
INSERT INTO Reservation (ReservationID, StartTime, EndTime, NumberOfGuest, ShowedUp, FacilityID, PersonID)
VALUES (7, '2021-10-23 11:00', '2021-10-23 13:00', 2, 0, 2, 2);

-- 9. What is the average duration of reservations in minutes?
-- Calculates the average duration of reservations in minutes. Difference from MySQL, using DATEDIFF
SELECT AVG(DATEDIFF(MINUTE, StartTime, EndTime)) AS Avg_Duration_Reservation
FROM Reservation;


-- 10. How many facilities are there in total?
-- Counts the total number of facilities.
SELECT COUNT(*) AS FacilityCount
FROM Facility;

-- 11. How many reservations are made by each person, and what are their names?
-- Shows the number of reservations made by each person along with their names.
SELECT P.PersonID, P.FName, P.LName, COUNT(R.ReservationID) AS ReservationCount
FROM Person P
JOIN Reservation R ON P.PersonID = R.PersonID
WHERE P.FName IS NOT NULL AND P.LName IS NOT NULL
GROUP BY P.PersonID, P.FName, P.LName
HAVING COUNT(R.ReservationID) > 1;

-- 12. How many reservations are there for each facility?
-- Shows the number of reservations for each facility, ordered by reservation count.
SELECT Facility.FacilityName, COUNT(Reservation.ReservationID) AS ReservationCount
FROM Facility
LEFT JOIN Reservation ON Facility.FacilityID = Reservation.FacilityID
GROUP BY Facility.FacilityName
ORDER BY ReservationCount DESC;

-- 13. What information about residents and their buildings is displayed in the view?
-- Creates a view named ResidentInfo that displays information about residents, including first names, last names, start dates, and building names.
CREATE VIEW ResidentInfo AS
SELECT Person.FName, Person.LName, Resident.StartDate, Building.Building_Name
FROM Resident
INNER JOIN Person ON Resident.PersonID = Person.PersonID
INNER JOIN Building ON Resident.BuildingID = Building.BuildingID
WHERE Person.FName IS NOT NULL AND Person.LName IS NOT NULL AND Resident.StartDate IS NOT NULL AND Building.Building_Name IS NOT NULL;

SELECT *
FROM ResidentInfo;

-- 14. How is the utilization of each facility displayed, including the total reservation time in minutes?
-- Shows the utilization of each facility, including the total reservation time in minutes. 
SELECT
    Facility.FacilityName,
    SUM(DATEDIFF(MINUTE, Reservation.StartTime, Reservation.EndTime)) AS TotalUtilizationMinutes -- In MySQL, the TIMESTAMPDIFF function is used, while in MS SQL Server, the DATEDIFF function is used.
FROM
    Facility
LEFT JOIN
    Reservation ON Facility.FacilityID = Reservation.FacilityID
GROUP BY
    Facility.FacilityName;
	
-- 15. How many reservations are made by each person?
-- Finds the total number of reservations made by each person along with their names.
SELECT Person.FName, Person.LName, COUNT(Reservation.ReservationID) AS ReservationCount
FROM Person
LEFT JOIN Reservation ON Person.PersonID = Reservation.PersonID
GROUP BY Person.FName, Person.LName
ORDER BY ReservationCount DESC;

-- 16. What is the average number of guests per facility?
-- Calculates the Average of guests per facility
SELECT Facility.FacilityName, AVG(Reservation.NumberOfGuest) AS AverageGuests
FROM Facility
LEFT JOIN Reservation ON Facility.FacilityID = Reservation.FacilityID
GROUP BY Facility.FacilityName;

-- 17. Who are the residents' dependents, and what are their names and relationships?
-- Lists the names and relationships of residents' dependents.
SELECT P.FName AS ResidentFName, P.LName AS ResidentLName, RD.DependentName, RD.Relationship
FROM Resident_Dependent RD
LEFT JOIN Resident R ON RD.PersonID = R.PersonID
LEFT JOIN Person P ON RD.PersonID = P.PersonID
WHERE P.FName IS NOT NULL AND P.LName IS NOT NULL AND RD.DependentName IS NOT NULL;

-- 18. What resident information, along with reservation details, including facility names, is retrieved?
-- Retrieves information about residents, including their first and last names, building names, apartment IDs, reservation details (ID, start and end times), and facility names.
SELECT
    Resident.PersonID,
    Person.FName AS ResidentFirstName,
    Person.LName AS ResidentLastName,
    Building.Building_Name,
    Building_Apartment.ApartmentID,
    Reservation.ReservationID,
    Reservation.StartTime,
    Reservation.EndTime,
    Facility.FacilityName
FROM
    Resident
INNER JOIN Person ON Resident.PersonID = Person.PersonID
INNER JOIN Building_Apartment ON Resident.BuildingID = Building_Apartment.BuildingID AND Resident.ApartmentID = Building_Apartment.ApartmentID
INNER JOIN Building ON Resident.BuildingID = Building.BuildingID
LEFT JOIN Reservation ON Resident.PersonID = Reservation.PersonID
LEFT JOIN Facility ON Reservation.FacilityID = Facility.FacilityID
WHERE
    Reservation.reservationID IS NOT NULL;

-- 19. What is the total number of guests in 2021?
-- Calculates total number of guests in 2021 
SELECT SUM(NumberOfGuest) AS "Total Guests in 2021"
FROM Reservation
WHERE StartTime >= '2021-01-01' AND StartTime < '2022-01-01';

-- 20. What are the youngest and oldest resident ages?
-- Retrieves the names, ages, and names of the youngest and oldest residents. Differences from MySQL, using DATEDIFF and TOP
SELECT
    (SELECT TOP 1 Person.FName FROM Resident INNER JOIN Person ON Resident.PersonID = Person.PersonID ORDER BY DATEDIFF(YEAR, ResidentDoB, GETDATE())) AS YoungestResidentName,
    (SELECT TOP 1 Person.LName FROM Resident INNER JOIN Person ON Resident.PersonID = Person.PersonID ORDER BY DATEDIFF(YEAR, ResidentDoB, GETDATE())) AS YoungestResidentLastName,
    (SELECT TOP 1 DATEDIFF(YEAR, ResidentDoB, GETDATE()) FROM Resident ORDER BY DATEDIFF(YEAR, ResidentDoB, GETDATE())) AS YoungestResidentAge,
    (SELECT TOP 1 Person.FName FROM Resident INNER JOIN Person ON Resident.PersonID = Person.PersonID ORDER BY DATEDIFF(YEAR, ResidentDoB, GETDATE()) DESC) AS OldestResidentName,
    (SELECT TOP 1 Person.LName FROM Resident INNER JOIN Person ON Resident.PersonID = Person.PersonID ORDER BY DATEDIFF(YEAR, ResidentDoB, GETDATE()) DESC) AS OldestResidentLastName,
    (SELECT TOP 1 DATEDIFF(YEAR, ResidentDoB, GETDATE()) FROM Resident ORDER BY DATEDIFF(YEAR, ResidentDoB, GETDATE()) DESC) AS OldestResidentAge;