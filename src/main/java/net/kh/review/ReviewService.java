package net.kh.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {

	public void writeReview(ReviewVO review) throws Exception;

	public List<Map<String, Object>> reviewList(int no) throws Exception;
	public void updateReviewCommentByReviewNo(ReviewVO review) throws Exception;
	public boolean hasReview(int host_no) throws Exception;
	public int averageStar(int host_no) throws Exception;
}
