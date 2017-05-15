package net.kh.dao;

import java.util.List;
import java.util.Map;

import net.kh.wish.WishListVO;

public interface WishDao {
	
	Object inserWish(WishListVO wishList) throws Exception;

	List<Map<String, Object>> wishList(Map<String,Object> map) throws Exception;
}
