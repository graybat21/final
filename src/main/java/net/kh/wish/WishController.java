package net.kh.wish;

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

/**
 * Handles requests for the application home page.
 */
@Controller
public class WishController {
	
	private static final Logger logger = LoggerFactory.getLogger(WishController.class);
	
	@Inject
	private WishService wishService;
	ModelAndView mav = new ModelAndView();
	
	@RequestMapping("/wishAdd.gh")
	public ModelAndView wishAddMan(@RequestParam(value="session_mem_no") int mem_no,
								   @RequestParam(value="session_host_no") int host_no,
								   WishListVO wishList,HttpSession session) throws Exception{
/*		Integer mem_no = (Integer) session.getAttribute("session_no");
		String a =  String.valueOf(session.getAttribute("host_no"));
		Integer host_no = Integer.parseInt(a);
*/		if(mem_no == 0){
			mav.setViewName("mypage/wishFail/오류");
					return mav;
		}
		wishList.setHost_no(host_no);
		wishList.setMem_no(mem_no);
			
		wishService.insertWish(wishList);
		mav.addObject("host_no",host_no);
		mav.addObject("list",wishList);
		mav.setViewName("redirect:/wishList.gh");	
		return mav;
		
		
		
	}
	
	@RequestMapping("/wishList.gh")
	public String wishListHo(Map<String,Object> map,Model model) throws Exception{
	List<Map<String,Object>> list = wishService.wishList(map);
	logger.info(list.toString());
	model.addAttribute("list", list);
	return "mypage/wish/찜목록";
	
		
	}
	@RequestMapping("/wishDelete.gh")
	public ModelAndView wishListBye(@RequestParam(value="session_mem_no") int mem_no,@RequestParam(value="session_host_no") int host_no,
			HttpSession session, WishListVO wishList) throws Exception{
/*	Integer mem_no =(Integer) session.getAttribute("session_mem_no");
	int host_no =(int) session.getAttribute("session_host_no");
	*/
	wishList.setHost_no(host_no);
	wishList.setMem_no(mem_no);
	wishService.wishDelete(wishList);
	mav.addObject("list",wishList);
	mav.setViewName("redirect:/wishList.gh");
	return mav;
	}

}
