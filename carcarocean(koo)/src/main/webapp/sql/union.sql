--회원
CREATE TABLE member (
     mem_num number NOT NULL,
     mem_id VARCHAR2(12) unique NOT NULL,
     mem_auth number(1) DEFAULT 2 NOT NULL, --회원 등급:0탈퇴회원,1정지회원,2일반회원,9관리자
     CONSTRAINT member_pk PRIMARY KEY (mem_num)
);
--회원상세
CREATE TABLE member_detail(
 mem_num number NOT NULL,
 mem_name VARCHAR2(30) NOT NULL,
 mem_email VARCHAR2(50) NOT NULL,
 mem_passwd VARCHAR2(20) NOT NULL,
 mem_birth DATE NOT NULL,
 mem_phone VARCHAR2(11) NOT NULL,
 mem_zipcode VARCHAR2(5) NOT NULL,  
 mem_address1 VARCHAR2(90) NOT NULL,
 mem_address2 VARCHAR2(90) NOT NULL,
 mem_photo VARCHAR2(400),
 mem_reg DATE DEFAULT SYSDATE NOT NULL,
 mem_modify DATE,
 mem_grade number DEFAULT 1 NOT NULL,
 mem_total number DEFAULT 0 NOT NULL,
 CONSTRAINT member_detail_pk PRIMARY KEY (mem_num),
 CONSTRAINT member_detail_fk FOREIGN KEY (mem_num) REFERENCES member (mem_num)
);
CREATE SEQUENCE member_seq;

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
	car_birth DATE NOT NULL,
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
	checker_num NUMBER NOT NULL,
	car_checker_opinion VARCHAR2(100) NOT NULL,
	CONSTRAINT car_pk PRIMARY KEY (car_num),
	CONSTRAINT car_fk FOREIGN KEY (checker_num) REFERENCES checker (checker_num)
);
CREATE SEQUENCE CAR_SEQ;
 
-- 관심 차량 테이블
CREATE TABLE FAVORITE_CAR (
	fav_num NUMBER NOT NULL,
	car_num NUMBER NOT NULL,
	mem_num NUMBER NOT NULL,
	CONSTRAINT favorite_car_pk PRIMARY KEY (fav_num),
	CONSTRAINT favorite_car_fk1 FOREIGN KEY (car_num) REFERENCES car (car_num),
	CONSTRAINT favorite_car_fk2 FOREIGN KEY (mem_num) REFERENCES member (mem_num)
);
CREATE SEQUENCE FAVORITE_CAR_SEQ;

--이벤트 게시판
CREATE TABLE event(
event_num NUMBER NOT NULL,            -- 이벤트 식별자
event_title VARCHAR2(150) NOT NULL,         
event_content CLOB NOT NULL,            
event_photo VARCHAR2(400),                
event_reg DATE DEFAULT SYSDATE NOT NULL,    
event_modify DATE,
CONSTRAINT event_pk PRIMARY KEY (event_num)
);

CREATE SEQUENCE event_seq;

--Q&A 게시판
CREATE TABLE qa(
qa_num NUMBER NOT NULL,               -- QA 식별자
mem_num NUMBER NOT NULL,               -- 회원 식별자
qa_title VARCHAR2(150) NOT NULL,
qa_content CLOB NOT NULL,
qa_photo VARCHAR2(400),
qa_status NUMBER DEFAULT 1 NOT NULL,
qa_reg DATE DEFAULT SYSDATE NOT NULL,
qa_modify DATE,
CONSTRAINT qa_pk PRIMARY KEY (qa_num),
CONSTRAINT qa_fk FOREIGN KEY (mem_num) REFERENCES member (mem_num)
);
CREATE SEQUENCE qa_seq;

--Q&A 게시판 답변
CREATE TABLE qa_comment(
qa_comm_num NUMBER NOT NULL,            -- QA 답변 식별자
qa_num NUMBER NOT NULL,                  -- QA 식별자
qa_comm_content CLOB NOT NULL,
qa_comm_reg DATE DEFAULT SYSDATE NOT NULL,
qa_comm_modify DATE,
CONSTRAINT qa_comment_pk PRIMARY KEY (qa_comm_num),
CONSTRAINT qa_comment_fk FOREIGN KEY (qa_num) REFERENCES qa (qa_num)
);
CREATE SEQUENCE qa_comment_seq;

--판매 후기 게시판
CREATE TABLE s_re(
s_re_num NUMBER NOT NULL,            -- 판매 후기 식별자
sell_num NUMBER NOT NULL,               -- 판매정보 식별자
mem_num NUMBER NOT NULL,               -- 회원 식별자
s_re_title VARCHAR2(150) NOT NULL,
s_re_content CLOB NOT NULL,
s_re_reg DATE DEFAULT SYSDATE NOT NULL,
s_re_modify DATE,
CONSTRAINT s_re_pk PRIMARY KEY (s_re_num),
CONSTRAINT s_re_fk1 FOREIGN KEY (sell_num) REFERENCES sell (sell_num),
CONSTRAINT s_re_fk2 FOREIGN KEY (mem_num) REFERENCES member (mem_num)
);
CREATE SEQUENCE s_re_seq;

