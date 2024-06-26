-- 판매 정보 테이블
CREATE TABLE SELL (
	sell_num NUMBER NOT NULL,
	sell_mile NUMBER NOT NULL,
	sell_cnumber VARCHAR2(100) NOT NULL,
	sell_maker VARCHAR2(100) NOT NULL,
	sell_cname VARCHAR2(100) NOT NULL,
	sell_name VARCHAR2(50) NOT NULL,
	sell_phone VARCHAR2(11) NOT NULL,
	sell_place1 VARCHAR2(100)NOT NULL,
	sell_place2 VARCHAR2(100) NOT NULL,
	sell_date NUMBER NOT NULL,
	sell_check NUMBER(1) DEFAULT 0 NOT NULL ,
	sell_modify_check DATE,
	sell_reg DATE DEFAULT SYSDATE NOT NULL ,
	sell_modify DATE,
	mem_num NUMBER NOT NULL,
	constraint sell_pk primary key (sell_num),
	constraint sell_fk foreign key (mem_num) references member (mem_num)
);
CREATE SEQUENCE SELL_SEQ;
 
-- 구매 정보 테이블
CREATE TABLE BUY (
	buy_num NUMBER NOT NULL,
	mem_num NUMBER NOT NULL,
	car_num NUMBER NOT NULL,
	buy_reg DATE DEFAULT SYSDATE NOT NULL,
	constraint buy_pk primary key (buy_num),
	constraint buy_fk1 foreign key (mem_num) references member (mem_num),
	constraint buy_fk2 foreign key (car_num) references car (car_num)
);
CREATE SEQUENCE BUY_SEQ;

-- 검수자 테이블
CREATE TABLE CHECKER(
	checker_num NUMBER NOT NULL,
	checker_name VARCHAR2(15) NOT NULL,
	checker_photo VARCHAR2(400) NOT NULL,
	checker_company VARCHAR2(30) NOT NULL,
	checker_phone VARCHAR2(11) NOT NULL,
	CONSTRAINT checker_pk PRIMARY KEY (checker_num)
);
CREATE SEQUENCE CHECKER_SEQ;

-- 차량 테이블
CREATE TABLE CAR(
	car_num NUMBER NOT NULL,
	car_maker VARCHAR2(50) NOT NULL,
	car_name VARCHAR2(50) NOT NULL,
	car_size NUMBER(1) NOT NULL,
	car_birth VARCHAR2(15) NOT NULL,
	car_fuel_type NUMBER(1) NOT NULL,
	car_mile NUMBER NOT NULL,
	car_price NUMBER NOT NULL,
	car_color VARCHAR2(20) NOT NULL,
	car_photo VARCHAR2(400) NOT NULL,
	car_auto NUMBER(1) NOT NULL,
	car_fuel_efficiency NUMBER NOT NULL,
	car_use NUMBER NOT NULL,
	car_cc NUMBER NOT NULL,
	car_accident VARCHAR2(100) NOT NULL,
	car_owner_change NUMBER NOT NULL,
	car_design_op VARCHAR2(400) NOT NULL,
	car_con_op VARCHAR2(400) NOT NULL,
	car_drive_op VARCHAR2(400) NOT NULL,
	car_status NUMBER(1) DEFAULT 0 NOT NULL,
	car_cnumber VARCHAR2(11) NOT NULL,
	checker_num NUMBER NOT NULL,
	car_checker_opinion VARCHAR2(100) NOT NULL
	CONSTRAINT car_pk PRIMARY KEY (car_num),
	CONSTRAINT car_fk FOREIGN KEY (checker_num) REFERENCES checker (checker_num)
)
CREATE SEQUENCE CAR_SEQ;

-- 관심 차량 테이블
CREATE TABLE FAVORITE_CAR (
	fav_num NUMBER NOT NULL,
	car_num NUMBER NOT NULL,
	mem_num NUMBER NOT NULL,
	CONSTRAINT favorite_car_pk PRIMARY KEY (fav_num),
	CONSTRAINT favorite_car_fk1 FOREIGN KEY (car_num) REFERENCES car (car_num),
	CONSTRAINT favorite_car_fk2 FOREIGN KEY (mem_num) REFERENCES member (mem_num)
)
CREATE SEQUENCE FAVORITE_CAR_SEQ;

-- 아이템 테이블
create table item(
    item_num NUMBER NOT NULL,
    mem_num NUMBER NOT NULL,
    item_name VARCHAR2(150) NOT NULL,
    item_price NUMBER NOT NULL,
    item_detail VARCHAR2(500) NOT NULL,
    item_photo CLOB,
    item_reg DATE DEFAULT SYSDATE NOT NULL,
    item_status NUMBER DEFAULT 0 NOT NULL,
    item_views NUMBER DEFAULT 0 NOT NULL,
    constraint item_pk primary key (item_num),
    constraint item_fk foreign key (mem_num) references member (mem_num)
);
create sequence item_seq;

-- 아이템 구매 테이블
create table item_buy(
    item_buy_num NUMBER NOT NULL,
    mem_num NUMBER NOT NULL,
    item_num NUMBER NOT NULL,
    item_buy_date DATE DEFAULT SYSDATE NOT NULL,
    constraint item_buy_pk primary key (item_buy_num),
    constraint item_buy_fk1 foreign key (mem_num) references member (mem_num),
    constraint item_buy_fk2 foreign key (item_num) references item (item_num)
);
create sequence item_buy_seq;