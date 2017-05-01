package net.kh.mypage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/NoticeList.gh", method = RequestMethod.GET)
//	public String noticeList(Model model) {
//		logger.info("NoticeController - NoticeList.gh");
//		return "notice/noticeList/NOTICE";
//	}
	
}
