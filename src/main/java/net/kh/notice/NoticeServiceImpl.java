package net.kh.notice;

import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.kh.dao.NoticeDao;
import net.kh.notice.NoticeService;
import net.kh.notice.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeMapper;



	//글쓰기
	@Override
	public int noticeWrite(NoticeVO notice) throws Exception {
		return noticeMapper.noticeWrite(notice);
	}
//	
//	//글 하나 불러오기
//	@Override
//	public NoticeVO noticeView(int no) {
//		return sqlSessionTemplate.selectOne("notice.noticeView",no); 
//	}
//	
//	//조회수 증가
//	@Override
//	public int noticeUpdateReadcount(int no) {
//		return sqlSessionTemplate.update("notice.noticeUpdateReadcount",no); 
//	}
//
//	//제목으로 검색
//	@Override
//	public List<NoticeVO> noticeSearch0(String search) {
//		return sqlSessionTemplate.selectList("notice.noticeSearch0", "%"+search+"%"); 
//	}
//	
//	//내용으로 검색
//	@Override
//	public List<NoticeVO> noticeSearch1(String search) {
//		return sqlSessionTemplate.selectList("notice.noticeSearch1", "%"+search+"%"); 
//	}
//	
//	//작성자로 검색
//	@Override
//	public List<NoticeVO> noticeSearch2(String search) {
//		return sqlSessionTemplate.selectList("notice.noticeSearch2", "%"+search+"%"); 
//	}
//
//	//글수정
//	@Override
//	public int noticeModify(NoticeVO noticeVO) {
//		return sqlSessionTemplate.update("notice.noticeModify",noticeVO); 
//	}
//
//	//글삭제
//	@Override
//	public int noticeDelete(int no) {
//		return sqlSessionTemplate.update("notice.noticeDelete",no); 
//	}

	@Override
	@Transactional
	public List noticeList() throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.noticeList();
	}
}