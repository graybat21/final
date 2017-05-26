package net.kh.dao;

import java.util.List;
import java.util.Map;

import net.kh.review.ReviewVO;

public interface ReviewDao {

	public void writeReview(ReviewVO review) throws Exception;

	public List<Map<String, Object>> reviewList(int no) throws Exception;

	public void updateReviewCommentByReviewNo(ReviewVO review) throws Exception;

	public boolean hasReview(int host_no) throws Exception;
	public int averageStar(int host_no) throws Exception;
}
