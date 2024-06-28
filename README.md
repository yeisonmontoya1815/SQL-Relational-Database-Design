# Project Description

### This is a group project developed in the Database I course, it is shared just for reference

[link to the Database webpage](https://github.com/yeisonmontoya1815/SQL-Relational-Database-Design/blob/main/Final%20Project/index.html)

Consider a housing complex with several high-rise buildings. This housing complex has several recreation facilities (Swimming Pool, Gym, Tennis Course). Tenants living in these buildings can reserve these facilities and this database system is created to manage these facilities. The data requirements are summarized as follows:
•	Each building has a name and address.
•	Each facility has a unique name, type (swimming pool, tennis court…), location (address), and description.
•	Each tenant or the person who reserves the facility, has a name, date of birth, email, phone number, the apartment where they reside, the name of all residents in the same apartment (house…) …start time and end time they lived in that apartment.
•	The person who reserves the facility can be a housing complex resident or non-resident.
•	The reservation information includes the date, time interval, deposited amount (only non-residents pay it), the facility where they reserved, and the number of guests.
•	Information about the employee who books the facility is stored.
•	It is recorded in the database whether the person who reserved the facility showed up.

### Entities and Their Attributes:
1.	Building Entity
o	Attributes: Building ID (unique), Name, Address
2.	Apartment Entity (a weak entity of the Building)
o	Attributes: Apartment ID
3.	Facility Entity
o	Attributes: Name (unique), Type (swimming pool, tennis court…), Location (Address), Description
4.	Person entities have subclasses: Resident (Tenant), Non-resident, Employee
o	Person's Common Attributes: ID (unique), Name (FName, LName), Email, Phone Number,
o	Resident’s Attributes: Date of Birth, Apartment ID, Start Date (in the apartment), End Date (in the apartment), Number of people living together.
o	Non-resident’s Attributes: Address
o	Employee’s Attributes: Department
5.	Dependent Entity (a weak entity of Resident) 
o	Attributes: Dependent name, Date of Birth, Relationship
6.	Reservation Entity
o	Attributes: Reservation ID (unique), Start Time, End Time, Time Interval, Deposited Amount (for non-residents, so this attributes with make the relationship between Reservation and Non-resident entities), Facility Name, Number of Guests, Person Type (Resident or Non-Resident or Employee), Showed Up (Yes or No Boolean type)
Relationships, Cardinality, Participations:

1.	HAVE/HAS Relationship between Apartment and Facility
o	Each Apartment may have multiple Facilities.
o	Each Facility may have multiple Apartments.
Cardinality: Many-to-Many 
Participations: Partial, Partial

2.	LIVES Relationship between Apartment and Tenant (Resident)
o	Each Tenant must live in one Apartment.
o	Each Apartment may have one Tenant who is living there.
Cardinality: One-to-One
Participations: Total, Partial

3.	DEPENDENTS OF Relationship between Tenant (Resident) and Dependent
o	Each Tenant may have DEPENDENTS OF multiple Dependents.
o	Each Dependent must have DEPENDENTS OF one Tenant.
Cardinality: One-to-Many
Participations: Partial, Total

4.	RESERVS Relationship between Tenant (Resident) and Reservation
o	Each Tenant can make multiple Reservations.
o	One Tenant must make each Reservation.
Cardinality: One-to-Many 
Participations: Partial, Total
 
5.	BOOKS Relationship between Non-resident and Reservation
o	Each Non-resident can make multiple Reservations.
o	One Non-resident must make each Reservation.
Cardinality: One-to-Many 
Participations: Partial, Total

6.	MAKES Relationship between Employee and Reservation
o	Each Employee can make multiple Reservations.
o	One Employee must make each Reservation.
Cardinality: One-to-Many 
Participations: Partial, Total

7.	HAVE/HAS Relationship between Facility and Reservation
o	Each Facilities may have multiple Reservations.
o	Each Reservation must have one Facility.
Cardinality: One-to-Many 
Participations: Partial, Total

8.	Overlapping Specialization
o	Each Resident, Non-Resident, Employee must be a Person.
o	Each Person can be a Resident, Non-Resident, or Employee.
Participations: Partial, Total

Constraints:
1.	Tenant ID, Facility Name, Reservation ID, and Employee ID, SIN number are all unique identifiers.
2.	Deposited Amount is only applicable to non-resident reservations.
3.	The Start Date and End Date for tenants in the same apartment should follow logical constraints (e.g., the Start Date of a tenant cannot be after the End Date of the same tenant in the same apartment).
4.	Showed Up should be a Boolean value indicating whether the person who reserved the facility attended.
5.	The Reservation Date and Time Interval should be valid and not overlap with existing reservations for the same facility.
6.	Foreign key constraints to ensure that Facility ID, Tenant ID, and Employee ID in the Reservation table reference valid records in the respective tables (referential integrity).

![image](https://github.com/yeisonmontoya1815/SQL-for-practicing/assets/60417674/183539d4-eccd-492a-a350-b9fef396fc3f)
