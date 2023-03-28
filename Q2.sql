USE MASTER;
GO
ALTER DATABASE AMG SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
DROP DATABASE if EXISTS AMG;
CREATE DATABASE AMG;
GO


USE AMG;

DROP TABLE IF EXISTS HANGAR;
CREATE TABLE HANGAR (
	NUMBER			INT NOT NULL,
	CAPACITY		INT NOT NULL,
	LOCATION		VARCHAR(30) NOT NULL,
	PRIMARY	KEY(NUMBER),
);

DROP TABLE IF EXISTS PLANE_TYPE;
CREATE TABLE PLANE_TYPE (
	MODEL			VARCHAR(30) NOT NULL, 
	CAPACITY		INT NOT NULL,
	WEIGHT			INT NOT NULL,
	PRIMARY	KEY(MODEL),
);

DROP TABLE IF EXISTS AIRPLANE;
CREATE TABLE AIRPLANE (
	REG_NO			INT NOT NULL,
	MODEL			VARCHAR(30) NOT NULL,
	HG_NO			INT NOT NULL,
	NEED_MNT		VARCHAR(50),
	PRIMARY KEY (REG_NO),
	FOREIGN KEY (MODEL) REFERENCES PLANE_TYPE (MODEL) ON DELETE CASCADE,
	FOREIGN KEY (HG_NO) REFERENCES HANGAR (NUMBER) ON DELETE CASCADE,
);

DROP TABLE IF EXISTS OWNER;
CREATE TABLE OWNER (
	OWNERID			INT NOT NULL,
	PRIMARY	KEY (OWNERID)
);

DROP TABLE IF EXISTS CORPORATION;
CREATE TABLE CORPORATION (
	NAME			VARCHAR(50) NOT NULL,
	PHONE			CHAR(13) NOT NULL, /* +923111100000 */
	ADDRESS			VARCHAR(50) NOT NULL,
	OWNERID			INT NOT NULL,
	PRIMARY	KEY (NAME),
	FOREIGN KEY (OWNERID) REFERENCES OWNER (OWNERID) ON DELETE CASCADE,
);

DROP TABLE IF EXISTS PERSON;
CREATE TABLE PERSON (
	SSN				INT NOT NULL,
	NAME			VARCHAR(10) NOT NULL,
	PHONE			CHAR(13) NOT NULL, /* +923111100000 */
	ADDRESS			VARCHAR(50) NOT NULL,
	PRIMARY KEY (SSN)
);

DROP TABLE IF EXISTS EMPLOYEE;
CREATE TABLE EMPLOYEE (
	SSN				INT NOT NULL,
	SALARY			INT NOT NULL,
	SHIFT			VARCHAR(20) NOT NULL, /* DAY 7AM - 6PM, NIGHT 7PM - 5AM, ETC */
	PRIMARY KEY (SSN),
	FOREIGN KEY (SSN) REFERENCES PERSON(SSN) ON DELETE CASCADE,
);

DROP TABLE IF EXISTS EMP_QUALIFICATION;
CREATE TABLE EMP_QUALIFICATION (
	SSN				INT NOT NULL,
	QUAL			VARCHAR(30) NOT NULL,
	PRIMARY KEY (SSN, QUAL),
	FOREIGN KEY (SSN) REFERENCES PERSON(SSN) ON DELETE CASCADE,
);

DROP TABLE IF EXISTS PILOT;
CREATE TABLE PILOT (
	SSN				INT NOT NULL,
	LIC_NUM			INT NOT NULL,
	RESTR			VARCHAR(50),
	PRIMARY KEY (SSN),
	FOREIGN KEY (SSN) REFERENCES PERSON(SSN) ON DELETE CASCADE,
);

DROP TABLE IF EXISTS WORKS_ON;
CREATE TABLE WORKS_ON (
	ID				INT IDENTITY(1,1),
	SSN				INT NOT NULL,
	MODEL			VARCHAR(30) NOT NULL,
	PRIMARY KEY (ID, MODEL),
	FOREIGN KEY (SSN) REFERENCES PERSON(SSN) ON DELETE CASCADE,
	FOREIGN KEY (MODEL) REFERENCES PLANE_TYPE(MODEL) ON DELETE CASCADE,
);

