package net.kh.qna;

import java.util.List;
import net.kh.qna.QnaVO;
public interface QnaService {

	//글 리스트
	List qnaList() throws Exception;
}
