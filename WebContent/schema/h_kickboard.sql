create table h_kickboard(
    kickBoardID VARCHAR(30),
    rentalDate VARCHAR(50) NOT NULL,
    rentalID VARCHAR(10) NOT NULL,
    rentalHolderNo VARCHAR(10) NOT NULL,
    returnDate VARCHAR(50) NOT NULL,
    returnID VARCHAR(50) NOT NULL,
    returnHolderNo VARCHAR(10) NOT NULL,
    useTime NUMBER(11) NOT NULL,
    useDistance NUMBER(11) NOT NULL,
    FOREIGN KEY(rentalID) REFERENCES h_station(stationID),
    FOREIGN KEY(returnID) REFERENCES h_station(stationID)
);