package net.kh.wish;

import java.util.List;
import java.util.Map;



public interface WishService {
	//찜하기
	void insertWish(WishListVO wishList) throws Exception;
	//찜목록
	List<Map<String, Object>> wishList(Map<String,Object> map) throws Exception;
	//찜삭제
	void wishDelete(WishListVO wishList) throws Exception;
	
	
}
