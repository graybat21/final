package net.kh.qna;

import java.util.List;
import net.kh.qna.QnaVO;
public interface QnaService {

	//글 리스트
	List<QnaVO> qnaList() throws Exception;
	
	//글쓰기
	int qnaWrite(QnaVO qnaVO) throws Exception;
	
	//글 상세보기
	QnaVO qnaView(int no) throws Exception;
}
