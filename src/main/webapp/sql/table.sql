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
  email2 varchar2(20) not null,
  sawongrade varchar2(15) not null
);