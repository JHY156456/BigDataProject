CREATE TABLE RENT(
    stationNo VARCHAR(50) NOT NULL,
    rentDate VARCHAR(50) NOT NULL,
    rentNum NUMBER(5) NOT NULL,
    FOREIGN KEY(stationNo) REFERENCES station(stationNo)
);