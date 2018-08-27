drop table USERS cascade constraint;

CREATE TABLE USERS(
	ID VARCHAR(20),
	PASSWD VARCHAR(20),
	ADDR VARCHAR(50),
	AGE NUMBER(5),
	EMAIL VARCHAR(50),
	GENDER VARCHAR(10),
	NAME VARCHAR(12),
	NATION VARCHAR(16)
);

INSERT INTO USERS VALUES ('gusdud0222','1234','서',40,'gusdud0222@naver.com','M','정현영','대한민국');
INSERT INTO USERS VALUES ('admin','1234','서',40,'gusdud0222@naver.com','M','정현영','대한민국');
commit;