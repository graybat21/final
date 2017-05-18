package net.kh.dao;

import java.util.List;
import java.util.Map;

public interface ReviewDao {

//	ReviewVO reviewList(int no) throws Exception;
	
	public List<Map<String, Object>> reviewList(int no) throws Exception;
}