DROP TABLE IF EXISTS FLIES;
CREATE TABLE FLIES (
	SSN				INT NOT NULL,
	MODEL			VARCHAR(30) NOT NULL,
	PRIMARY KEY(SSN, MODEL),
	FOREIGN KEY (SSN) REFERENCES PERSON(SSN) ON DELETE CASCADE,
	FOREIGN KEY (MODEL) REFERENCES PLANE_TYPE(MODEL) ON DELETE CASCADE,
);

DROP TABLE IF EXISTS OWNS;
CREATE TABLE OWNS (
	OWNER_ID		INT NOT NULL,
	REG_NO			INT NOT NULL,
	P_DATE			DATE NOT NULL,
	PRIMARY KEY(OWNER_ID, REG_NO),
	FOREIGN KEY (OWNER_ID) REFERENCES OWNER (OWNERID) ON DELETE CASCADE,
	FOREIGN KEY (REG_NO) REFERENCES AIRPLANE (REG_NO) ON DELETE CASCADE,
);

DROP TABLE IF EXISTS SERVICE;
CREATE TABLE SERVICE (
    S_DATE			DATE NOT NULL,
    WORK_CODE		VARCHAR(30) NOT NULL,
    HOURS			INT NOT NULL,
	IS_COMPLETE		BIT NOT NULL,
    PRIMARY KEY(S_DATE, WORK_CODE),
);

DROP TABLE IF EXISTS PLANE_SERVICE;
CREATE TABLE PLANE_SERVICE (
    SER_DATE		DATE NOT NULL,
    SER_CODE		VARCHAR(30) NOT NULL,
    PREG_NO			INT NOT NULL,
	PRIMARY KEY(SER_DATE, SER_CODE, PREG_NO),
    FOREIGN KEY (PREG_NO) REFERENCES AIRPLANE (REG_NO) ON DELETE CASCADE,
	FOREIGN KEY (SER_DATE, SER_CODE) REFERENCES SERVICE (S_DATE, WORK_CODE) ON DELETE CASCADE,
);

DROP TABLE IF EXISTS MAINTAIN;
CREATE TABLE MAINTAIN (
	E_SSN			INT NOT NULL,
	SER_DATE		DATE NOT NULL,
	SER_CODE		VARCHAR(30) NOT NULL,
	PRIMARY KEY(SER_DATE, SER_CODE, E_SSN),
	FOREIGN KEY(E_SSN) REFERENCES EMPLOYEE (SSN) ON DELETE CASCADE,
	FOREIGN KEY(SER_DATE, SER_CODE) REFERENCES SERVICE (S_DATE, WORK_CODE) ON DELETE CASCADE,
);


