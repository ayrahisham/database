SPOOL C:\Nur_Suhaira_5841549_A2\solution3Output;

/* ==============================================
Student Name: Nur Suhaira
Student Number: 5841549
Description: Assignment 2 Task 3
Date written: 2nd May 2018
================================================

====================Qn 3(a)=====================*/

-- Delete previously created values in tables

UPDATE PATIENT SET FAMILYDOCTOR = NULL 
WHERE FAMILYDOCTOR = '3332858';

TRUNCATE TABLE PRESCRIPTION;
DELETE DOCTOR WHERE DID = '3332858'; 
DELETE DRUG WHERE TRADENAME = 'Propranolol';
DELETE PHARMACIST WHERE PHARLICENSENO = 'PH0004';
DELETE PATIENT WHERE PID = 'S2598868B';
DELETE PHARMACEUTICAL WHERE PHARNAME = 'Raffles Co.';

-- A NEW female patient Ann Miller has appointed 
-- Doctor Martin Lucas as her family doctor. 

DESC DOCTOR;

-- The identification number of Doctor Martin Lucas is 3332858. 
-- Dr Martin Lucas has 10 years of experiences as general practitioner

INSERT INTO DOCTOR (DID, DNAME, SPECIALTY, YEAROFEXP)
VALUES ('3332858', 'Doctor Martin Lucas', 'General Practitioner', '10');

DESC PATIENT;

-- The NRIC of Ann is S2598868B. 
-- Ann was born on 9 September 1992, 
-- and she lives at 22nd street, Singapore. 
-- The postal code Ann lives in is 650142.
-- A NEW female patient Ann Miller has appointed 
-- Doctor Martin Lucas as her family doctor. 

INSERT INTO PATIENT (PID, PNAME, PDOB, PADDRESS, PPOSTALCODE, FAMILYDOCTOR, PGENDER)
VALUES ('S2598868B', 'Ann Miller', '09-SEP-1992', '22nd street, Singapore', '650142', '3332858', 'F');

-- Ann has been treated today for fever 
-- and has been prescribed with 10 tablets of 
-- the drug ‘Propranolol’ supplied by Pfizer

-- Insert appropriate values in pharmaceutical & drug tables

INSERT INTO PHARMACEUTICAL (PHARNAME, PHARTELEPHONE)
VALUES ('Raffles Co.', '65129807');

SELECT * FROM PHARMACEUTICAL;

DESC DRUG;

INSERT INTO DRUG (PHARNAME, TRADENAME, FORMULA)
VALUES ('Raffles Co.', 'Propranolol', 'C16H21NO2');

DESC PHARMACIST;

INSERT INTO PHARMACIST (PHARLICENSENO, PHARMACISTNAME, PHARMACISTADDRESS)
VALUES ('PH0004', 'Pfizer', '12th Boolean St');

DESC PRESCRIPTION;

INSERT INTO PRESCRIPTION (DID, PID, PHARNAME, TRADENAME, PRESCRIPTIONDT, QUANTITY, FAMILYPHARMACIST)
VALUES ('3332858', 'S2598868B', 'Raffles Co.', 'Propranolol', SYSDATE, '10', 'PH0004');

SELECT * FROM DRUG WHERE TRADENAME = 'Propranolol';
SELECT * FROM PHARMACIST WHERE PHARLICENSENO = 'PH0004';
SELECT * FROM DOCTOR WHERE DNAME = 'Doctor Martin Lucas';
SELECT * FROM PATIENT WHERE PNAME = 'Ann Miller';
SELECT * FROM PRESCRIPTION WHERE PID = 'S2598868B';

--=================END OF Qn 3(a)===================

--=====================Qn 3(b)======================

--  Delete from the database all information related to the 
-- doctor Bruce Thompson including his relationship as 
-- a family doctor and the prescription prescribed by him. 

-- Delete previously created values

DELETE PATIENT WHERE PID = 'S1234321T';
DELETE PATIENT WHERE PID = 'S1238922G';

-- Create a tuple value in doctor table

DESC DOCTOR;

INSERT INTO DOCTOR (DID, DNAME, SPECIALTY, YEAROFEXP)
VALUES ('4322128', 'Doctor Bruce Thompson', 'Surgeon', '11');

DESC PATIENT;

INSERT INTO PATIENT (PID, PNAME, PDOB, PADDRESS, PPOSTALCODE, FAMILYDOCTOR, PGENDER)
VALUES ('S1234321T', 'Johnson Rad', '24-JUN-1994', '32nd Bencoolen Road', '341234', '4322128', 'M');

INSERT INTO PATIENT (PID, PNAME, PDOB, PADDRESS, PPOSTALCODE, FAMILYDOCTOR, PGENDER)
VALUES ('S1238922G', 'Phoebe Lia', '30-JUL-1971', '10th Beach Road', '341904', '4322128', 'F');

DESC PRESCRIPTION;

INSERT INTO PRESCRIPTION (DID, PID, PHARNAME, TRADENAME, PRESCRIPTIONDT, QUANTITY, FAMILYPHARMACIST)
VALUES ('4322128', 'S1234321T', 'Raffles Co.', 'Propranolol', SYSDATE, '4', 'PH0004');

INSERT INTO PRESCRIPTION (DID, PID, PHARNAME, TRADENAME, PRESCRIPTIONDT, QUANTITY, FAMILYPHARMACIST)
VALUES ('4322128', 'S1238922G', 'Raffles Co.', 'Propranolol', SYSDATE, '9', 'PH0004');

-- View all information on Dr. Bruce Thompson
SELECT * FROM DOCTOR WHERE DNAME LIKE '%Bruce Thompson';
SELECT * FROM PATIENT WHERE FAMILYDOCTOR = '4322128';
SELECT * FROM PRESCRIPTION WHERE DID = '4322128';

-- Transfer ALL patients with Dr. Bruce Thompson to Dr. Martin Lucas;
UPDATE PATIENT 
SET FAMILYDOCTOR = '3332858' 
WHERE FAMILYDOCTOR IN
(SELECT DID
FROM DOCTOR 
WHERE DID = '4322128');

-- Update ALL prescriptions by Dr. Bruce Thompson to their replaced doctor
UPDATE PRESCRIPTION 
SET DID = '3332858' 
WHERE DID IN
(SELECT DID 
FROM DOCTOR
WHERE DID = '4322128');

DELETE DOCTOR WHERE DNAME = 'Doctor Bruce Thompson'; 

--=================END OF Qn 3(b)===================

SPOOL OFF;