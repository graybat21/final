package net.kh.qna;

import java.util.List;

public interface QnaService {

	// 글 리스트
	List<QnaVO> qnaList() throws Exception;

	// 글쓰기
	int qnaWrite(QnaVO qnaVO) throws Exception;

	// 글 상세보기
	QnaVO qnaView(int no) throws Exception;

	// 글 수정하기
	int qnaModify(QnaVO qnaVO) throws Exception;

	// 글 삭제
	int qnaDelete(int no) throws Exception;
	
	//답변글쓰기
	int qnaRepl(QnaVO qnaVO) throws Exception;
}
