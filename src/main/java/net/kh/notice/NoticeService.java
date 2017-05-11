package net.kh.notice;

import java.util.List;

public interface NoticeService {

	//글목록
	 List noticeList() throws Exception;

	//글쓰기
	public int noticeWrite(NoticeVO notice) throws Exception;

	//글 상세보기
//	NoticeVO noticeView(int no);
	
	//조회수 증가
//	int noticeUpdateReadcount(int no);

	//검색 (0=제목, 1=내용, 2=이름)
//	List<NoticeVO> noticeSearch0(String search);
//	List<NoticeVO> noticeSearch1(String search);
//	List<NoticeVO> noticeSearch2(String search);
	
	//글수정
//	int noticeModify(NoticeVO noticeVO);

	//글삭제
//	int noticeDelete(int no);
	
}