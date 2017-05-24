package net.kh.review;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
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
	public ModelAndView review(HttpSession session, @RequestParam(value="host_no") int host_no) throws Exception {
		logger.info("ReviewController 구동");
		ModelAndView mav = new ModelAndView("guesthouse/review");

		List<Map<String, Object>> reviewList = reviewService.reviewList(host_no);
		List<RoomVO> roomList= roomService.getRoomInfoByHostNo(host_no);
		logger.info(reviewList.toString());
		mav.addObject("host_no", host_no);
		mav.addObject("reviewList", reviewList);
		mav.addObject("roomList", roomList);

		return mav;
	}
	
	@RequestMapping("/writeReview.gh")
	public ModelAndView writeReview(ReviewVO review)throws Exception{
		ModelAndView mav=new ModelAndView("redirect:/ghDetail.gh?tab=3");
		
		reviewService.writeReview(review);
		mav.addObject("host_no", review.getHost_no());
		return mav;
	}

}
