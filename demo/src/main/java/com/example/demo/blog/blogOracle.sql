
/* Drop Triggers */

DROP TRIGGER TRI_blog_bid;



/* Drop Tables */

DROP TABLE blog CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_blog_bid;




/* Create Sequences */

CREATE SEQUENCE SEQ_blog_bid INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE blog
(
	bid number NOT NULL,
	penName varchar2(20) NOT NULL,
	title varchar2(128) NOT NULL,
	content varchar2(4000),
	modTime timestamp DEFAULT CURRENT_TIMESTAMP,
	viewCount number DEFAULT 0 NOT NULL,
	isDeleted number DEFAULT 0 NOT NULL,
	PRIMARY KEY (bid)
);



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_blog_bid BEFORE INSERT ON blog
FOR EACH ROW
BEGIN
	SELECT SEQ_blog_bid.nextval
	INTO :new.bid
	FROM dual;
END;

/




