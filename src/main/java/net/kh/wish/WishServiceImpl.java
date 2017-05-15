package net.kh.wish;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import net.kh.dao.WishDao;


public class WishServiceImpl implements WishService {

	@Autowired
	private WishDao wishDao;
	
	@Override
	@Transactional
	public List<Map<String, Object>> wishList(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		return wishDao.wishList(map);
	}
	@Override
	@Transactional
	public Object inserWish(WishListVO wishList) throws Exception {
		// TODO Auto-generated method stub
		return wishDao.inserWish(wishList);
	}
	
}
