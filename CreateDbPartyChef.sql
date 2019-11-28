set echo on
/* spool C:\Users\Sionggo\SIM\CSCI235\SamleDatabase\PartyAndChef\Script\createdbdpartycheflog.txt

 Sample database for a Party, Chef, and Client information
*/
-- Drop all tables if tables have been created earlier
DROP TABLE CHEF CASCADE CONSTRAINT purge;
DROP TABLE SPECIALITY CASCADE CONSTRAINT purge;
DROP TABLE PARTY CASCADE CONSTRAINT purge;
DROP TABLE CLIENT CASCADE CONSTRAINT purge;
DROP TABLE FEEDBACK CASCADE CONSTRAINT purge;
DROP TABLE CHEFPARTY CASCADE CONSTRAINT purge;
--
-- Create table CHEF
CREATE TABLE CHEF (
ChefFName		VARCHAR2(25)	
	CONSTRAINT	Chef_ChefFName_NotNull NOT NULL,
ChefLName		VARCHAR2(25)	
	CONSTRAINT	Chef_ChefLName_NotNull NOT NULL,
Sex				VARCHAR2(1)
	CONSTRAINT	Chef_ChefSex_NotNull	NOT NULL,
	CONSTRAINT Chef_Sex_Check check (Sex in ('F', 'M')),
DOB				DATE,
CONSTRAINT Chef_Pk PRIMARY KEY (ChefFName, ChefLName)
);

-- Insert sample records to CHEF
INSERT INTO CHEF VALUES ('Daniel', 'Lee', 'M', '10 March 1968');
INSERT INTO CHEF VALUES ('Brian', 'Miller', 'M', '4 September 1975');
INSERT INTO CHEF VALUES ('Eric', 'Harris', 'M', '15 April 1992');
INSERT INTO CHEF VALUES ('Andrew', 'Smith', 'M', '25 July 1980');
INSERT INTO CHEF VALUES ('Jerry', 'Walker', 'M', '23 February 1992');
INSERT INTO CHEF VALUES ('Dennis', 'Jenkins', 'M', '19 October 1989');
INSERT INTO CHEF VALUES ('Victor', 'Myers', 'M', '1 May 1985');
INSERT INTO CHEF VALUES ('Helen', 'Perry', 'F', '30 March 1985');
INSERT INTO CHEF VALUES ('Sarah', 'Foster', 'F', '11 November 1989');
INSERT INTO CHEF VALUES ('Pamela', 'Miyuki', 'F', '12 June 1988');
INSERT INTO CHEF VALUES ('Donald', 'Lewis', 'M', '18 August 1980');
INSERT INTO CHEF VALUES ('Anita', 'Baker', 'F','27 September 1981');


-- Crreate table SPECIALITY
CREATE TABLE SPECIALITY (
ChefFName		VARCHAR2(25)	
	CONSTRAINT	Speciality_ChefFName_NotNull NOT NULL,
ChefLName		VARCHAR2(25)
	CONSTRAINT	Speciality_ChefLName_NotNull NOT NULL,
Speciality		VARCHAR2(50)
	CONSTRAINT	Speciality_Speciality_NotNull NOT NULL,
CONSTRAINT	Speciality_Pk PRIMARY KEY (ChefFName, ChefLName, Speciality),
CONSTRAINT	Speciality_FK FOREIGN KEY (ChefFName, ChefLName) REFERENCES CHEF (ChefFName, ChefLName)
);

