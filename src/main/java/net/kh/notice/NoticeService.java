package net.kh.notice;

import java.util.HashMap;
import java.util.List;

public interface NoticeService {

	// 글목록
	List<NoticeVO> noticeList(HashMap<String, Object> map) throws Exception;

	// 글쓰기
	int noticeWrite(NoticeVO noticeVO) throws Exception;

	// 글 상세보기
	NoticeVO noticeView(int no) throws Exception;

	// 글수정
	int noticeModify(NoticeVO noticeVO) throws Exception;

	// 글삭제
	int noticeDelete(int no) throws Exception;

	// 글 전체 개수
	int selectListCnt() throws Exception;

}