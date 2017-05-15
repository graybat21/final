package net.kh.notice;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.kh.dao.NoticeDao;
import net.kh.notice.NoticeService;
import net.kh.notice.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao noticeMapper;

	@Override
	@Transactional
	public List<NoticeVO> noticeList(HashMap<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return noticeMapper.noticeList(map);
	}

	//글쓰기
	@Override
	@Transactional
	public int noticeWrite(NoticeVO noticeVO) throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.noticeWrite(noticeVO);
	}
	
	//글 상세
	@Override
	@Transactional
	public NoticeVO noticeView(int no) throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.noticeView(no); 
	}

	//글수정
	@Override
	@Transactional
	public int noticeModify(NoticeVO noticeVO) throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.noticeModify(noticeVO);
	}

	//글삭제
	@Override
	@Transactional
	public int noticeDelete(int no) throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.noticeDelete(no);
	}

	@Override
	@Transactional
	public int selectListCnt() throws Exception {
		return noticeMapper.selectListCnt();
	}
	
}