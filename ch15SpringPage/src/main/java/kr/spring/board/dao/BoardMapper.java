package kr.spring.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.board.vo.BoardFavVO;
import kr.spring.board.vo.BoardReFavVO;
import kr.spring.board.vo.BoardReplyVO;
import kr.spring.board.vo.BoardVO;

@Mapper
public interface BoardMapper {
	//부모글
	public List<BoardVO> selectList(Map<String,Object>map);
	public Integer selectRowCount(Map<String,Object>map);  //Integer나 int나 아무거로 해도됨
	public void insertBoard(BoardVO board);
	@Select("SELECT * FROM spboard JOIN spmember USING (mem_num) LEFT OUTER JOIN spmember_detail USING(mem_num) WHERE board_num=#{board_num}") //LEFT OUTER를 하는 이유는 탈퇴했을 때 에러나는 것을 방지하기 위해
	public BoardVO selectBoard(Long board_num);
	@Update("UPDATE spboard SET hit=hit+1 WHERE board_num=#{board_num}")
	public void updateHit(Long board_num);
	public void updateBoard(BoardVO board);
	@Delete("DELETE FROM spboard WHERE board_num = #{board_num}")
	public void deleteBoard(Long board_num);
	@Update("UPDATE spboard SET filename='' WHERE board_num=#{board_num}")
	public void deleteFile(Long board_num);
	
	//부모글 좋아요
	@Select("SELECT * FROM spboard_fav WHERE board_num=#{board_num} AND mem_num=#{mem_num}")
	public BoardFavVO selectFav(BoardFavVO fav);
	@Select("SELECT COUNT(*) FROM spboard_fav WHERE board_num=#{board_num}")
	public Integer selectFavCount(Long board_num);
	@Insert("INSERT INTO spboard_fav (board_num,mem_num) VALUES (#{board_num},#{mem_num})")
	public void insertFav(BoardFavVO fav);
	@Delete("DELETE FROM spboard_fav WHERE board_num=#{board_num} AND mem_num=#{mem_num}")
	public void deleteFav(BoardFavVO fav);
	@Delete("DELETE FROM spboard_fav WHERE board_num=#{board_num}")
	public void deleteFavByBoardNum(Long board_num);
	
	//댓글
	public List<BoardReplyVO> selectListReply(Map<String,Object> map);
	@Select("SELECT COUNT(*) FROM spboard_reply WHERE board_num =#{board_num}")
	public Integer selectRowCountReply(Map<String,Object>map); //mybatis는 객체형태로 처리하기 때문에 int보다 Integer로 명시한다. int를 써도 자동으로 바뀌긴함. 그냥 명시를 맞게 해주는게 좋아서 
	//댓글 수정,삭제시 작성자 회원번호를 구하기 위해 사용
	@Select("SELECT * FROM spboard_reply WHERE re_num=#{re_num}")
	public BoardReplyVO selectReply(Long re_num);
	public void insertReply(BoardReplyVO boardReply);
	@Update("UPDATE spboard_reply SET re_content=#{re_content},re_ip=#{re_ip},re_mdate=SYSDATE WHERE re_num=#{re_num}")
	public void updateReply(BoardReplyVO boardReply);
	@Delete("DELETE FROM spboard_reply WHERE re_num=#{re_num}")
	public void deleteReply(Long re_num);
	//부모글 삭제시 댓글이 존재하면 부모글 삭제전 댓글 삭제
	@Delete("DELETE FROM spboard_reply WHERE board_num=#{board_num}")
	public void deleteReplyByBoardNum(Long board_num);
	//부모글 삭제시 댓글의 답글이 존재하면 댓글 번호를 구해서 답글 삭제시 사용
	@Select("SELECT * FROM spboard_reply WHERE board_num=#{board_num}")
	public List<Long> selectReNumsByBoard_num(Long board_num);
	
	//댓글 좋아요
	@Select("SELECT * FROM spreply_fav WHERE re_num=#{re_num} AND mem_num=#{mem_num}")
	public BoardReFavVO selecReFav(BoardReFavVO fav);
	@Select("SELECT * COUNT(*) FROM spreply_fav WHERE re_num=#{re_num}")
	public Integer selectReFavCount(Long re_num);
	public void insertReFav(BoardReFavVO fav);
	public void deleteReFav(BoardReFavVO fav);
	public void deleteReFavByRenum(Long re_num);
	public void deleteReFavByBoardNum(Long board_num);
	
	
	//답글(대댓글)
}














