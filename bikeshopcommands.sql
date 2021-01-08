use bikeshop;

-- -------------------------------------------------
-- Creates an  Owner User & Permissions
-- -------------------------------------------------
create user Owner identified by 'boss';
	grant insert, select,delete, update on bikeshop.* to Owner;

-- -------------------------------------------------
-- Creates an  Sales Supervisor User & Permissions
-- -------------------------------------------------
create user salessupervisor identified by 'super';
	grant insert, select on bikeshop.* to salessupervisor;
	grant insert, update, delete, select on staff to salessupervisor;
    grant update on rental to salessupervisor;
    grant update(rentalPrice, dateRetired) on bike to salessupervisor;
	grant update, delete on customer to salessupervisor;
    
-- -------------------------------------------------
-- Creates a Sales Staff User & Permissions
-- -------------------------------------------------
create user sales identified by 'sales';
	grant insert, update(dateBack, timeBack), select on rental to sales;
	grant insert, update, select on customer to sales;
	grant insert, select on bike to sales;
    grant select on servicejob to sales;
    grant select on inspection to sales;
    
-- ---------------------------------------------------
-- Creates a Technician Supervisor User & Permissions
-- ---------------------------------------------------
create user techsupervisor identified by 'techsuper';
	grant insert, update(dateRetired), select on bike to techsupervisor;
	grant insert, update(partsRepaired), select on servicejob to techsupervisor;
	grant insert, select on inspection to techsupervisor;
	grant select, update(dateRetired) on bike to techsupervisor;
    grant select on rental to techsupervisor;
    grant insert, update, delete, select on staff to salessupervisor;
 
 -- -------------------------------------------------
-- Creates a Technician Staff User & Permissions
-- -------------------------------------------------
create user technician identified by 'tech';
	grant insert, update(dateRetired), select on bike to technician;
	grant insert, select on servicejob to technician;
	grant insert, select on inspection to technician;
    grant select on bike to technician;
    grant select on rental to technician;

-- Displays number of Staff
select count(staffID) as 'Number of Staff' from staff;

-- Number of Technicans
select count(staffID) as 'Number of Technicians'
from staff
where staffRole like '%technician%';

-- Number of Sales Staff
select count(staffID) as 'Number of Sales Staff'
from staff
where staffRole like '%storefront%';

-- Number of Supervisors
select count(staffID) as 'Number of Supervisors'
from staff
where staffRole like '%supervisor%';

-- Number of Bikes Currently in Stock
select count(bikeId) as 'Number of Current Bikes'
from bike
where dateRetired is null;

-- Number of Retired Bikes
select count(bikeid) as 'Number of Bikes Retired'
from bike
where dateretired is not null;

-- Total Rentals by the Store
select count(rental) as 'Total Rentals'
from Rental;

-- BikeRentalCount View
select * from bikerentalcount;

-- Total Customers
select count(customerID) as 'Number of Customers' from customer;

-- Displays all fields from technicianSeriveRecords View
select * from technicianservicerecords;

-- Displays all fields from bikeSeriveRecords View
select * from bikeservicerecords;

-- Displays all fields from bikeInspectionRecords View
select * from bikeinspectionrecords;

-- Displays all fields from technicianInspectionRecords View
select * from technicianinspectionrecords;

-- Displays all fields from bikeRentalRecords View
select * from bikerentalrecords;

-- Displays all fields from customerRentalRecords View
select * from customerrentalrecords;

-- Displays all fields from bike table
select * from bike;

-- Displays all fields from cityBikesView
select * from citybikes;

-- Displays all fields from mountainBikes View
select * from mountainbikes;

-- Displays all fields from hybridBikes View
select * from hybridbikes;

-- Displays all fields from racingBikes View
select * from racingbikes;

-- Displays all manufacturers of Bikes owned by the store
select distinct manufacturer 'Manufacter' from bike;

-- Displays all categories of Bikes owned by the store
select distinct category 'Bike Types' from bike;

-- Displays customerrentalrecords view
select * from customerrentalrecords;

-- Dispalys Technicians View
select * from technicans;

-- Displays Supervisors View
select * from supervisors;

-- Displays rentedBikes View
select * from rentedBikes;

-- Displays roverdueBikes View
select * from overdueBikes;

-- Displays currentBikeStock View
select * from currentBikeStock;

select * from allcustomerloans;

