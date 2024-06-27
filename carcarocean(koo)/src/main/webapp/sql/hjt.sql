
--이벤트 게시판
CREATE TABLE event(
event_num NUMBER NOT NULL,            -- 이벤트 식별자
event_title VARCHAR2(150) NOT NULL,         
event_content CLOB NOT NULL,            
event_photo VARCHAR2(400),
event_hit NUMBER DEFAULT 0 NOT NULL,
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
car_num NUMBER NOT NULL,               -- 차량 식별자
mem_num NUMBER NOT NULL,               -- 회원 식별자
s_re_title VARCHAR2(150) NOT NULL,
s_re_content CLOB NOT NULL,
s_re_reg DATE DEFAULT SYSDATE NOT NULL,
s_re_modify DATE,
CONSTRAINT s_re_pk PRIMARY KEY (s_re_num),
CONSTRAINT s_re_fk1 FOREIGN KEY (car_num) REFERENCES car (car_num),
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

--자동차 뉴스 게시판
CREATE TABLE news(
news_num NUMBER NOT NULL,
news_title VARCHAR2(150) NOT NULL,
news_content CLOB NOT NULL,
news_photo VARCHAR2(400),
news_hit NUMBER DEFAULT 0 NOT NULL,
news_reg DATE DEFAULT SYSDATE NOT NULL,
news_modify DATE,
CONSTRAINT news_pk PRIMARY KEY (news_num)
);

CREATE SEQUENCE news_seq;

