SET ECHO ON;
SET FEEDBACK ON;
SPOOL C:\Nur_Suhaira_5841549_A2\solution1Output;

/* ==============================================
Student Name: Nur Suhaira
Student Number: 5841549
Description: Assignment 2 Task 1
Date written: 30th April 2018
================================================*/
-- Drop previously created tables

DROP TABLE PHARMACEUTICAL CASCADE CONSTRAINTS PURGE;
DROP TABLE DOCTOR CASCADE CONSTRAINTS PURGE;
DROP TABLE PATIENT CASCADE CONSTRAINTS PURGE;
DROP TABLE DRUG CASCADE CONSTRAINTS PURGE;
DROP TABLE PRESCRIPTION CASCADE CONSTRAINTS PURGE;

-- Create pharmaceutical table, relation of pharmaceutical company

CREATE TABLE PHARMACEUTICAL 
(
	-- Name of a pharmaceutical company
	PharName VARCHAR2(30) NOT NULL,
	-- The telephone number of a pharmaceutical company
	PharTelephone VARCHAR2(25),
	-- Primary key = PharName
	CONSTRAINT phar_pk PRIMARY KEY (PharName)
);

-- Create doctor table; relation of doctor issuing prescription

CREATE TABLE DOCTOR
(
	-- Identification number of a doctor
	DID VARCHAR2(20) NOT NULL,
	-- The name of a doctor
	DName VARCHAR2(50),
	-- The specialty of a doctor
	Specialty VARCHAR2(70),
	-- The number of years of experiences
	YearOfExp NUMBER,
	-- Primary key = DID
	CONSTRAINT doc_pk PRIMARY KEY (DID)
);

-- Create patient table; relation of patient receiving prescription

CREATE TABLE PATIENT
(
	-- Identification number of a patient
	PID VARCHAR2(20) NOT NULL,
	-- The name of a patient
	PName VARCHAR2(50),
	-- The date birth of a patient
	PDOB DATE,
	-- The address of a patient
	PAddress VARCHAR2(70),
	-- The postal code of a patient
	PPostalCode VARCHAR2(12),
	-- The patient's family doctor
	FamilyDoctor VARCHAR2(20),
	-- Primary key = PID
	CONSTRAINT patient_pk PRIMARY KEY (PID),
	-- Foreign key = FamilyDoctor ref. DOCTOR (DID)
	CONSTRAINT patient_fk FOREIGN KEY (FamilyDoctor) references 
	DOCTOR (DID)
);

-- Create drug table; relation of drug supplied by various pharmaceutical co.

CREATE TABLE DRUG
(
	-- Name of a pharmaceutical co. supplying the drug
	PharName VARCHAR2(30) NOT NULL,
	-- Tradename of of a drug
	TradeName VARCHAR2(30) NOT NULL,
	-- The formula used for the drug
	Formula VARCHAR2(70),
	-- Primary key = PharName, TradeName
	CONSTRAINT drug_pk PRIMARY KEY (PharName, TradeName),
	-- Foreign key = PharName ref. PHARMACEUTICAL (PharName)
	CONSTRAINT drug_fk FOREIGN KEY (PharName) references
	PHARMACEUTICAL (PharName)
);

-- Create prescription table; relation of prescription prescribed

CREATE TABLE PRESCRIPTION
(
	-- Id. of doctor issuing the prescription
	DID VARCHAR2(20) NOT NULL,
	-- Id. of patient receiving the prescription
	PID VARCHAR2(20) NOT NULL,
	-- Name of pharmaceutical co. supplying the drug
	PharName VARCHAR2(30),
	-- Trade name of the drug
	TradeName VARCHAR2(30),
	-- Date of prescription
	PrescriptionDT DATE,
	-- Quantity of the drug prescribed
	Quantity NUMBER,
	-- Primary key = DID, PID, PharName, TradeName, PrescriptionDate
	CONSTRAINT pres_pk PRIMARy KEY (DID, PID, PharName, TradeName, PrescriptionDT),
	-- Foreign key = DID ref. DOCTOR (DID)
	CONSTRAINT pres_fk1 FOREIGN KEY (DID) references
	DOCTOR (DID),
	-- Foreign key = PID ref. PATIENT (PID)
	CONSTRAINT pres_fk2 FOREIGN KEY (PID) references
	PATIENT (PID),
	-- Foreign key = PharName, TradeName ref. DRUG (PharName, TradeName)
	CONSTRAINT pres_fk3 FOREIGN KEY (PharName, TradeName) references
	DRUG (PharName, TradeName),
	-- Constraint Check Quantity between 1 and 30
	CONSTRAINT qty CHECK 
	(
		Quantity BETWEEN 1 AND 30
	)	
);

-- View table contents created
DESC PHARMACEUTICAL;
DESC DOCTOR;
DESC PATIENT;
DESC DRUG;
DESC PRESCRIPTION;

SPOOL OFF;