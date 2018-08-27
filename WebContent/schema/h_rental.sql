create table h_rental(
    rentalDate VARCHAR2(20) NOT NULL,
    stationNo VARCHAR2(50) NOT NULL,
    rentalCode VARCHAR2(30),
    gender VARCHAR2(20),
    age VARCHAR2(20) ,
    useCount NUMBER(6) NOT NULL,
    momentum NUMBER(11,2) NOT NULL,
    carbon NUMBER(11,2) NOT NULL,
    moveDistance NUMBER(8) NOT NULL,
    moveTime NUMBER(6) NOT NULL,
    FOREIGN KEY (stationNo) REFERENCES h_station(stationID)
);