--판매 후기 게시판 댓글
CREATE TABLE s_re_comment(
s_re_comm_num NUMBER NOT NULL,         -- 판매 후기 댓글 식별자
s_re_num NUMBER NOT NULL,               -- 판매 후기 식별자
mem_num NUMBER NOT NULL,               -- 회원 식별자
s_re_comm_content CLOB NOT NULL,
s_re_comm_report NUMBER DEFAULT 0 NOT NULL,
s_re_comm_reg DATE DEFAULT SYSDATE NOT NULL,
CONSTRAINT s_re_comment_pk PRIMARY KEY (s_re_comm_num),
CONSTRAINT s_re_comment_fk1 FOREIGN KEY (s_re_num) REFERENCES s_re (s_re_num),
CONSTRAINT s_re_comment_fk2 FOREIGN KEY (mem_num) REFERENCES member (mem_num)
);
CREATE SEQUENCE s_re_comment_seq;

--공지사항
CREATE TABLE notice (
    notice_num NUMBER NOT NULL,
    notice_title VARCHAR2(150) NOT NULL,
    notice_content CLOB NOT NULL,
    notice_photo VARCHAR2(400),
    notice_impt NUMBER(1) DEFAULT 0 NOT NULL,
    notice_hit NUMBER DEFAULT 0 NOT NULL,
    notice_reg DATE DEFAULT SYSDATE NOT NULL,
    notice_modify DATE,
    CONSTRAINT notice_pk PRIMARY KEY (notice_num)
);
CREATE SEQUENCE notice_seq;

--자유게시판
CREATE TABLE board(
   board_num NUMBER NOT NULL,
   mem_num NUMBER NOT NULL,
   board_title VARCHAR2(150) NOT NULL,
   board_content CLOB NOT NULL,
   board_photo VARCHAR2(400),
   board_hit NUMBER DEFAULT 0 NOT NULL,
   board_report NUMBER DEFAULT 0 NOT NULL,
   board_reg DATE DEFAULT SYSDATE NOT NULL,
   board_modify DATE,
   CONSTRAINT board_pk PRIMARY KEY (board_num),
   CONSTRAINT board_fk FOREIGN KEY (mem_num) REFERENCES member (mem_num)
);
CREATE SEQUENCE board_seq;

--자유게시판 댓글
CREATE TABLE board_comment(
   bor_comm_num NUMBER NOT NULL,
   board_num NUMBER NOT NULL,
   mem_num NUMBER NOT NULL,
   bor_comm_content CLOB NOT NULL,
   bor_comm_report NUMBER DEFAULT 0 NOT NULL,
   bor_comm_reg DATE DEFAULT SYSDATE NOT NULL,
   CONSTRAINT board_comment_pk PRIMARY KEY (bor_comm_num),
    CONSTRAINT board_comment_fk1 FOREIGN KEY (board_num) REFERENCES board (board_num),
    CONSTRAINT board_comment_fk2 FOREIGN KEY (mem_num) REFERENCES member (mem_num)
);
CREATE SEQUENCE board_comment_seq;

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

--구매 후기 게시판
CREATE TABLE b_re(
   b_re_num NUMBER NOT NULL,
   buy_num NUMBER NOT NULL,
   mem_num NUMBER NOT NULL,
   car_num NUMBER NOT NULL,
   b_re_title VARCHAR2(150) NOT NULL,
   b_re_content CLOB NOT NULL,
   b_re_photo VARCHAR2(400) NOT NULL,
   b_re_reg DATE DEFAULT SYSDATE NOT NULL,
   b_re_modify DATE,
   CONSTRAINT b_re_pk PRIMARY KEY (b_re_num),
    CONSTRAINT b_re_fk1 FOREIGN KEY (buy_num) REFERENCES buy (buy_num)
);
CREATE SEQUENCE b_re_seq;

--구매 후기 게시판 댓글
CREATE TABLE b_re_comment(
   b_re_comm_num NUMBER NOT NULL,
   b_re_num NUMBER NOT NULL,
   mem_num NUMBER NOT NULL,
   b_re_comm_content CLOB NOT NULL,
   b_re_comm_report NUMBER DEFAULT 0 NOT NULL,
   b_re_comm_reg DATE DEFAULT SYSDATE NOT NULL,
   CONSTRAINT b_re_comment_pk PRIMARY KEY (b_re_comm_num),
    CONSTRAINT b_re_comment_fk1 FOREIGN KEY (b_re_num) REFERENCES b_re (b_re_num),
    CONSTRAINT b_re_comment_fk2 FOREIGN KEY (mem_num) REFERENCES member (mem_num)
);
CREATE SEQUENCE b_re_comment_seq;