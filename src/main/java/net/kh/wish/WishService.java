package net.kh.wish;

import java.util.List;
import java.util.Map;



public interface WishService {
	
	Object inserWish(WishListVO wishList) throws Exception;

	List<Map<String, Object>> wishList(Map<String,Object> map) throws Exception;
	
	
}