/* Insert PERSON */
INSERT INTO PERSON (SSN, NAME, PHONE, ADDRESS)
VALUES
	(1111, 'Ali', '+923001111111', '123 Main St, Karachi'),
	(1112, 'Fatima', '+923002222222', '456 1st Ave, Lahore'),
	(1113, 'Hassan', '+923003333333', '789 2nd St, Islamabad'),
	(1114, 'Ayesha', '+923004444444', '12 Park Rd, Karachi'),
	(1115, 'Imran', '+923005555555', '34 Liberty Market, Lahore'),
	(1116, 'Sana', '+923006666666', '56 Jinnah Rd, Islamabad'),
	(1117, 'Faisal', '+923007777777', '78 Defence Housing Society, Karachi'),
	(1118, 'Nida', '+923008888888', '90 DHA Phase 2, Lahore'),
	(1119, 'Ahmed', '+923009999999', '12 Blue Area, Islamabad'),
	(1120, 'Sadia', '+923001010101', '34 F-10 Markaz, Islamabad'),
	(1121, 'Majeed', '+923001022222', '06 I-10 Markaz, Islamabad'),
	(1122, 'Mubashir', '+923001000000', '66 Iqbal Town, Lahore'),
	(1123, 'Zainab', '+923001234567', '45 ABC Street, Lahore'),
	(1124, 'Ahmed', '+923002345678', '67 XYZ Road, Karachi'),
	(1125, 'Sara', '+923003456789', '89 PQR Avenue, Islamabad'),
	(1126, 'Usman', '+923004567890', '12 GHI Colony, Lahore'),
	(1127, 'Faryal', '+923005678901', '34 JKL Street, Karachi'),
	(1128, 'Hamza', '+923006789012', '56 MNO Avenue, Islamabad'),
	(1129, 'Saima', '+923007890123', '78 EFG Colony, Lahore'),
	(1130, 'Nabeel', '+923008901234', '90 RST Road, Karachi'),
	(1131, 'Ali Khan', '+923111100000', '123 Main St, Karachi'),
	(1132, 'Fatima', '+923222200000', '456 1st Ave, Lahore'),
	(1133, 'Ahmed Yaar', '+923333300000', '789 2nd St, Islamabad'),
	(1134, 'Sara Kamal', '+923444400000', '1010 3rd Ave, Rawalpindi'),
	(1135, 'Hassan Ali', '+923555500000', '321 High St, Peshawar');

/* Insert EMPLOYEE */
INSERT INTO EMPLOYEE (SSN, SALARY, SHIFT) VALUES
(1115, 50000, 'DAY 10AM TO 6PM'),
(1117, 60000, 'NIGHT 10PM TO 6AM'),
(1119, 55000, 'DAY 10AM TO 6PM'),
(1121, 65000, 'NIGHT 10PM TO 6AM'),
(1123, 70000, 'DAY 10AM TO 6PM'),
(1125, 75000, 'NIGHT 10PM TO 6AM'),
(1127, 55000, 'DAY 10AM TO 6PM'),
(1129, 65000, 'NIGHT 10PM TO 6AM'),
(1111, 70000, 'DAY 10AM TO 6PM'),
(1114, 85000, 'NIGHT 10PM TO 6AM');

/* Insert PILOT */
INSERT INTO PILOT (SSN, LIC_NUM, RESTR) VALUES
(1116, 5550001, NULL),
(1118, 5550002, NULL),
(1120, 5550003, NULL),
(1124, 5550004, NULL),
(1126, 5550005, NULL),
(1128, 5550006, NULL),
(1130, 5550007, NULL),
(1112, 5550008, NULL),
(1113, 5550009, NULL),
(1122, 5550010, NULL);

INSERT INTO OWNER (OWNERID) VALUES
(1001),
(1002),
(1003),
(1004),
(1005),
(1006),
(1007),
(1008),
(1009),
(1010),
(1011),
(1012),
(1013),
(1014),
(1015),
(1016),
(1017),
(1018),
(1019),
(1020),
(1131),
(1132),
(1133),
(1134),
(1135);


/* Insert Hangers */
INSERT INTO HANGAR (NUMBER, CAPACITY, LOCATION)
VALUES
    (1, 10, 'Lahore'),
    (2, 15, 'Karachi'),
    (3, 20, 'Islamabad'),
    (4, 12, 'Peshawar'),
    (5, 8, 'Quetta'),
    (6, 18, 'Multan'),
    (7, 11, 'Faisalabad'),
    (8, 14, 'Rawalpindi'),
    (9, 17, 'Hyderabad'),
    (10, 9, 'Sialkot'),
	(11, 13, 'Gujranwala'),
    (12, 16, 'Sukkur'),
    (13, 11, 'Abbottabad'),
    (14, 20, 'Muzaffarabad'),
    (15, 10, 'Bahawalpur'),
    (16, 7, 'Gilgit'),
    (17, 19, 'Sargodha'),
    (18, 14, 'Jhang'),
    (19, 9, 'Attock'),
    (20, 12, 'Larkana');

