package net.kh.dao;

import java.util.HashMap;
import java.util.List;

import net.kh.qna.QnaVO;

public interface QnaDao {

	// 글 목록
	List<QnaVO> qnaList(HashMap<String, Object> map) throws Exception;

	List<QnaVO> myqnaList(HashMap<String, Object> map) throws Exception;
	// 글쓰기
	int qnaWrite(QnaVO qnaVO) throws Exception;

	// 글 상세보기
	QnaVO qnaView(int no) throws Exception;

	// 글 수정
	int qnaModify(QnaVO qnaVO) throws Exception;

	// 글삭제
	int qnaDelete(int no) throws Exception;

	// 글 전체 개수
	int selectListCnt() throws Exception;
	int selectListCntByName(String name) throws Exception;

	// 답변글쓰기
	int qnaRepl(QnaVO qnaVO) throws Exception;
	
	
	//restep
		int updateRef(QnaVO qnaVO) throws Exception;
		
		int refMax() throws Exception;
}
