package net.kh.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ReviewService {

	public void writeReview(ReviewVO review) throws Exception;

	public List<Map<String, Object>> reviewList(int no) throws Exception;
	public void updateReviewCommentByReviewNo(ReviewVO review) throws Exception;
	public boolean hasReview(int host_no) throws Exception;
	public int averageStar(int host_no) throws Exception;
	public List<HashMap<String,Object>> myMessage(ReviewVO review) throws Exception;
	public void myMessage2(int no) throws Exception;
	
	public boolean selectREF(String writer) throws Exception;
}
