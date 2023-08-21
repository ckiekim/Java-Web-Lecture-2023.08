/*
 * 2. 데이터 조작 언어(DML: Data Manipulation Language)
 */
 
/*
 * 2.1 삽입(Insert)

INSERT INTO 테비블명[(필드명1, 필드명 2, ..., 필드명 n)]
    VALUES (값1, 값2, ..., 값n);
 
 */
-- 북 테이블에 새로운 레코드 추가
insert into book values(11, '스포츠 의학', '한솔의학서적', 90000);
select * from book;
desc book;
-- 스포츠 심리, 24000원, 출판사 모름
insert into book(bookid, bookname, price)
    values (12, '스포츠 심리', 24000);
-- 박세리 고객이 스포츠 의학을 오늘 구매한 사실을 Orders 테이블에 기록
insert into orders 
    values(11, 90000, default, 5, 11);
-- 박찬호 고객이 스포츠 심리라는 책을 오늘 구매한 사실을 Orders 테이블에 기록
insert into orders(orderid, saleprice, custid, bookid)
    values(12, 24000, 1, 12);
select * from orders;