/*
 * 1.4 그룹 분석(GROUP BY)
 */
-- 고객별로 주문한 도서의 총 수량과 총 판매액
select custid, count(*), sum(saleprice) from orders group by custid;
-- 출판사별로 출간한 책 수량과 평균 금액
select * from book;
select publisher, count(*), avg(price) from book group by publisher;
/* HAVING */
-- 책을 2권 이상 출간한 출판사의 평균 책 가격
select publisher, count(*), avg(price) from book 
    group by publisher
    having count(*) >= 2;
-- 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량 및 평균 금액
-- 단, 두 권 이상 구매한 고객만 구한다.
select * from orders;
select custid, count(*), avg(saleprice) from orders 
    where saleprice >= 8000
    group by custid
    having count(*) >= 2;
-- 누가 책 매출액이 많은가?
select custid, sum(saleprice) from orders
    group by custid
    order by sum(saleprice) desc;
    
/*
 * 1.5 두개 이상의 테이블
 */
select * from orders, customer;
select * from orders, customer
    where orders.custid = customer.custid;
-- orders 테이블에서 custid를 고객명으로 변경해서 출력
select o.orderid, o.saleprice, o.orderdate, o.bookid, c.name 
    from orders o, customer c
    where o.custid = c.custid;
-- orders 테이블에서 bookid와 custid를 이름으로 변경해서 출력
select o.orderid, o.saleprice, o.orderdate, b.bookname, c.name 
    from orders o, book b, customer c
    where o.custid = c.custid and o.bookid = b.bookid;
-- 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬
select c.custid, c.name, c.address, c.phone, o.bookid, o.saleprice, o.orderdate
    from customer c, orders o
    where c.custid = o.custid
    order by c.custid;
/* Inner Join */
select c.custid, c.name, c.address, c.phone, o.bookid, o.saleprice, o.orderdate
    from customer c
    inner join orders o
    on c.custid = o.custid
    order by c.custid;
-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색
select c.name, o.saleprice from customer c
    join orders o
    on c.custid = o.custid;
-- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬
select c.name, sum(o.saleprice)
    from customer c, orders o
    where c.custid = o.custid
    group by c.name;
select c.custid, c.name, sum(o.saleprice)
    from customer c 
    join orders o                   -- inner join 에서 inner 생략 가능
    on c.custid = o.custid
    group by c.custid, c.name;
-- 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름
select c.name, b.bookname, o.saleprice
    from orders o, customer c, book b
    where o.custid = c.custid and o.bookid = b.bookid and o.saleprice=20000;
select c.name, b.bookname, o.saleprice
    from orders o
    join customer c on o.custid = c.custid
    join book b on o.bookid = b.bookid
    where o.saleprice=20000;
/* Outer join */
-- 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격
select c.custid, c.name, o.saleprice
    from customer c
    left join orders o          -- left outer join에서 outer 생략 가능
    on c.custid = o.custid;
    
/*
 * 1.6 부속 질의
 */
-- 가장 비싼 도서의 이름
select max(price) from book;
select bookname, price from book
    where price = (select max(price) from book);
-- 도서를 구매한 적이 있는 고객의 이름을 검색
select distinct custid from orders;
select custid, name from customer
    where custid in (select distinct custid from orders);
-- 대한미디어에서 출판한 도서를 구매한 고객의 이름
select bookid from book where publisher like '대한미디어';
select custid from orders
    where bookid in (select bookid from book where publisher like '대한미디어');
select custid, name from customer
    where custid in (select custid from orders
        where bookid in (select bookid from book where publisher like '대한미디어'));

