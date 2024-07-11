package kr.spring.talk.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import kr.spring.talk.vo.TalkMemberVO;
import kr.spring.talk.vo.TalkRoomVO;
import kr.spring.talk.vo.TalkVO;

@Service
@Transactional
public class TalkServiceImpl implements TalkService{

	@Override
	public List<TalkRoomVO> selectTalkRoomList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertTalkRoom(TalkRoomVO talkRoomVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<TalkMemberVO> selectTalkmember(Long talkroom_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertTalk(TalkVO talkVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<TalkVO> sleectTalkDetail(Map<String, Long> map) {
		// TODO Auto-generated method stub
		return null;
	}

}