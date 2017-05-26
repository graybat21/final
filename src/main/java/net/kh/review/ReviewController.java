package net.kh.review;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.kh.room.RoomService;
import net.kh.room.RoomVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Inject
	private ReviewService reviewService;
	@Inject
	private RoomService roomService;

	@RequestMapping("/tabReview.gh")
	public ModelAndView review(HttpSession session, @RequestParam(value = "host_no") int host_no) throws Exception {
		logger.info("ReviewController 구동");
		ModelAndView mav = new ModelAndView("guesthouse/review");

		// 별점 평점 구해서 전달,
		System.out.println(host_no);
		boolean hasReview = reviewService.hasReview(host_no);
		System.out.println(hasReview);
		if(hasReview){
			int averageStar = reviewService.averageStar(host_no);
			int classStar = Math.round(averageStar / (float) 5) * 5;
			mav.addObject("averageStar", averageStar / 5); // 10점만점
			mav.addObject("classStar", classStar);
		}
		List<Map<String, Object>> reviewList = reviewService.reviewList(host_no);
		List<RoomVO> roomList = roomService.getRoomInfoByHostNo(host_no);
		logger.info(reviewList.toString());
		mav.addObject("host_no", host_no);
		mav.addObject("reviewList", reviewList);
		mav.addObject("roomList", roomList);

		return mav;
	}

	@RequestMapping("/writeReview.gh")
	public ModelAndView writeReview(ReviewVO review) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/ghDetail.gh?tab=3");

		if (review.getStar() > 10) {
			review.setStar(50);
		} else {
			review.setStar(review.getStar() * 5);
		}
		reviewService.writeReview(review);
		mav.addObject("host_no", review.getHost_no());
		return mav;
	}

	@RequestMapping("/writeReviewComment.gh")
	public ModelAndView writeReviewComment(ReviewVO review) throws Exception {
		ModelAndView mav = new ModelAndView("forward:/ghDetail.gh?tab=3");
		logger.info(review.toString());
		reviewService.updateReviewCommentByReviewNo(review);
		// mav.addObject("host_no", review.getHost_no());

		return mav;
	}

	@RequestMapping("/insertReviewComment.gh")
	public String insertReviewComment(@RequestParam(value = "no", required = false) int no,
			@RequestParam(value = "hostno", required = false) int hostno, Model model) throws Exception {
		model.addAttribute("no", no);
		model.addAttribute("hostno", hostno);
		return "guesthouse/reviewComment";
	}

}
