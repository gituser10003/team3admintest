--sys(DBA) 계정에서
CREATE USER DNM IDENTIFIED BY cafe;

GRANT CONNECT, RESOURCE TO DNM;
-------------------------------------

-- DNM :: cafe 계정에서
DROP TABLE CATEGORY;
DROP TABLE PRODUCT;
DROP TABLE MEMBER;
DROP TABLE OPT;
DROP TABLE SAWON;
--(작성 예정)DROP TABLE SALE;


--CATEGORY 테이블 생성
CREATE TABLE CATEGORY (
    CTNO VARCHAR2(20) PRIMARY KEY
    , CTNM VARCHAR2(20)    
    );
--PRODUCT 테이블 생성
CREATE TABLE PRODUCT (
    PDNO VARCHAR2(20) PRIMARY KEY
    , PDNM VARCHAR2(50) 
    , PDPRICE NUMBER(7)
    ,CTNO VARCHAR2(20) REFERENCES CATEGORY
	, PDFILE VARCHAR2(200)
    );
    
	
--MEMBER 테이블 생성
CREATE TABLE MEMBER (
    MEMNO NUMBER(20) PRIMARY KEY
    , MEMNAME VARCHAR2(10) 
    , MEMPHONE NUMBER(11) NOT NULL
    , MEMEMAIL VARCHAR2(45) NOT NULL
    , MEMPASSWD VARCHAR2(20) NOT NULL
    , MEMPOINT NUMBER(10)
    , MEMGRADE VARCHAR2(5)
    );
--MEMBER 테이블 생성(수정 220808!!)
CREATE TABLE MEMBER (
     MEMNO NUMBER(20) PRIMARY KEY
    , MEMPHONE1 NUMBER(4) NOT NULL
    , MEMPHONE2 NUMBER(4) NOT NULL
    , MEMPHONE3 NUMBER(4) NOT NULL
    , MEMPASSWD VARCHAR2(20) 
    , MEMPOINT NUMBER(10)
    );
    
--OPT 테이블 생성 
CREATE TABLE OPT (
    OPTNO VARCHAR2(20) PRIMARY KEY
    , OPTNAME VARCHAR2(30)
    , OPTPRICE NUMBER(10)
    , CTNO NUMBER(10) REFERENCES CATEGORY
    );
	
	
--DBA DMN계정 
CREATE USER DMN IDENTIFIED BY cafe;
GRANT CONNECT, RESOURCE TO DMN;

-- DMN 사원테이블
create table sawon
(
  userid varchar2(15) primary key,
  passwd varchar2(15) not null,
  username varchar2(10) not null,
  phonenumber1 varchar2(3) not null,
  phonenumber2 varchar2(4) not null,
  phonenumber3 varchar2(4) not null,
  birthday1 varchar2(4) not null,
  birthday2 varchar2(2) not null,
  birthday3 varchar2(2) not null,
  email1 varchar2(20) not null,
  email2 varchar2(20) not null
);


--SALE 테이블 생성 
CREATE TABLE SALE (
    SALENO NUMBER(10)
    ,PDNO VARCHAR2(20) REFERENCES PRODUCT
    ,OPTNO NUMBER(10) REFERENCES OPT
    ,OPTAMT NUMBER(5)
    ,MEMNO NUMBER(20) REFERENCES MEMBER
    ,SALEDATE DATE
    ,SALECOMPLETE VARCHAR2(5)
    ,CONSTRAINT SALE_GROUP_PK PRIMARY KEY(SALENO,PDNO,OPTNO)
);

-- SALE 데이터 입력 테스트케이스!! 
-- 회원넘버22042800001님이 
-- 주문[핫라떼 -옵션 : 샷추가, 슈가시럽추가, 연하게추가]을 실행했을때 입력되는 INSERT문
--insert into SALE (SALENO, PDNO, OPTNO, OPTAMT, MEMNO, SALEDATE, SALECOMPLETE)
--           VALUES (07190001, 71, 51, 1, 2022000001, SYSDATE, 'N');
--insert into SALE (SALENO, PDNO, OPTNO, OPTAMT, MEMNO, SALEDATE, SALECOMPLETE)
--            VALUES (07190001, 71, 52, 1, 2022000001, SYSDATE, 'N');
--insert into SALE (SALENO, PDNO, OPTNO, OPTAMT, MEMNO, SALEDATE, SALECOMPLETE)
--            VALUES (07190001, 71, 56, 1, 2022000001, SYSDATE, 'N');
 

 
-- CATEGORY 테이블 insert문
insert into category (ctno, ctnm) VALUES ('CT01', '디저트');
insert into category (ctno, ctnm) VALUES ('CT02', '논카페');
insert into category (ctno, ctnm) VALUES ('CT03', '디카페인');
insert into category (ctno, ctnm) VALUES ('CT04', '스무디');
insert into category (ctno, ctnm) VALUES ('CT05', '커피(HOT)');
insert into category (ctno, ctnm) VALUES ('CT06', '커피(ICE)');


