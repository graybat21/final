package net.kh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.kh.wish.WishListVO;

public interface WishDao {
	
	void insertWish(WishListVO wishList) throws Exception;


	List<HashMap<String, Object>> wishList(int mem_no) throws Exception;

	void wishDelete(WishListVO wishList) throws Exception;
	
}
 