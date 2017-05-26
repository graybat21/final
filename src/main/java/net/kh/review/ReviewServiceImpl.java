package net.kh.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.kh.dao.ReviewDao;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao mapper;


	@Override
	public void writeReview(ReviewVO review) throws Exception {
		mapper.writeReview(review);
	}


	@Override
	@Transactional
	public List<Map<String, Object>> reviewList(int no) throws Exception {
		return mapper.reviewList(no);
	}


	@Override
	public void updateReviewCommentByReviewNo(ReviewVO review) throws Exception {
		mapper.updateReviewCommentByReviewNo(review);
	}


	@Override
	public boolean hasReview(int host_no) throws Exception {
		return mapper.hasReview(host_no);
	}


	@Override
	public int averageStar(int host_no) throws Exception {
		return mapper.averageStar(host_no);
	}
	
}