-- 1. 디저트 insert문
insert into product (pdno, pdnm, pdprice, ctno) VALUES ('PD01', '레드벨벳스틱케익', 2000, 'CT01');
insert into product (pdno, pdnm, pdprice, ctno) VALUES (DJ01, '초콜릿스틱케익', 2000, 'CT01');
insert into product (pdno, pdnm, pdprice, ctno) VALUES (DJ01, '치즈스틱케익', 2000, 'CT01');
insert into product (pdno, pdnm, pdprice, ctno) VALUES (DJ01, '티라미수스틱케익', 2000, 'CT01');
insert into product (pdno, pdnm, pdprice, ctno) VALUES (DJ01, '육쪽마늘빵', 2000, 'CT01');
insert into product (pdno, pdnm, pdprice, ctno) VALUES (DJ01, '허니브레드', 2000, 'CT01');
insert into product (pdno, pdnm, pdprice, ctno) VALUES (DJ01, '녹차 마카롱', 2000, 'CT01');
insert into product (pdno, pdnm, pdprice, ctno) VALUES (DJ01, '딸기 마카롱', 2000, CT01);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (DJ01, '민트마카롱', 2000, CT01);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (DJ01, '바닐라마카롱', 2000, CT01);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (DJ01, '블루베리마카롱', 2000, CT01);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (DJ01, '유니콘마카롱', 2000, CT01);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (DJ01, '인절미마카롱', 2000, CT01);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (DJ01, '자몽마카롱', 2000, CT01);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (DJ01, '쿠앤크마카롱', 2000, CT01);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (DJ01, '피치마카롱', 2000, CT01);

-- 2. 논카페 insert문
insert into product (pdno, pdnm, pdprice, ctno) VALUES (PN01, '패션후르츠에이드', 2000, CT02);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (22, '라임모히또 에이드', 2000, 02);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (23, '복숭아 에이드', 2000, 02);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (24, '블루레몬에이드', 2000, 02);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (25, '자몽에이드', 2000, 02);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (26, '오렌지에이드', 2000, 02);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (27, '핑크레몬에이드', 2000, 02);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (28, '딸기라떼', 2000, 02);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (29, '초코라떼', 2000, 02);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (30, '아이스녹차라떼', 2000, 02);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (31, '핫녹차라떼', 2000, 02);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (32, '토피넛라떼', 2000, 02);

-- 3. 디카페인 insert문
insert into product (pdno, pdnm, pdprice, ctno) VALUES (PD01, '콜드브루 라떼', 2000, 03);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (42, '콜드브루 브라운슈가 버블라떼', 2000, 03);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (43, '콜드브루 카라멜 마끼아또', 2000, 03);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (44, '콜드브루 헤이즐 넛라떼', 2000, 03);

-- 4. 스무디 insert문
insert into product (pdno, pdnm, pdprice, ctno) VALUES (PS01, '녹차 스무디', 2000, 04);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (52, '딸기요거트 스무디', 2000, 04);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (53, '망고요거트 스무디', 2000, 04);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (54, '망고 스무디', 2000, 04);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (55, '복숭아 스무디', 2000, 04);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (56, '블루베리 스무디', 2000, 04);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (57, '요거트 스무디', 2000, 04);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (58, '청포도 스무디', 2000, 04);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (59, '초코 스무디', 2000, 04);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (60, '토마토 스무디', 2000, 04);

-- 5. 커피(HOT) insert문
insert into product (pdno, pdnm, pdprice, ctno) VALUES (PH01, '핫라떼', 2000, 05);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (72, '핫모카', 2000, 05);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (73, '핫바닐라라떼', 2000, 05);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (74, '핫아메리카노', 2000, 05);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (75, '핫카푸치노', 2000, 05);

