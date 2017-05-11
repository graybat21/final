package net.kh.notice;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	@Resource
	private NoticeService noticeService;

	//리스트
	@RequestMapping(value="/notice/noticeList.gh", method=RequestMethod.GET)
	public String noticeList(Model model) throws Exception{
		
		List list = noticeService.noticeList();

	    model.addAttribute("noticeList", list);

		return "notice/noticeList/공지사항";
	}

	//공지사항글쓰기폼
	@RequestMapping(value="/notice/noticeWrite.gh", method=RequestMethod.GET)
	public ModelAndView noticeForm(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeVO", new NoticeVO());
		mav.setViewName("notice/noticeForm/글쓰기폼");
		return mav;
	}
	
	//怨듭��궗�빆 湲��벐湲�
	@RequestMapping(value="/notice/noticeWrite.gh", method=RequestMethod.POST)
	public ModelAndView noticeWrite(@ModelAttribute("noticeVO") NoticeVO noticeVO, BindingResult result, 
			HttpServletRequest request, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		new NoticeValidator().validate(noticeVO, result);
		
		if(result.hasErrors()) {
			mav.setViewName("notice/noticeForm/123213");
			return mav;
		}
		
		String content = noticeVO.getContent().replaceAll("\r\n", "<br />");
		noticeVO.setContent(content);
		
		noticeService.noticeWrite(noticeVO);
		
		mav.addObject("noticeVO", noticeVO);
		mav.setViewName("redirect:notice/noticeList/124213123");
		
		return mav;
	}
/*	
	//怨듭��궗�빆 �궘�젣
	@RequestMapping("/notice/noticeDelete.gh")
	public ModelAndView noticeDelete(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		noticeService.noticeDelete(no);
		mav.setViewName("redirect:notice/noticeList/怨듭��궗�빆");
		
		return mav;	
	}
	
	//怨듭��궗�빆 �닔�젙�뤌
	@RequestMapping("/notice/noticeModify.gh")
	public ModelAndView noticeModifyForm(@ModelAttribute("noticeVO") NoticeVO noticeVO, BindingResult result, HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		noticeVO = noticeService.noticeView(noticeVO.getNo());
		
		String content = noticeVO.getContent().replaceAll("<br />", "\r\n");
		noticeVO.setContent(content);
		
		mav.addObject("noticeVO", noticeVO);
		mav.setViewName("notice/noticeModify/怨듭��닔�젙");
		
		return mav;	
	}
	
	//怨듭��궗�빆 �닔�젙
	@RequestMapping("/notice/noticeModifySuccess.gh")
	public ModelAndView noticeModify(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView("redirect:notice/noticeView/怨듭��긽�꽭");
		
		String content = noticeVO.getContent().replaceAll("\r\n", "<br />");
		noticeVO.setContent(content);
		
		noticeService.noticeModify(noticeVO);
		
		mav.addObject("no", noticeVO.getNo());
		
		return mav;	
	}*/
}
