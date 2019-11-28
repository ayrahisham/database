SPOOL C:\Nur_Suhaira_5841549_A2\solution2Output;

/* ==============================================
Student Name: Nur Suhaira
Student Number: 5841549
Description: Assignment 2 Task 2
Date written: 1st May 2018
================================================

====================Qn 2(a)=====================*/

-- The owner of the database would like to speed up 
-- the queries of information about patients. 
-- The information is retrieved through providing 
-- a patient name. 

-- Delete previous created index

DROP INDEX P_INDEX;

CREATE INDEX P_INDEX ON PATIENT(PNAME);

--=================END OF Qn 2(a)=================

--====================Qn 2(b)=====================

-- The owner of the database would like to add 
-- to the database a gender of the patient. 
-- The values ‘M’ and ‘F’ must be used to indicate 
-- if a patient is male or female.  

-- Delete previously created gender column in patient

ALTER TABLE PATIENT DROP COLUMN PGENDER;

-- View patient table 

DESC PATIENT;

-- Add gender column in patient table 

ALTER TABLE PATIENT ADD (PGender VARCHAR2(1));
ALTER TABLE PATIENT ADD CONSTRAINT check_pgender 
CHECK (PGENDER IN ('M', 'F'));

-- View updated table

DESC PATIENT;

--=================END OF Qn 2(b)=================

--====================Qn 2(c)=====================

-- Delete previously created familypharmacist column in prescription

ALTER TABLE PRESCRIPTION DROP COLUMN FAMILYPHARMACIST;

-- Drop previously created table

DROP TABLE PHARMACIST CASCADE CONSTRAINTS PURGE;

-- Create a pharmacist table who dispenses 
-- prescribed drugs and relationship 
-- with the prescription 

CREATE TABLE PHARMACIST
(
	-- A pharmacist is described by name, addressed and a license number. 
	PharLicenseNo VARCHAR2(10) NOT NULL,
	PharmacistName VARCHAR2(30),
	-- The license number uniquely identifies each pharmacist
	PharmacistAddress VARCHAR2(70),
	CONSTRAINT pharmacist_pk PRIMARY KEY (PharLicenseNo)	
);

-- A pharmacist may dispense many prescription, 
-- and each prescription is dispensed only by one pharmacist

ALTER TABLE PRESCRIPTION ADD (FamilyPharmacist VARCHAR2(10));
ALTER TABLE PRESCRIPTION ADD CONSTRAINT pres_fk4 
FOREIGN KEY (FamilyPharmacist) references
PHARMACIST (PharLicenseNo);

-- View pharmacist table
DESC PHARMACIST;

-- View prescription table
DESC PRESCRIPTION;

--=================END OF Qn 2(c)=================

SPOOL OFF;