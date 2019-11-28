SPOOL C:\Nur_Suhaira_5841549_A2\solution5Output;

/* ==============================================
Student Name: Nur Suhaira
Student Number: 5841549
Description: Assignment 2 Task 5
Date written: 9th May 2018
================================================

====================Qn 5(a)=====================*/

-- Drop tables previously created
-- @C:\Nur_Suhaira_5841549_A2\DropDbPartyChef.sql;

-- Execute the script CreateDbPartyChef.sql to create 
-- a sample database. 
-- The database contains information about 
-- the parties held by clients and the chefs engaged 
-- in parties. The specialities of chefs are also stored 
-- in the sample database

@C:\Nur_Suhaira_5841549_A2\CreateDbPartyChef.sql;

-- List the full details and age of all chefs 
-- who are between 21 and 40 years old. 

-- To list values from chef
SELECT * FROM CHEF;

SELECT CHEFFNAME, CHEFLNAME, SEX, DOB,
TRUNC (months_between(SYSDATE, DOB)/12) AS AGE
FROM CHEF 
WHERE TRUNC (months_between(SYSDATE, DOB)/12) > 20
AND TRUNC (months_between(SYSDATE, DOB)/12) < 41;

--================END OF Qn 5(a)=================

--===================Qn 5(b)=====================

--List the client first and last name, email, 
-- and a total number of parties each client held.

-- To check constraints
DESC CLIENT;
DESC PARTY;

-- To verify how many clients in the table
SELECT COUNT(CLIENTFNAME) 
AS CLIENTCOUNT
FROM CLIENT;

-- To verify total number of parties in the table
SELECT COUNT(CLIENTFNAME)
AS CLIENTCOUNT
FROM PARTY;

SELECT CLIENT.CLIENTFNAME, CLIENT.CLIENTLNAME, 
CLIENT.CLIENTEMAIL, COUNT(PARTY.PARTYDATETIME)
AS PARTYCOUNT
FROM CLIENT, PARTY
WHERE ((CLIENT.CLIENTFNAME = PARTY.CLIENTFNAME)
AND (CLIENT.CLIENTLNAME = PARTY.CLIENTLNAME))
GROUP BY (CLIENT.CLIENTFNAME, CLIENT.CLIENTLNAME, 
CLIENT.CLIENTEMAIL)
UNION
SELECT CLIENTFNAME, CLIENTLNAME, CLIENTEMAIL, 0
FROM CLIENT
WHERE (CLIENTFNAME, CLIENTLNAME) NOT IN
(SELECT CLIENTFNAME, CLIENTLNAME 
FROM PARTY);

--================END OF Qn 5(b)=================

--=====================Qn 5(c)===================

-- List the first name, last name and the total number 
-- of chef’s engagements in the parties. 
-- Do not ignore chefs who have not engaged in 
-- any party before. 

-- To check constraints
SELECT TABLE_NAME FROM USER_TABLES;
DESC CHEFPARTY;
DESC CHEF;
DESC PARTY;

-- To verify number of chefs in the table
SELECT COUNT(CHEFFNAME) AS TOTALCHEFCOUNT
FROM CHEF;

-- To verify total chefs involved in parties
SELECT COUNT(CPCHEFFNAME) AS CHEFPARTYCOUNT
FROM CHEFPARTY;

SELECT CPCHEFFNAME, CPCHEFLNAME, COUNT(CPCHEFFNAME)
AS PARTYCOUNT
FROM CHEFPARTY
GROUP BY CPCHEFFNAME, CPCHEFLNAME
UNION
SELECT CHEFFNAME, CHEFLNAME, 0
FROM CHEF
WHERE (CHEFFNAME, CHEFLNAME) NOT IN
(SELECT CPCHEFFNAME, CPCHEFLNAME
FROM CHEFPARTY);

--================END OF Qn 5(c)=================

--=====================Qn 5(d)===================

-- For all chefs who have not been engaged in any party 
-- list the chef’s first and last name together 
-- with his/her speciality. 
-- Order your output by speciality.

SELECT CHEFFNAME, CHEFLNAME, SPECIALITY
FROM SPECIALITY
WHERE (CHEFFNAME, CHEFLNAME) NOT IN
(SELECT CPCHEFFNAME, CPCHEFLNAME 
FROM CHEFPARTY)
ORDER BY SPECIALITY;

