package net.kh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ReserveDao {

	// ReviewVO reviewList(int no) throws Exception;

	public List<Map<String, Object>> selectSearchHappy() throws Exception;
	public List<HashMap<String, Object>> getReserveInfoByMemNo(int mem_no) throws Exception;
	public List<HashMap<String, Object>> getReserveInfoByHostNo(int host_no) throws Exception;
	public List<Integer> validSearch(HashMap<String, Object> map) throws Exception;
}
