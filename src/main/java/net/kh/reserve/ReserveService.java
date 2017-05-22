package net.kh.reserve;

import java.util.List;
import java.util.Map;

public interface ReserveService {

	List<Map<String, Object>> selectSearchHappy() throws Exception;
}
