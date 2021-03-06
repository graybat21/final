package net.kh.dao;

import java.util.HashMap;
import java.util.List;

import net.kh.notice.NoticeVO;

public interface NoticeDao {
	
	//list
	List<NoticeVO> noticeList(HashMap<String, Object> map) throws Exception;
	//쓰기
	int noticeWrite(NoticeVO noticeVO) throws Exception;
	
	// 글 상세보기
	NoticeVO noticeView(int no) throws Exception;
	
	// 글 수정
	int noticeModify(NoticeVO noticeVO) throws Exception;

	// 글삭제
	int noticeDelete(int no) throws Exception;
	// 글 전체 개수
	int selectListCnt() throws Exception;

}