-- Insert sample records to SPECIALITY
INSERT INTO SPECIALITY VALUES ('Daniel', 'Lee', 'Chinese Cuisine');
INSERT INTO SPECIALITY VALUES ('Daniel', 'Lee', 'Japanese Cuisine');
INSERT INTO SPECIALITY VALUES ('Eric', 'Harris', 'Italian Cuisine');
INSERT INTO SPECIALITY VALUES ('Andrew', 'Smith', 'Italian Cuisine');
INSERT INTO SPECIALITY VALUES ('Andrew', 'Smith', 'French Cuisine');
INSERT INTO SPECIALITY VALUES ('Jerry', 'Walker', 'Chinese Cuisine');
INSERT INTO SPECIALITY VALUES ('Jerry', 'Walker', 'Thai Cuisine');
INSERT INTO SPECIALITY VALUES ('Helen', 'Perry', 'Australian Cuisine');
INSERT INTO SPECIALITY VALUES ('Victor', 'Myers', 'German Cuisine');
INSERT INTO SPECIALITY VALUES ('Sarah', 'Foster', 'Japanese Cuisine');
INSERT INTO SPECIALITY VALUES ('Sarah', 'Foster', 'American Cuisine');
INSERT INTO SPECIALITY VALUES ('Pamela', 'Miyuki', 'Japanese Cuisine');
INSERT INTO SPECIALITY VALUES ('Brian', 'Miller', 'Mexican Cuisine');
INSERT INTO SPECIALITY VALUES ('Dennis', 'Jenkins', 'Indonesian Cuisine');
INSERT INTO SPECIALITY VALUES ('Dennis', 'Jenkins', 'Indian Cuisine');
INSERT INTO SPECIALITY VALUES ('Helen', 'Perry', 'Malaysian Cuisine');
INSERT INTO SPECIALITY VALUES ('Donald', 'Lewis', 'Dutch Cuisine');
INSERT INTO SPECIALITY VALUES ('Anita', 'Baker', 'New Zealand Cuisine');

-- Create table CLIENT
CREATE TABLE CLIENT (
ClientFName		VARCHAR2(25)
	CONSTRAINT	Client_ClientFName_NotNull NOT NULL,
ClientLName		VARCHAR2(25)
	CONSTRAINT Client_ClientLName_NotNull NOT NULL,
Phone				VARCHAR2(25),
ClientEmail		VARCHAR2(75)
	CONSTRAINT Client_ClientEmail_NotNull NOT NULL,
	CONSTRAINT Client_ClientEmail_Unique UNIQUE (ClientEmail),
Sex				VARCHAR2(1)
	CONSTRAINT Client_Sex_NotNull NOT NULL,
	CONSTRAINT Client_Sex_Check check (Sex in ('M','F')),
CONSTRAINT	Client_PK PRIMARY KEY (ClientFName, ClientLName)
);

-- Insert sample records to CLIENT
INSERT INTO CLIENT VALUES ('Ronald', 'Lewis', '92379431', 'rlewis@gmail.com', 'M');
INSERT INTO CLIENT VALUES ('Paul', 'Anderson', '82316329', 'panderson@yahoo.com', 'M');
INSERT INTO CLIENT VALUES ('Jennifer', 'Baker', '81230843', 'jbaker@yahoo.com', 'F');
INSERT INTO CLIENT VALUES ('Carol', 'Martin', '93842319', 'cmartin@gmail.com', 'F');
INSERT INTO CLIENT VALUES ('Ruth', 'Jones', '91284502', 'rjones@gmail.com', 'F');
INSERT INTO CLIENT VALUES ('John', 'Young', '81284239', 'jyoung@gmail.com', 'M');
INSERT INTO CLIENT VALUES ('Thomas', 'Taylor', '91874259', 'ttaylor@yahoo.com', 'M');
INSERT INTO CLIENT VALUES ('Brian', 'Parker', '92763914', 'bparker@yahoo.com', 'M');
INSERT INTO CLIENT VALUES ('Jeff', 'Collins', '88239468', 'jcollins@gmail.com', 'M');
INSERT INTO CLIENT VALUES ('Kimberly', 'Brown', '93285430', 'kbrown@gmail.com', 'F');
INSERT INTO CLIENT VALUES ('Susan', 'Lee', '84821429', 'slee@gmail.com', 'F');
INSERT INTO CLIENT VALUES ('Kevin', 'Gonzalez', '91038255', 'kgonzalez@gmail.com', 'M');
INSERT INTO CLIENT VALUES ('Michelle', 'Moore', '82378263', 'mmoore@gmail.com', 'F');
INSERT INTO CLIENT VALUES ('Deborah', 'Nelson', '93572183', 'dnelson@yahoo.com', 'F');
INSERT INTO CLIENT VALUES ('Betty', 'Lopez', '94218425', 'blopez@gmail.com', 'F');
INSERT INTO CLIENT VALUES ('Anthony', 'White', '81936738', 'awhite@gmail.com', 'M');
INSERT INTO CLIENT VALUES ('Kimberly', 'Scott', '92743898', 'kscott@gmail.com', 'F');
INSERT INTO CLIENT VALUES ('William', 'Young', '82479263', 'wyoung@gmail.com', 'M');
INSERT INTO CLIENT VALUES ('Charles', 'Carter', '93881688', 'ccarter@gmail.com', 'M');
INSERT INTO CLIENT VALUES ('Karen', 'Hill', '81498278', 'khill@gmail.com', 'F');


