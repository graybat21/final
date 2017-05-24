package net.kh.reserve;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ReserveService {

	List<Map<String, Object>> selectSearchHappy() throws Exception;
	List<HashMap<String, Object>> getReserveInfoByMemNo(int mem_no) throws Exception;
}