/* Insert Plane Types */
INSERT INTO PLANE_TYPE (MODEL, CAPACITY, WEIGHT)
VALUES
    ('Boeing 737', 200, 50000),
	('Airbus A320', 150, 40000),
	('Embraer E190', 100, 30000),
	('Bombardier CRJ200', 80, 20000),
	('ATR 72', 70, 15000),
	('Cessna 172', 4, 500),
	('Piper PA-28', 4, 600),
	('Diamond DA20', 2, 400),
	('Beechcraft Baron', 6, 1500),
	('Cirrus SR22', 4, 1000),
	('Airbus A350', 300, 55000),
	('Boeing 747', 400, 60000),
	('Bombardier Global 7500', 19, 50000),
	('Cessna Citation X', 10, 16000),
	('Dassault Falcon 7X', 14, 19000),
	('Gulfstream G650', 18, 35000),
	('Pilatus PC-12', 9, 4500),
	('Beechcraft King Air', 9, 4000),
	('Embraer Phenom 300', 8, 8000),
	('Piaggio P.180 Avanti', 9, 7000);

/* Insert Airplanes */
INSERT INTO AIRPLANE (REG_NO, MODEL, HG_NO, NEED_MNT)
VALUES
	(1, 'Boeing 737', 1, NULL),
	(2, 'Airbus A320', 2, 'Engine Overhaul'),
	(3, 'Embraer E190', 3, NULL),
	(4, 'Bombardier CRJ200', 4, NULL),
	(5, 'ATR 72', 5, NULL),
	(6, 'Cessna 172', 6, NULL),
	(7, 'Piper PA-28', 20, NULL),
	(8, 'Diamond DA20', 8, NULL),
	(9, 'Beechcraft Baron', 9, NULL),
	(10, 'Cirrus SR22', 10, NULL),
	(11, 'Boeing 737', 11, NULL),
	(12, 'Airbus A320', 12, NULL),
	(13, 'Embraer E190', 13, NULL),
	(14, 'Bombardier CRJ200', 14, NULL),
	(15, 'ATR 72', 15, NULL),
	(16, 'Cessna 172', 16, NULL),
	(17, 'Piper PA-28', 17, NULL),
	(18, 'Piper PA-28', 18, NULL),
	(19, 'Beechcraft Baron', 19, NULL),
	(20, 'Cirrus SR22', 20, NULL),
	(21, 'Boeing 737', 1, NULL),
	(22, 'Airbus A320', 2, NULL),
	(23, 'Embraer E190', 3, NULL),
	(24, 'Bombardier CRJ200', 4, 'Avionics Upgrade'),
	(25, 'ATR 72', 5, NULL),
	(26, 'Cessna 172', 6, NULL),
	(27, 'Piper PA-28', 7, NULL),
	(28, 'Diamond DA20', 8, NULL),
	(29, 'Beechcraft Baron', 9, NULL),
	(30, 'Cirrus SR22', 10, 'Fuel System Check'),
	(31, 'Boeing 737', 11, NULL),
	(32, 'Airbus A320', 12, NULL),
	(33, 'Embraer E190', 13, NULL),
	(34, 'Bombardier CRJ200', 14, NULL),
	(35, 'ATR 72', 20, NULL),
	(36, 'Cessna 172', 8, NULL),
	(37, 'Piper PA-28', 10, NULL),
	(38, 'Diamond DA20', 6, NULL),
	(39, 'Beechcraft Baron', 13, NULL),
	(40, 'Cirrus SR22', 1, NULL);

