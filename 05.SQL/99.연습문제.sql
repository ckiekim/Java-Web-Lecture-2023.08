/* 1. 마당서점의 고객이 요구하는 다음 질문에 대해 SQL 문을 작성하시오. */
-- (1) 도서번호가 1인 도서의 이름
select bookname from book where bookid=1;
-- (2) 가격이 20,000원 이상인 도서의 이름
select bookname, price from book where price >= 20000;
-- (3) 박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
select sum(saleprice) from orders where custid=1;
select sum(o.saleprice) from orders o
    join customer c
    on o.custid=c.custid
    where c.name='박지성';
-- (4) 박지성이 구매한 도서의 수(박지성의 고객번호는 1번으로 놓고 작성)
select count(*) from orders where custid=1;

/* 2. 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을 작성하시오. */
-- (1) 마당서점 도서의 총 개수
select count(*) from book;
-- (2) 마당서점에 도서를 출고하는 출판사의 총 개수
select count(distinct publisher) from book;
-- (3) 모든 고객의 이름, 주소
select name, address from customer;
-- (4) 2014년 7월 4일~7월 7일 사이에 주문 받은 도서의 주문번호
select orderid from orders where orderdate between '2014-07-04' and '2014-07-07';
-- (5) 2014년 7월 4일~7월 7일 사이에 주문 받은 도서를 제외한 도서의 주문번호
select orderid from orders where orderdate not between '2014-07-04' and '2014-07-07';
-- (6) 성이 ‘김’ 씨인 고객의 이름과 주소
select name, address from customer where name like '김%';
-- (7) 성이 ‘김’ 씨이고 이름이 ‘아’로 끝나는 고객의 이름과 주소
select name, address from customer where name like '김%아';

/* 3. 마당서점의 고객이 요구하는 다음 질문에 대해 SQL 문을 작성하시오. */
-- (1) 박지성이 구매한 도서의 출판사 수
select count(distinct b.publisher) from orders o 
    join book b on o.bookid=b.bookid
    join customer c on o.custid=c.custid
    where c.name like '박지성';
-- (2) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select b.bookname, b.price, o.saleprice, o.saleprice-b.price from orders o 
    join book b on o.bookid=b.bookid
    join customer c on o.custid=c.custid
    where c.name like '박지성';  
-- (3) 박지성이 구매하지 않은 도서의 이름
select bookname from book minus
    select b.bookname from orders o 
        join book b on o.bookid=b.bookid
        join customer c on o.custid=c.custid
        where c.name like '박지성';

/* 4. 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을 작성하시오. */
-- (1) 주문하지 않은 고객의 이름(부속질의 사용)
select name from customer
    where custid not in (select distinct custid from orders);
-- (2) 주문 금액의 총액과 주문의 평균 금액
select sum(saleprice), avg(saleprice) from orders;
select sum(saleprice), round(avg(saleprice), 0) from orders;
-- (3) 고객의 이름과 고객별 구매액
select c.name, sum(o.saleprice) from orders o
    join customer c on o.custid=c.custid
    group by c.name; 
-- (4) 고객의 이름과 고객이 구매한 도서 목록
select c.name, listagg(b.bookname, ', ') within group (order by b.bookname) booklist 
    from orders o
    join customer c on o.custid=c.custid
    join book b on o.bookid=b.bookid
    group by c.name; 
-- (5) 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
-- 판매가격과 정가의 차이가 제일 큰 값 = 6000
select max(abs(o.saleprice-b.price)) from orders o
    join book b on o.bookid=b.bookid;
-- 판가와 정가의 차이가 6000원인 주문 찾기
select o.orderid, o.saleprice, b.price from orders o
    join book b on o.bookid=b.bookid
    where abs(o.saleprice-b.price) = 6000;
-- 위 두개의 SQL을 결합
select o.orderid, o.saleprice, b.price from orders o
    join book b on o.bookid=b.bookid
    where abs(o.saleprice-b.price) = (
        select max(abs(o.saleprice-b.price)) from orders o
            join book b on o.bookid=b.bookid);          
-- (6) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
select avg(saleprice) from orders;
select c.name, avg(o.saleprice) from orders o
    join customer c on o.custid=c.custid
    group by c.name
    having avg(o.saleprice) > (select avg(saleprice) from orders);

/* 5. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오. */
-- (1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select b.publisher from orders o
    join book b on o.bookid=b.bookid
    join customer c on o.custid=c.custid
    where c.name like '박지성';
select distinct ec.name from orders eo
    join book eb on eo.bookid=eb.bookid
    join customer ec on eo.custid=ec.custid
    where eb.publisher in (select b.publisher from orders o
        join book b on o.bookid=b.bookid
        join customer c on o.custid=c.custid
        where c.name like '박지성');
-- (2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
select c.name, count(DISTINCT b.publisher) from orders o
    join book b on o.bookid=b.bookid
    join customer c on o.custid=c.custid
    group by c.name having count(DISTINCT b.publisher)>=2;
-- (3) (생략) 전체 고객의 30% 이상이 구매한 도서 
select b.bookname, count(o.bookid) from orders o
    join book b on o.bookid=b.bookid
    group by b.bookname having count(o.bookid) >= 2;
select * from orders;

/* 6. 다음 질의에 대해 DML 문을 작성하시오. */
-- (1) 새로운 도서 ('스포츠 세계', '대한미디어', 10000원)이 마당서점에 입고되었다. 
--     삽입이 안 될 경우 필요한 데이터가 더 있는지 찾아보자.
insert into book values(13, '스포츠 세계', '대한미디어', 10000);
-- (2) '삼성당'에서 출판한 도서를 삭제해야 한다.
delete from book where publisher like '삼성당';
select * from book;
-- (3) '이상미디어'에서 출판한 도서를 삭제해야 한다. 삭제가 안 될 경우 원인을 생각해보자.
select * from orders
    where bookid in (select bookid from book where publisher like '이상미디어');
-- (4) 출판사 '대한미디어'가 '대한출판사'로 이름을 바꾸었다.
update book set publisher='대한출판사'
    where publisher like '대한미디어';