
/* Drop Tables */

DROP TABLE Orders CASCADE CONSTRAINTS;
DROP TABLE Book CASCADE CONSTRAINTS;
DROP TABLE Customer CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE Book
(
	bookid number(2) NOT NULL,
	bookname varchar2(40) NOT NULL,
	publisher varchar2(40),
	price number(8) NOT NULL,
	PRIMARY KEY (bookid)
);


CREATE TABLE Customer
(
	custid number(2) NOT NULL,
	name varchar2(40) NOT NULL,
	address varchar2(50),
	phone varchar2(20),
	PRIMARY KEY (custid)
);


CREATE TABLE Orders
(
	orderid number(2) NOT NULL,
	saleprice number(8) DEFAULT 0 NOT NULL,
	orderdate date DEFAULT SYSDATE,
	custid number(2) NOT NULL,
	bookid number(2) NOT NULL,
	PRIMARY KEY (orderid)
);



/* Create Foreign Keys */

ALTER TABLE Orders
	ADD FOREIGN KEY (bookid)
	REFERENCES Book (bookid)
;


ALTER TABLE Orders
	ADD FOREIGN KEY (custid)
	REFERENCES Customer (custid)
;