CREATE TABLE PARTY (
PartyDateTime	TIMESTAMP
	CONSTRAINT	Party_PartyDateTime_NotNull NOT NULL,
Location		VARCHAR2(75)
	CONSTRAINT Party_Location_NotNull NOT NULL,
ClientFName	VARCHAR2(25)
	CONSTRAINT Party_ClientFName_NotNull NOT NULL,
ClientLName	VARCHAR2(25)
	CONSTRAINT Party_ClientLName_NotNull NOT NULL,
CONSTRAINT	Party_Pk PRIMARY KEY (PartyDateTime, Location),
CONSTRAINT Party_Fk FOREIGN KEY (ClientFName, ClientLName) references CLIENT (ClientFName, ClientLName)
);

INSERT INTO PARTY VALUES (systimestamp+3+(1/24/60)*50, '14 West Coast Park Road', 'Kevin', 'Gonzalez');
INSERT INTO PARTY VALUES (systimestamp+25+(1/24/60)*25, '38 Namly Grove', 'Betty', 'Lopez');
INSERT INTO PARTY VALUES (systimestamp+7+(1/24/60)*10, 'Orchid Room, Level 2, Raffles Hotel', 'Michelle', 'Moore');
INSERT INTO PARTY VALUES (systimestamp+14+(1/24/60)*20, 'Grand Hall, Level 2, MBS', 'Kevin', 'Gonzalez');
INSERT INTO PARTY VALUES (systimestamp+3+(1/24/60)*50, 'Grand Hall, Level 2, MBS', 'Anthony', 'White');
INSERT INTO PARTY VALUES (systimestamp+21+(1/24/60)*250, 'Grand Hall, Level 2, Mandarin Orchard Hotel', 'Kevin', 'Gonzalez');
INSERT INTO PARTY VALUES (systimestamp-2+(1/24/60)*10, '38 Namly Grove', 'Betty', 'Lopez');
INSERT INTO PARTY VALUES (systimestamp-2+(1/24/60)*10, 'Grand Ballroom, Level 3, Continental Hotel', 'Ruth', 'Jones');
INSERT INTO PARTY VALUES (systimestamp+3+(1/24/60)*50, '27 Sentosa Cove', 'Brian', 'Parker');
INSERT INTO PARTY VALUES (systimestamp+25+(1/24/60)*25, '138 Clementi Road', 'Carol', 'Martin');
INSERT INTO PARTY VALUES (systimestamp+6+(1/24/60)*10, 'Orchid Room, Level 2, Raffles Hotel', 'Charles', 'Carter');
INSERT INTO PARTY VALUES (systimestamp+12+(1/24/60)*20, 'Grand Hall, Level 2, MBS', 'Jeff', 'Collins');
INSERT INTO PARTY VALUES (systimestamp+3+(1/24/60)*50, 'Grand Ballroom, Level 3, Continental Hotel', 'Paul', 'Anderson');
INSERT INTO PARTY VALUES (systimestamp+24+(1/24/60)*50, 'Grand Hall, Level 2, Mandarin Orchard Hotel', 'Susan', 'Lee');
INSERT INTO PARTY VALUES (systimestamp-2+(1/24/60)*120, '138 Holland Road', 'Karen', 'Hill');
INSERT INTO PARTY VALUES (systimestamp-1+(1/24/60)*10, 'Grand Ballroom, Level 3, Continental Hotel', 'John', 'Young');
INSERT INTO PARTY VALUES (systimestamp+12+(1/24/60)*100, 'Rose Garden, Singapore Botanical Garden', 'Kimberly', 'Brown');
INSERT INTO PARTY VALUES (systimestamp+21+(1/24/60)*180, 'Grand Ballroom, Level 3, Continental Hotel', 'Ronald', 'Lewis');
INSERT INTO PARTY VALUES (systimestamp+27+(1/24/60)*120, '10 Bukit Timah Road', 'Ruth', 'Jones');
INSERT INTO PARTY VALUES (systimestamp+7+(1/24/60)*48, '28 Upper Bukit Timah Road', 'Susan', 'Lee');
INSERT INTO PARTY VALUES (systimestamp+17+(1/24/60)*21, '110 Hamilton Park', 'Thomas', 'Taylor');
INSERT INTO PARTY VALUES (systimestamp+5+(1/24/60)*100, 'Grand Hall, Level 2, MBS', 'William', 'Young');


