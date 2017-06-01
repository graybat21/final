package net.kh.wish;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.kh.dao.WishDao;

@Service("wishService")
public class WishServiceImpl implements WishService {

	@Autowired
	private WishDao wishDao;
	
	@Override
	@Transactional

	public List<HashMap<String, Object>> wishList(int mem_no) throws Exception {

		return wishDao.wishList(mem_no);
	}
	@Override
	@Transactional
	public void insertWish(WishListVO wishList) throws Exception {
		// TODO Auto-generated method stub
		 wishDao.insertWish(wishList);
	}
	@Override
	@Transactional
	public void wishDelete(WishListVO wishList) throws Exception {
		// TODO Auto-generated method stub
		 wishDao.wishDelete(wishList);
	}
	@Override
	@Transactional
	public List<Map<String, Object>> wishList1(WishListVO wishVO) throws Exception {
		// TODO Auto-generated method stub
		return wishDao.wishList1(wishVO);
	}
	

	
}
