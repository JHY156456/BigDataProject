CREATE TABLE station(
district VARCHAR(50) NOT NULL,
stationNo VARCHAR(50) NOT NULL PRIMARY KEY,
stationName VARCHAR(100) NOT NULL,
holderNo VARCHAR(50) NOT NULL,
latitude NUMBER(11,7) NOT NULL,
longitude NUMBER(11,7) NOT NULL);