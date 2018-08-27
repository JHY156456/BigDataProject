drop table BOARD cascade constraint;

create table BOARD(
	BOARD_NUM NUMBER(5) PRIMARY KEY,
	BOARD_NAME VARCHAR(100) NOT NULL,
	BOARD_CONTENT VARCHAR(100) NOT NULL,
	BOARD_WRITER VARCHAR(100) NOT NULL,
	BOARD_DATE DATE,
	BOARD_VIEWCNT NUMBER(5) NOT NULL,
	BOARD_LIKE NUMBER(5) NOT NULL,
	BOARD_DISLIKE NUMBER(5) NOT NULL,
	BOARD_BLAME NUMBER(5) NOT NULL,
	BOARD_WRITE_ID VARCHAR(50) NOT NULL,
	BOARD_SORT NUMBER(5) 
);
insert into BOARD values (2,'신혜영','하이요오','조용철',sysdate,1,2,3,4,'gusdud0222',1);
insert into BOARD values (3,'asdf','하이요오','조용철',sysdate,1,2,3,4,'gusdud0223',1);
insert into BOARD values (4,'qwer','하이요오','조용철',sysdate,1,2,3,4,'gusdud0222',1);
insert into BOARD values (5,'아아앙','하이요오','조용철',sysdate,1,2,3,4,'gusdud0223',1);
insert into BOARD values (6,'조용철','하이요오','조용철',sysdate,1,2,3,4,'gusdud0226',1);
insert into BOARD values (7,'바보','하이요오','조용철',sysdate,1,2,3,4,'gusdud0226',1);
insert into BOARD values (8,'신혜영','하이요오','조용철',sysdate,1,2,3,4,'gusdud0226',1);
insert into BOARD values (9,'멍청이','하이요오','조용철',sysdate,1,2,3,4,'gusdud0226',1);
insert into BOARD values (10,'쓰리에이치','하이요오','조용철',sysdate,1,2,3,4,'gusdud0226',1);
insert into BOARD values (12,'짱','하이요오','조용철',sysdate,1,2,3,4,'gusdud0226',1);
insert into BOARD values (13,'신혜영','하이요오','조용철',sysdate,1,2,3,4,'gusdud0226',1);
insert into BOARD values (14,'신혜영','하이요오','조용철',sysdate,1,2,3,4,'gusdud0226',1);
insert into BOARD values (15,'신혜영','하이요오','조용철',sysdate,1,2,3,4,'gusdud0226',2);
insert into BOARD values (16,'신혜영','하이요오','조용철',sysdate,1,2,3,4,'gusdud0226',2);
commit;