-- Create table Feedback
CREATE TABLE FEEDBACK (
FbDate		DATE
	CONSTRAINT	Feedback_FbDate_NotNull NOT NULL,
FbComment		VARCHAR2(1024)
	CONSTRAINT	Feedback_FbComment_NotNull NOT NULL,
FbPtDateTime	TIMESTAMP
	CONSTRAINT	Feedback_FbPtDateTime_NotNull NOT NULL,
FbPtLocation	VARCHAR2(75)
	CONSTRAINT Feedback_FbPtLocation_NotNull NOT NULL,
FbClientFName	VARCHAR2(25)
	CONSTRAINT Feedback_FbClientFName_NotNull NOT NULL,
FbClientLName	VARCHAR2(25)
	CONSTRAINT Feedback_FbClientLName_NotNull NOT NULL,
CONSTRAINT	Feedback_PK PRIMARY KEY (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName),
CONSTRAINT	Feedback_FK1 FOREIGN KEY (FbPtDateTime, FbPtLocation) REFERENCES PARTY (PartyDateTime, Location),
CONSTRAINT	Feedback_FK2 FOREIGN KEY (FbClientFName, FbClientLName) REFERENCES CLIENT (ClientFName, ClientLName)
);

-- Insert sample records to Feedback
insert into feedback (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName, FbDate, FbComment) SELECT PartyDateTime, Location, ClientFName, ClientLName, PartyDateTime+2, 'Excellent Food!'
from party
where ClientFName = 'Anthony';

insert into feedback (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName, FbDate, FbComment) SELECT PartyDateTime, Location, ClientFName, ClientLName, PartyDateTime+2, 'Excellent Food and wonderful environment!'
from party
where ClientFName = 'Kevin';

insert into feedback (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName, FbDate, FbComment) SELECT PartyDateTime, Location, ClientFName, ClientLName, PartyDateTime+1, 'Food is great, but Chef is not friently!'
from party
where ClientFName = 'Michelle';

insert into feedback (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName, FbDate, FbComment) SELECT PartyDateTime, Location, ClientFName, ClientLName, PartyDateTime+3, 'Satisfactory, will get the same Chef again!'
from party
where ClientFName = 'Betty';

insert into feedback (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName, FbDate, FbComment) SELECT PartyDateTime, Location, ClientFName, ClientLName, PartyDateTime+2, 'Excellent Food!'
from party
where ClientFName = 'Ruth';

insert into feedback (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName, FbDate, FbComment) SELECT PartyDateTime, Location, ClientFName, ClientLName, PartyDateTime+2, 'Lousy food! Will not use the organizer again'
from party
where ClientFName = 'Brian';

insert into feedback (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName, FbDate, FbComment) SELECT PartyDateTime, Location, ClientFName, ClientLName, PartyDateTime, 'Excellent Food! But too expensive'
from party
where ClientFName = 'Carol';

insert into feedback (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName, FbDate, FbComment) SELECT PartyDateTime, Location, ClientFName, ClientLName, PartyDateTime+3, 'No complain. Foods were wonderful. Definitely will get the same Chefs again!'
from party
where ClientFName = 'Charles';

insert into feedback (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName, FbDate, FbComment) SELECT PartyDateTime, Location, ClientFName, ClientLName, PartyDateTime+1, 'Excellent Food!'
from party
where ClientFName = 'Jeff';

insert into feedback (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName, FbDate, FbComment) SELECT PartyDateTime, Location, ClientFName, ClientLName, PartyDateTime+2, 'Wonderful!'
from party
where ClientFName = 'Paul';

