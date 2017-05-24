package net.kh.qna;

import java.util.HashMap;
import java.util.List;

public interface QnaService {

	// 글 리스트
	List<QnaVO> qnaList(HashMap<String, Object> map) throws Exception;
	
	// 내가 쓴 글목록
	List<QnaVO> myqnaList(HashMap<String, Object> map) throws Exception;

	// 글쓰기
	int qnaWrite(QnaVO qnaVO) throws Exception;

	// 글 상세보기
	QnaVO qnaView(int no) throws Exception;

	// 글 수정하기
	int qnaModify(QnaVO qnaVO) throws Exception;

	// 글 삭제
	int qnaDelete(int no) throws Exception;
	// 글 전체 개수
	int selectListCnt() throws Exception;
	int selectListCntByName(String name) throws Exception;
	//답변글쓰기
	int qnaRepl(QnaVO qnaVO) throws Exception;
}
