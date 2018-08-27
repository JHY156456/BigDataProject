CREATE TABLE RETURN(
    stationNo VARCHAR(50) NOT NULL,
    returnDate VARCHAR(50) NOT NULL,
    returnNum NUMBER(5) NOT NULL,
    FOREIGN KEY(stationNo) REFERENCES station(stationNo)
);