--자유게시판 신고
create table report_board (
	report_board_num number not null,
	board_num not null, -- 자유게시판 게시글의 식별자
	mem_num not null, -- 회원 번호의 식별자
	constraint report_board_pk primary key (report_board_num),
	constraint report_board_fk1 foreign key (board_num) references board (board_num),
	constraint report_board_fk2 foreign key (mem_num) references member (mem_num)
);

--자유게시판 댓글 신고
create table report_board_comment (
	report_board_comm_num number not null,
	bor_comm_num not null,
	mem_num not null,
	constraint report_board_comm_pk primary key (report_board_comm_num),
	constraint report_board_comm_fk1 foreign key (bor_comm_num) references board_comment (bor_comm_num),
	constraint report_board_comm_fk2 foreign key (mem_num) references member (mem_num)
);

select * from report_board;
--구매 후기 댓글 게시판 신고
create table report_b_re_comment (
	report_b_re_comm_num number not null,
	b_re_comm_num not null, --구매 후기 게시글의 식별자
	mem_num not null, --회원 번호의 식별자
	constraint report_b_re_comment_pk primary key (report_b_re_comm_num),
	constraint report_b_re_comment_fk1 foreign key (b_re_comm_num) references b_re_comment (b_re_comm_num),
	constraint report_b_re_comment_fk2 foreign key (mem_num) references member (mem_num)
);

--판매 후기 댓글 게시판 신고
create table report_s_re_comment (
	report_s_re_comm_num number not null,
	s_re_comm_num not null, --판매 후기 게시글의 식별자
	mem_num not null, --회원 번호의 식별자
	constraint report_s_re_comment_pk primary key (report_s_re_comm_num),
	constraint report_s_re_comment_fk1 foreign key (s_re_comm_num) references s_re_comment (s_re_comm_num), 
	constraint report_s_re_comment_fk2 foreign key (mem_num) references member (mem_num)
);
--좋아요
create table info_fav(
 info_board_num number not null,
 mem_num number not null,
 constraint info_fav_fk1 foreign key (info_board_num) 
                        references info_board (info_board_num),
 constraint info_fav_fk2 foreign key (mem_num)
                        references member (mem_num)    
);