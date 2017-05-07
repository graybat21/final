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
	public List qnaList() throws Exception{
		// TODO Auto-generated method stub
		return qnaDao.QnaList();
	}
	

}
