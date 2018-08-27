create table h_station(
	stationID VARCHAR(10) PRIMARY KEY,
    stationName VARCHAR(150) NOT NULL,
    district VARCHAR(30) NOT NULL,
	holdNum NUMBER(3) NOT NULL,
	boardNum NUMBER(3) NOT NULL,
	latitude NUMBER(11,7) NOT NULL,
	longitude NUMBER(11,7) NOT NULL
);