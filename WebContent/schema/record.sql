
CREATE TABLE record(
bikeNo VARCHAR(30) NOT NULL,
rentalDate VARCHAR(50) NOT NULL,
rentalNo VARCHAR(30) NOT NULL,
rentalHolderNo VARCHAR(20) NOT NULL,
returnDate VARCHAR(50) NOT NULL,
returnNo VARCHAR(20) NOT NULL,
returnHolderNo VARCHAR(20) NOT NULL,
useTime NUMBER(11) NOT NULL,
useDistance NUMBER(11) NOT NULL,
FOREIGN KEY(rentalNo) REFERENCES station(stationNo),
FOREIGN KEY(returnNo) REFERENCES station(stationNo)
);