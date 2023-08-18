-- Book, Customer, Orders 데이터 생성
INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전',  NULL);

-- 주문(Orders) 테이블의 책값은 할인 판매를 가정함
INSERT INTO Orders VALUES (1, 6000, TO_DATE('2014-07-01','yyyy-mm-dd'), 1, 1); 
INSERT INTO Orders VALUES (2, 21000, TO_DATE('2014-07-03','yyyy-mm-dd'), 1, 3);
INSERT INTO Orders VALUES (3, 8000, TO_DATE('2014-07-03','yyyy-mm-dd'), 2, 5); 
INSERT INTO Orders VALUES (4, 6000, TO_DATE('2014-07-04','yyyy-mm-dd'), 3, 6); 
INSERT INTO Orders VALUES (5, 20000, TO_DATE('2014-07-05','yyyy-mm-dd'), 4, 7);
INSERT INTO Orders VALUES (6, 12000, TO_DATE('2014-07-07','yyyy-mm-dd'), 1, 2);
INSERT INTO Orders VALUES (7, 13000, TO_DATE( '2014-07-07','yyyy-mm-dd'), 4, 8);
INSERT INTO Orders VALUES (8, 12000, TO_DATE('2014-07-08','yyyy-mm-dd'), 3, 10); 
INSERT INTO Orders VALUES (9, 7000, TO_DATE('2014-07-09','yyyy-mm-dd'), 2, 10); 
INSERT INTO Orders VALUES (10, 13000, TO_DATE('2014-07-10','yyyy-mm-dd'), 3, 8);

COMMIT;
