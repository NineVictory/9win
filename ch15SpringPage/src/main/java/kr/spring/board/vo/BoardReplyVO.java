package kr.spring.board.vo;


import kr.spring.util.DurationFromNow;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardReplyVO {
	private long re_num;		//댓글번호
	private String re_content;	//내용
	private String re_date;		//등록일
	private String re_mdate;	//수정일
	private String re_ip;		//아이피 주소
	private long board_num;		//부모글 번호
	private long mem_num;		//작성자 회원번호
	
	private String id;			//아이디(조인의 의해서 만들어질것)
	private String nick_name;	//별명(조인의 의해서 만들어질것)
	
	//로그인 한 상태에서 클릭한 사람의 정보 읽기, 로그인하지 않으면 0 전달
	private int click_num;
	private int refav_cnt;		//댓글 좋아요 갯수
	
	private int resp_cnt;		//답글 개수 
	
	//댓글 날짜를 하루전 한달전 등으로 바꿔주는 코드를 연결하는법
	public void setRe_date(String re_date) {
		this.re_date = DurationFromNow.getTimeDiffLabel(re_date);
		
	}
	public void setRe_mdate(String re_mdate) {
		this.re_date = DurationFromNow.getTimeDiffLabel(re_mdate);
		
	}
}