insert into feedback (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName, FbDate, FbComment) SELECT PartyDateTime, Location, ClientFName, ClientLName, PartyDateTime+1, 'Great food! But quantity is rather small'
from party
where ClientFName = 'Susan';

insert into feedback (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName, FbDate, FbComment) SELECT PartyDateTime, Location, ClientFName, ClientLName, PartyDateTime+2, 'No complain. Very satisfied with the services as well as the food!'
from party
where ClientFName = 'Karen';

insert into feedback (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName, FbDate, FbComment) SELECT PartyDateTime, Location, ClientFName, ClientLName, PartyDateTime+2, 'Excellent Food!'
from party
where ClientFName = 'John';

insert into feedback (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName, FbDate, FbComment) SELECT PartyDateTime, Location, ClientFName, ClientLName, PartyDateTime+3, 'Excellent Food! Service is good as well.'
from party
where ClientFName = 'Kimberly';

insert into feedback (FbPtDateTime, FbPtLocation, FbClientFName, FbClientLName, FbDate, FbComment) SELECT PartyDateTime, Location, ClientFName, ClientLName, PartyDateTime+1, 'Excellent Food!'
from party
where ClientFName = 'William';

-- Create table CHEFPARTY
CREATE TABLE CHEFPARTY (
CpPtDateTime	TIMESTAMP
	CONSTRAINT	Feedback_CpPtDateTime_NotNull NOT NULL,
CpPtLocation	VARCHAR2(75)
	CONSTRAINT Feedback_CpPtLocation_NotNull NOT NULL,
CpChefFName	VARCHAR2(25)
	CONSTRAINT Feedback_CpChefFName_NotNull NOT NULL,
CpChefLName	VARCHAR2(25)
	CONSTRAINT Feedback_CpChefLName_NotNull NOT NULL,
CONSTRAINT	ChefParty_PK PRIMARY KEY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName),
CONSTRAINT	ChefParty_FK1 FOREIGN KEY (CpPtDateTime, CpPtLocation) REFERENCES PARTY (PartyDateTime, Location),
CONSTRAINT	ChefParty_FK2 FOREIGN KEY (CpChefFName, CpChefLName) REFERENCES CHEF (ChefFName, ChefLName)
);

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'William'
and ChefFName = 'Daniel';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Thomas'
and ChefFName = 'Daniel';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Susan'
and ChefFName = 'Eric';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Ruth'
and ChefFName = 'Brian'
and location = 'Grand Ballroom, Level 3, Continental Hotel';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Ronald'
and ChefFName = 'Dennis';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Kimberly'
and ChefFName = 'Helen';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Kimberly'
and ChefFName = 'Victor';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'John'
and ChefFName = 'Jerry';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Karen'
and ChefFName = 'Daniel';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Susan'
and ChefFName = 'Pamela';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Paul'
and ChefFName = 'Pamela';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Jeff'
and ChefFName = 'Helen';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Jeff'
and ChefFName = 'Dennis';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Jeff'
and ChefFName = 'Victor';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Charles'
and ChefFName = 'Brian';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Charles'
and ChefFName = 'Helen';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Carol'
and ChefFName = 'Victor';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Brian'
and ChefFName = 'Daniel';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Betty'
and ChefFName = 'Pamela';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Kevin'
and ChefFName = 'Dennis'
and location = 'Grand Hall, Level 2, Mandarin Orchard Hotel';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Kevin'
and ChefFName = 'Daniel'
and location = 'Grand Hall, Level 2, Mandarin Orchard Hotel';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Kevin'
and ChefFName = 'Daniel'
and location = 'Grand Hall, Level 2, MBS';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Kevin'
and ChefFName = 'Helen'
and location = 'Grand Hall, Level 2, MBS';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Kevin'
and ChefFName = 'Daniel'
and location = '14 West Coast Park Road';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Kevin'
and ChefFName = 'Sarah'
and location = 'Grand Hall, Level 2, MBS';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Anthony'
and ChefFName = 'Pamela';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Anthony'
and ChefFName = 'Sarah';

insert into CHEFPARTY (CpPtDateTime, CpPtLocation, CpChefFName, CpChefLName) 
SELECT PartyDateTime, Location, ChefFName, ChefLName
from party, chef
where ClientFName = 'Michelle'
and ChefFName = 'Jerry';

-- spool off


