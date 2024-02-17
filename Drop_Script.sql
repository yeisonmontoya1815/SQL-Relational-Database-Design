-- Group No 5 
-- Course CSIS 2300-002 – DATABASE I
-- Members:
-- Edanur Donmez Yasuntimur (MySQL Expert)
-- Yeison Montoya			(MS SQL Expert) 
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------

-- Using the Database
USE Facility_Fusion_Database;

-- Start by deleting tables with foreign keys pointing to them
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Resident;
DROP TABLE IF EXISTS Resident_Dependent;
DROP TABLE IF EXISTS Non_resident;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Building_Apartment;

-- Then delete the referenced tables without foreign keys pointing to them
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Facility;
DROP TABLE IF EXISTS Building;