-- 6. 커피(ICE) insert문
insert into product (pdno, pdnm, pdprice, ctno) VALUES (PI01, '아이스라떼', 2000, 06);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (82, '아이스모카', 2000, 06);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (83, '아이스바닐라라떼', 2000, 06);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (84, '아이스아메리카노', 2000, 06);
insert into product (pdno, pdnm, pdprice, ctno) VALUES (85, '아이스카푸치노', 2000, 06);

-- MEMBER 테이블 insert문
-- 01012340000
insert into member VALUES (20220000000,'비화원',01012340000,'visitor@naver.com','q1w2e3r4',0,null);
insert into member VALUES (20220000001,'임꺽정',01012340001,'abcde1001@naver.com','abcd1234',0,null);
insert into member VALUES (20220000002,'홍길동',01012340002,'abcde1002@daum.net','abcd1234',1000,null);
insert into member VALUES (20220000003,'이순신',01012340003,'abcde1003@gmail.com','abcd1234',2000,null);
insert into member VALUES (20220000004,'유관순',01012340004,'abcde1004@naver.com','abcd1234',500,null);
insert into member VALUES (20220000005,'정약용',01012340005,'abcde1005@daum.net','abcd1234',700,null);
insert into member VALUES (20220000006,'김태희',01012340006,'abcde1006@gmail.com','abcd1234',0,null);
insert into member VALUES (20220000007,'한가인',01012340007,'abcde1007@naver.com','abcd1234',5000,null);
insert into member VALUES (20220000008,'손흥민',01012340008,'abcde1008@daum.net','abcd1234',3500,null);
insert into member VALUES (20220000009,'박서준',01012340009,'abcde1009@gmail.com','abcd1234',0,null);



--커피 : 샷추가 ,연하게,슈가시럽추가,바닐라시럽추가,카라멜시럽추가,헤이즐넛시럽추가,얼음많이,얼음적게
--스무디 : 덜달게,시럽추가,휘핑크림
--논카페 :덜달게,시럽추가,얼음많이,얼음적게,휘핑크림    

--CATEGORY 2[논카페] INSERT
insert into OPT VALUES (OP21,'덜달게',0,CT02);
insert into OPT VALUES (22,'시럽추가',500,02);
insert into OPT VALUES (23,'얼음많이',0,02);
insert into OPT VALUES (24,'얼음적게',0,02);
insert into OPT VALUES (25,'휘핑크림',500,02);

--CATEGORY 4[스무디] INSERT
insert into OPT VALUES (OP41,'덜달게',0,CT04);
insert into OPT VALUES (42,'시럽추가',500,04);
insert into OPT VALUES (43,'휘핑크림',500,04);

--CATEGORY 5[커피(HOT)] INSERT
insert into OPT VALUES (OP51,'샷추가',500,05);
insert into OPT VALUES (52,'슈가시럽추가',500,05);
insert into OPT VALUES (53,'바닐라시럽추가',500,05);
insert into OPT VALUES (54,'카라멜시럽추가',500,05);
insert into OPT VALUES (55,'헤이즐넛시럽추가',500,05);
insert into OPT VALUES (56,'연하게',0,05);

--CATEGORY 6[커피(ICE)] INSERT
insert into OPT VALUES (OP61,'샷추가',500,06);
insert into OPT VALUES (62,'슈가시럽추가',500,06);
insert into OPT VALUES (63,'바닐라시럽추가',500,06);
insert into OPT VALUES (64,'카라멜시럽추가',500,06);
insert into OPT VALUES (65,'헤이즐넛시럽추가',500,06);
insert into OPT VALUES (66,'연하게',0,06);
insert into OPT VALUES (67,'얼음많이',0,06);
insert into OPT VALUES (68,'얼음적게',0,06);

--사원 테이블 insert문
insert into sawon VALUES (1,1,'이보라','010','1111','5678','1999','01','01','aa','google.com');
insert into sawon VALUES (2,2,'강신범','010','2222','5678','1999','01','02','bb','google.com');
insert into sawon VALUES (3,3,'김문재','010','3333','5678','1999','01','03','cc','google.com');
insert into sawon VALUES (4,4,'김한승','010','4444','5678','1999','01','04','dd','google.com');
insert into sawon VALUES (5,5,'박준영','010','5555','5678','1999','01','05','ee','google.com');
insert into sawon VALUES (6,6,'신원석','010','6666','5678','1999','01','06','ff','google.com');

COMMIT;


SELECT * FROM PRODUCT;
SELECT * FROM CATEGORY;
SELECT * FROM MEMBER;
SELECT * FROM OPT;
SELECT * FROM SAWON;
--(작성예정)SELECT * FROM SALE;