/* Insert CORPORATION */
INSERT INTO CORPORATION (NAME, PHONE, ADDRESS, OWNERID)
VALUES 
	('PIA Corporation', '+923111100001', 'Jinnah Terminal, Karachi', 1001),
	('SereneAir Corporation', '+923111100002', 'Lahore Airport, Lahore', 1002),
	('Airblue Corporation', '+923111100003', 'Benazir Airport, Islamabad', 1003),
	('Shaheen Air Corporation', '+923111100004', 'Peshawar Airport, Peshawar', 1004),
	('AirSial Corporation', '+923111100005', 'Quetta Airport, Quetta', 1005),
	('ASKARI Aviation Corporation', '+923111100006', 'Faisalabad Airport, Faisalabad', 1006),
	('Rayyan Air Corporation', '+923111100007', 'Muzaffarabad Airport, Muzaffarabad', 1007),
	('Vision Air International Corporation', '+923111100008', 'Multan Airport, Multan', 1008),
	('SkyWings Airline Corporation', '+923111100009', 'Sialkot Airport, Sialkot', 1009),
	('White Air Corporation', '+923111100010', 'Skardu Airport, Skardu', 1010),
	('Aero Asia International Corporation', '+923111100011', 'Chitral Airport, Chitral', 1011),
	('K2 Airways Corporation', '+923111100012', 'Gilgit Airport, Gilgit', 1012),
	('Taj Air Corporation', '+923111100013', 'Hyderabad Airport, Hyderabad', 1013),
	('Air Indus Corporation', '+923111100014', 'Sukkur Airport, Sukkur', 1014),
	('Air Ways Corporation', '+923111100015', 'Gwadar Airport, Gwadar', 1015),
	('Himalaya Airlines Corporation', '+923111100016', 'Naran Airport, Naran', 1016),
	('AirGreen Corporation', '+923111100017', 'Bahawalpur Airport, Bahawalpur', 1017),
	('Air Buraq Corporation', '+923111100018', 'Zhob Airport, Zhob', 1018),
	('Moflong Aviation Corporation', '+923111100019', 'Bannu Airport, Bannu', 1019),
	('Fly High Corporation', '+923111100020', 'Turbat Airport, Turbat', 1020);

/* Insert WORKS_ON */
INSERT INTO WORKS_ON(SSN, MODEL) VALUES
(1115, 'Boeing 737'),
(1117, 'Embraer E190'),
(1117, 'Cessna Citation X'),
(1119, 'Airbus A320'),
(1121, 'Bombardier CRJ200'),
(1123, 'ATR 72'),
(1125, 'Cessna 172'),
(1127, 'Piper PA-28'),
(1129, 'Diamond DA20'),
(1111, 'Beechcraft Baron'),
(1114, 'Cirrus SR22'),
(1115, 'Airbus A350'),
(1117, 'Boeing 747'),
(1119, 'Bombardier Global 7500'),
(1121, 'Cessna Citation X'),
(1123, 'Dassault Falcon 7X'),
(1125, 'Gulfstream G650'),
(1127, 'Pilatus PC-12'),
(1129, 'Beechcraft King Air'),
(1111, 'Embraer Phenom 300'),
(1114, 'Piaggio P.180 Avanti');

/* Insert FLIES */
INSERT INTO FLIES(SSN, MODEL) VALUES
(1116, 'Boeing 737'),
(1118, 'Embraer E190'),
(1120, 'Airbus A320'),
(1124, 'Bombardier CRJ200'),
(1126, 'ATR 72'),
(1128, 'Cessna 172'),
(1130, 'Piper PA-28'),
(1112, 'Diamond DA20'),
(1113, 'Beechcraft Baron'),
(1122, 'Cirrus SR22'),
(1116, 'Airbus A350'),
(1118, 'Boeing 747'),
(1120, 'Bombardier Global 7500'),
(1124, 'Cessna Citation X'),
(1126, 'Dassault Falcon 7X'),
(1128, 'Gulfstream G650'),
(1130, 'Pilatus PC-12'),
(1112, 'Beechcraft King Air'),
(1113, 'Embraer Phenom 300'),
(1122, 'Piaggio P.180 Avanti');

