package net.kh.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.kh.host.HostVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Inject
	private ReviewService reviewService;

	@RequestMapping("/tabReview.gh")
	public ModelAndView review(HttpSession session) throws Exception {
		logger.info("ReviewController 구동");
		ModelAndView mav = new ModelAndView("guesthouse/review");

		// MemberVO member = (MemberVO) session.getAttribute("mem");

		// 특정 host를 선택하여 들어온 페이지에 리뷰 탭을 눌렀을때
		// host_no 정보를 넘긴다.
		HostVO host = (HostVO) session.getAttribute("host");

		logger.info(host.toString());
		List<Map<String, Object>> reviewList = reviewService.reviewList(host.getNo());

		logger.info(reviewList.toString());
		mav.addObject("reviewList", reviewList);

		return mav;
	}

}