--================END OF Qn 5(d)=================

--=====================Qn 5(e)===================

-- List the full details of the chefs 
-- who specialise in both ‘Chinese Cuisine’ 
-- and ‘Japanese Cuisine’.

SELECT *
FROM CHEF
WHERE (CHEFFNAME, CHEFLNAME) IN
(SELECT CHEFFNAME, CHEFLNAME
FROM SPECIALITY
WHERE SPECIALITY = 'Chinese Cuisine'
INTERSECT
SELECT CHEFFNAME, CHEFLNAME
FROM SPECIALITY
WHERE SPECIALITY = 'Japanese Cuisine');

--================END OF Qn 5(e)=================

--=====================Qn 5(f)===================

-- List the first name and last name of the chefs 
-- who have been engaged by the clients Charles Carter 
-- or John Young. 

-- Checking constraints
DESC CLIENT;
DESC PARTY;
DESC CHEFPARTY;
DESC CHEF;

SELECT CHEFFNAME, CHEFLNAME
FROM CHEF
WHERE (CHEFFNAME, CHEFLNAME) IN
(SELECT CPCHEFFNAME, CPCHEFLNAME
FROM CHEFPARTY
WHERE (CPPTDATETIME, CPPTLOCATION) IN
(SELECT PARTYDATETIME, LOCATION
FROM PARTY
WHERE (CLIENTFNAME, CLIENTLNAME) IN
(SELECT CLIENTFNAME, CLIENTLNAME
FROM CLIENT
WHERE ((CLIENTFNAME = 'Charles') 
AND (CLIENTLNAME = 'Carter'))
OR ((CLIENTFNAME = 'John')
AND (CLIENTLNAME = 'Young')))));

--================END OF Qn 5(f)=================

--=====================Qn 5(g)===================

-- List the full details of the chefs who have been engaged 
-- in any party for more than 2 times. 
-- Order the output by the chef’s last name 
-- followed by first name.

SELECT *
FROM CHEF
WHERE (CHEFFNAME, CHEFLNAME) IN
(SELECT CPCHEFFNAME, CPCHEFLNAME
FROM CHEFPARTY
GROUP BY (CPCHEFFNAME, CPCHEFLNAME)
HAVING COUNT(*) > 2)
ORDER BY CHEFFNAME, CHEFLNAME;

--================END OF Qn 5(g)=================

--=====================Qn 5(h)===================

-- List the most possessed speciality together with 
-- the total number of chefs who specialize 
-- in the speciality. 

SELECT SPECIALITY, COUNT(CHEFFNAME)
AS CHEFCOUNT
FROM SPECIALITY
GROUP BY SPECIALITY
HAVING COUNT(SPECIALITY) =
(SELECT MAX(COUNT(SPECIALITY))
FROM SPECIALITY
GROUP BY SPECIALITY);

--================END OF Qn 5(h)=================

--=====================Qn 5(i)===================

-- List the full details of the chefs who have been 
-- engaged in a party in May 2018 at Grand Hall, 
-- level 2, MBS.

-- Checking constraints

DESC CHEF;
DESC CHEFPARTY;

SELECT *
FROM CHEF
WHERE (CHEFFNAME, CHEFLNAME) IN
(SELECT CPCHEFFNAME, CPCHEFLNAME
FROM CHEFPARTY
WHERE ((TO_CHAR(CPPTDATETIME, 'YYYY-MM') = '2018-05')
AND (CPPTLOCATION = 'Grand Hall, Level 2, MBS')));

--================END OF Qn 5(i)=================

--=====================Qn 5(j)===================

-- For all most engaged chefs, list the firstname, 
-- lastname, and the total number of time a chef is 
-- engaged. By most engaged, it means chefs who 
-- has been engaged in any party the most number of time.

SELECT CPCHEFFNAME, CPCHEFLNAME, COUNT(*)
AS ENGAGECOUNT
FROM CHEFPARTY
GROUP BY (CPCHEFFNAME, CPCHEFLNAME)
HAVING COUNT(*) IN
(SELECT MAX(COUNT(*))
FROM CHEFPARTY
GROUP BY CPCHEFFNAME, CPCHEFLNAME);

--================END OF Qn 5(j)=================

SPOOL OFF;