/* Insert OWNS */
INSERT INTO OWNS (OWNER_ID, REG_NO, P_DATE) VALUES
(1001, 1, '2018-03-15'),
(1002, 3, '2017-04-25'),
(1003, 5, '2020-08-01'),
(1004, 7, '2019-12-12'),
(1005, 9, '2016-05-20'),
(1006, 11, '2021-01-05'),
(1007, 13, '2015-09-30'),
(1008, 15, '2019-02-22'),
(1009, 17, '2023-02-15'),
(1010, 19, '2018-08-11'),
(1011, 21, '2017-11-05'),
(1012, 23, '2021-02-28'),
(1013, 25, '2020-03-19'),
(1014, 27, '2016-07-01'),
(1015, 29, '2022-01-18'),
(1016, 31, '2014-09-05'),
(1017, 33, '2018-11-30'),
(1018, 35, '2019-04-22'),
(1019, 37, '2022-02-14'),
(1020, 39, '2017-06-03'),
(1001, 2, '2020-01-05'),
(1002, 4, '2021-02-04'),
(1003, 6, '2002-03-03'),
(1004, 8, '2013-04-02'),
(1005, 10, '2008-05-01'),
(1006, 12, '2019-06-11'),
(1007, 14, '2014-07-10'),
(1008, 16, '2016-08-09'),
(1009, 18, '2023-03-29'),
(1010, 20, '2010-10-07'),
(1011, 22, '2011-11-06'),
(1012, 24, '2012-12-05'),
(1013, 26, '2013-01-04'),
(1014, 28, '2014-02-03'),
(1015, 30, '2015-03-02'),
(1131, 32, '2016-04-01'),
(1132, 34, '2017-05-17'),
(1133, 36, '2018-06-18'),
(1134, 38, '2019-07-19'),
(1135, 40, '2020-08-20');


INSERT INTO EMP_QUALIFICATION(SSN, QUAL) VALUES
(1115, 'Engine Overhaul'),
(1115, 'Landing Gear Check'),
(1117, 'Landing Gear Check'),
(1119, 'Wing Inspection'),
(1121, 'Avionics Upgrade'),
(1123, 'Landing Gear Check'),
(1125, 'Propeller Balancing'),
(1127, 'Tire Replacement'),
(1129, 'Oil Change'),
(1111, 'Aeroplane Cleaning'),
(1114, 'Fuel System Check');

/* Insert SERVICE */
INSERT INTO SERVICE(S_DATE, WORK_CODE, HOURS, IS_COMPLETE) VALUES
('2020-01-05', 'Tire Replacement-1127-1', 3, 1),
('2020-09-11', 'Aeroplane Cleaning-1111-2', 4, 0),
('2017-06-07', 'Wing Inspection-1119-4', 18, 1),
('2012-06-06', 'Fuel System Check-1114-5', 7, 0),
('2018-03-05', 'Oil Change-1129-7', 4, 1),
('2022-02-06', 'Tire Replacement-1127-1', 6, 1),
('2023-01-01', 'Propeller Balancing-1125-9', 1, 0),
('2023-03-29', 'Propeller Balancing-1125-10', 3, 0);

/* Insert PLANE_SERVICE */
INSERT INTO PLANE_SERVICE(SER_DATE, SER_CODE, PREG_NO) VALUES
('2020-01-05', 'Tire Replacement-1127-1', 1),
('2020-09-11', 'Aeroplane Cleaning-1111-2', 2),
('2017-06-07', 'Wing Inspection-1119-4', 4),
('2012-06-06', 'Fuel System Check-1114-5', 5),
('2018-03-05', 'Oil Change-1129-7', 7),
('2022-02-06', 'Tire Replacement-1127-1', 1),
('2023-01-01', 'Propeller Balancing-1125-9', 9),
('2023-03-29', 'Propeller Balancing-1125-10', 10);

/* Insert MAINTAIN */
INSERT INTO MAINTAIN(SER_DATE, SER_CODE, E_SSN) VALUES
('2020-01-05', 'Tire Replacement-1127-1', 1127),
('2020-09-11', 'Aeroplane Cleaning-1111-2', 1111),
('2017-06-07', 'Wing Inspection-1119-4', 1119),
('2012-06-06', 'Fuel System Check-1114-5', 1114),
('2018-03-05', 'Oil Change-1129-7', 1129),
('2022-02-06', 'Tire Replacement-1127-1', 1127),
('2023-01-01', 'Propeller Balancing-1125-9', 1125),
('2023-03-29', 'Propeller Balancing-1125-10', 1125);