SPOOL C:\Nur_Suhaira_5841549_A2\solution4Output;

/* ==============================================
Student Name: Nur Suhaira
Student Number: 5841549
Description: Assignment 2 Task 4
Date written: 3rd May 2018
================================================

====================Qn 4(a)=====================*/

-- Grant the user account SYSTEM such that 
-- SYSTEM can retrieve or modify any relational tables 
-- except PRESCRIPTION, and SYSTEM is able to grant 
-- any of these privileges to other users.

SELECT TABLE_NAME FROM USER_TABLES;

GRANT SELECT, UPDATE ON PHARMACEUTICAL TO SYSTEM
WITH GRANT OPTION;

GRANT SELECT, UPDATE ON DOCTOR TO SYSTEM
WITH GRANT OPTION;

GRANT SELECT, UPDATE ON PATIENT TO SYSTEM
WITH GRANT OPTION;

GRANT SELECT, UPDATE ON DRUG TO SYSTEM
WITH GRANT OPTION;

GRANT SELECT, UPDATE ON PHARMACIST TO SYSTEM
WITH GRANT OPTION;

--===============END OF Qn 4(a)=================

--=====================4(b)=====================

-- Grant the user account SYSTEM such that SYSTEM 
-- can retrieve all details of DOCTOR and PRESCRIPTION 
-- prescribed by the doctor 'Steve Miller'.

-- Delete all previously created values

UPDATE PATIENT SET FAMILYDOCTOR = NULL 
WHERE FAMILYDOCTOR = '1209123';

DELETE PRESCRIPTION WHERE DID = '1209123';
DELETE PATIENT WHERE PID = 'S7512890G'; 
DELETE DOCTOR WHERE DID = '1209123';

DROP ROLE SYSTEMROLE_V1;
DROP VIEW PRESCRIPTION_SM;

-- Grant yourself the access
GRANT CREATE VIEW TO USER024;

-- Insert values into the respective tables
DESC DOCTOR;

INSERT INTO DOCTOR (DID, DNAME, SPECIALTY, YEAROFEXP)
VALUES ('1209123', 'Doctor Steve Miller', 'Dermatology', '5');

DESC PATIENT;

INSERT INTO PATIENT (PID, PNAME, PDOB, PADDRESS, PPOSTALCODE, FAMILYDOCTOR, PGENDER)
VALUES ('S7512890G', 'Delta Tan', '24-MAY-2010', 'Simei Street 5', '123456', '1209123', 'M');

DESC PRESCRIPTION;

INSERT INTO PRESCRIPTION (DID, PID, PHARNAME, TRADENAME, PRESCRIPTIONDT, QUANTITY, FAMILYPHARMACIST)
VALUES ('1209123', 'S7512890G', 'Raffles Co.', 'Propranolol', SYSDATE, '10', 'PH0004');

GRANT CREATE ROLE TO USER024;

CREATE ROLE SYSTEMROLE_V1;

CREATE VIEW PRESCRIPTION_SM
AS SELECT * FROM PRESCRIPTION
WHERE DID IN
(SELECT DID 
FROM DOCTOR
WHERE DNAME = 'Doctor Steve Miller');

GRANT SELECT
ON DOCTOR
TO SYSTEMROLE_V1;

GRANT SELECT
ON PRESCRIPTION_SM
TO SYSTEMROLE_V1;

GRANT SYSTEMROLE_V1
TO SYSTEM;

--===============END OF Qn 4(b)=================

--=================Qn 4(c)======================

-- Grant the user account SYSTEM the right to refer 
-- to the primary key of the relational table DRUG 
-- from foreign keys included in the relational tables 
-- owned by SYSTEM.

DESC DRUG;

GRANT REFERENCES (PHARNAME, TRADENAME) ON DRUG TO SYSTEM;

--===============END OF Qn 4(c)=================

--=================Qn 4(d)======================

-- Grant the user account SYSTEM the right 
-- to retrieve the patient’s identification number, 
-- name, and family doctor.

-- Delete previously created values

DROP ROLE SYSTEMROLE_V2;
DROP VIEW V_PATIENT;

CREATE ROLE SYSTEMROLE_V2;

DESC PATIENT;

CREATE VIEW V_PATIENT AS 
SELECT PID, PNAME, FAMILYDOCTOR
FROM PATIENT;

GRANT SELECT 
ON V_PATIENT 
TO SYSTEMROLE_V2;

GRANT SYSTEMROLE_V2 
TO SYSTEM;

--===============END OF Qn 4(d)=================

SPOOL OFF;