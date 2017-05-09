package net.kh.qna;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import net.kh.dao.QnaDao;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaDao qnaDao;


	@Override
	@Transactional
	public List<QnaVO> qnaList() throws Exception{
		// TODO Auto-generated method stub
		return qnaDao.qnaList();
	}


	@Override
	@Transactional
	public int qnaWrite(QnaVO qnaVO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDao.qnaWrite(qnaVO);
	}


	@Override
	@Transactional
	public QnaVO qnaView(int no) throws Exception {
		// TODO Auto-generated method stub
		return qnaDao.qnaView(no);
	}
	

}
