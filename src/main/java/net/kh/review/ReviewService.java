package net.kh.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {

	// public ReviewVO reviewList(int no) throws Exception;
	public List<Map<String, Object>> reviewList(int no) throws Exception;
}
