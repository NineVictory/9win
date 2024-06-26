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
 mem_reg DATE DEFAULT sysDATE NOT NULL,
 mem_modify DATE,
 mem_grade number DEFAULT 1 NOT NULL,
 mem_total number DEFAULT 0 NOT NULL,
 CONSTRAINT member_detail_pk PRIMARY KEY (mem_num),
 CONSTRAINT member_detail_fk FOREIGN KEY (mem_num)
                        REFERENCES member (mem_num)
);
CREATE SEQUNCE member_seq;


