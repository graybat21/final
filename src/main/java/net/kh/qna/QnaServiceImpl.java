package net.kh.qna;

import java.util.HashMap;
import java.util.List;

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
	public List<QnaVO> qnaList(HashMap<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		return qnaDao.qnaList(map);
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

	@Override
	@Transactional
	public int qnaModify(QnaVO qnaVO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDao.qnaModify(qnaVO);
	}

	@Override
	@Transactional
	public int qnaDelete(int no) throws Exception {
		// TODO Auto-generated method stub
		return qnaDao.qnaDelete(no);
	}

	@Override
	public int selectListCnt() throws Exception {
		return qnaDao.selectListCnt();
	}

}
