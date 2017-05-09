package net.kh.dao;

import java.util.List;

import net.kh.qna.QnaVO;

public interface QnaDao {
	
	//글 목록
List<QnaVO> qnaList() throws Exception;

  //글쓰기
int qnaWrite(QnaVO qnaVO) throws Exception;

//글 상세보기
QnaVO qnaView(int no) throws Exception;
}
