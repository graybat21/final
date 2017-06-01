package net.kh.wish;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class WishController {

	private static final Logger logger = LoggerFactory.getLogger(WishController.class);

	@Inject
	private WishService wishService;
	ModelAndView mav = new ModelAndView();
	
@ResponseBody
	@RequestMapping("/wishAdd.gh")
	public int wishAddMan(@RequestParam(value="mem_no") int mem_no,@RequestParam("host_no") int host_no, WishListVO wishList)
			throws Exception {
	
	
		System.out.println(host_no);
		wishList.setHost_no(host_no);
		wishList.setMem_no(mem_no);

		wishService.insertWish(wishList);
		
		return 1;

	}

	@RequestMapping("/wishList.gh")
	public String wishListHo(HttpSession session, Model model) throws Exception {
		int mem_no=(int) session.getAttribute("session_mem_no");
		System.out.println(mem_no);
		List<HashMap<String, Object>> list = wishService.wishList(mem_no);
		logger.info(list.toString());
		model.addAttribute("list", list);
		return "mypage/wish/찜목록";

	}

	@RequestMapping("/wishDelete.gh")
	public ModelAndView wishListBye(@RequestParam String mem_no, @RequestParam String host_no) throws Exception {

		WishListVO wishList = new WishListVO();
		wishList.setHost_no(Integer.parseInt(host_no));
		wishList.setMem_no(Integer.parseInt(mem_no));
		wishService.wishDelete(wishList);
		mav.addObject("list", wishList);
		mav.setViewName("redirect:/wishList.gh");
		return mav;
	}

}
