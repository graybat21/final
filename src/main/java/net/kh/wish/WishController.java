package net.kh.wish;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.omg.PortableInterceptor.SUCCESSFUL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView wishAddMan(HttpSession session,WishListVO wishList) throws Exception{
		String mem_no = (String) session.getAttribute("session_mem_no");
		int host_no =(int) session.getAttribute("session_host_no") ;
		
		if(mem_no == null){
			mav.setViewName("mypage/wishFail/오류");
					return mav;
		}
		wishList.setHost_no(host_no );
		wishList.setMem_no(Integer.parseInt(mem_no));
			
		wishService.inserWish(wishList);
		mav.addObject("host_no",host_no);
		mav.addObject("wishList",wishList);
		mav.setViewName("redirect:/host/hostView.gh");	
		return mav;
		
		
		
	}
	
	@RequestMapping("/wishList.gh")
	public ModelAndView wishListHo(Map<String,Object> map) throws Exception{
	List<Map<String,Object>> list = wishService.wishList(map);
	mav.addObject("list",list);
	return mav;
	
		
	}

//	addMyWish()
//	deleteMyWish()

}
