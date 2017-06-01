package net.kh.wish;

import java.util.List;
import java.util.Map;



public interface WishService {
	//李���湲�
	void insertWish(WishListVO wishList) throws Exception;
	//李�紐⑸�
	List<Map<String, Object>> wishList(int mem_no) throws Exception;
	//李�����
	void wishDelete(WishListVO wishList) throws Exception;
	
	List<Map<String, Object>> wishList1(WishListVO wishVO) throws Exception;

	
}
