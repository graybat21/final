package net.kh.notice;

import java.util.HashMap;
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

import net.kh.qna.QnaVO;
import net.kh.utils.PageMaker;

@Controller
public class NoticeController {

	@Resource(name = "noticeService")
	private NoticeService noticeService;
	ModelAndView mav = new ModelAndView();

	//리스트
	@RequestMapping(value="/noticeList.gh")
	public String noticeList(PageMaker pagemaker,Model model) throws Exception{
		int page = 1;
		int totalCnt = 0;
		int countPerPage = 5;
		int countPerPaging = 5;
		
		page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);
		
		totalCnt = noticeService.selectListCnt(); // DB연동_ 총 갯수 구해오기
		pagemaker.setCount(totalCnt, countPerPaging);
		
		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("first", first);
		map.put("last", last);
		List<NoticeVO> list = noticeService.noticeList(map);
		
		model.addAttribute("noticeList", list);
		model.addAttribute("noticePageMaker", pagemaker);

		return "notice/noticeList/공지사항";
	}

	//공지사항글쓰기폼
	@RequestMapping(value="/noticeWrite.gh", method=RequestMethod.GET)
	public ModelAndView noticeForm(HttpSession session, NoticeVO noticeVO) throws Exception {

		mav.setViewName("notice/noticeForm/글쓰기폼");
		return mav;
	}
	
	//공지작성
	@RequestMapping(value = "/noticeWrite.gh", method = RequestMethod.POST)
	public String noticeWrite(NoticeVO noticeVO) throws Exception {

		noticeService.noticeWrite(noticeVO);
		return "redirect:/noticeList.gh";
	}
	
	// 상세보기
	@RequestMapping(value = "/noticeView.gh", method = RequestMethod.GET)
	public ModelAndView noticeView(int no) throws Exception {
		NoticeVO noticeVO = noticeService.noticeView(no);
		mav.addObject("no", no);
		mav.addObject("noticeVO", noticeVO);
		mav.setViewName("notice/noticeView/공지상세");
		return mav;

	}
	
	// 수정하기
	@RequestMapping(value = "/noticeModify.gh", method = RequestMethod.GET)
	public ModelAndView noticeModify(int no) throws Exception {
		NoticeVO noticeVO = noticeService.noticeView(no);
		mav.addObject("no", no);
		mav.addObject("noticeVO", noticeVO);
		mav.setViewName("notice/noticeModify/공지수정");
		return mav;
	}
	
	@RequestMapping(value = "/noticeModify.gh", method = RequestMethod.POST)
	public ModelAndView noticeModifySuccess(NoticeVO noticeVO) throws Exception {
		
		noticeService.noticeModify(noticeVO);
		mav.addObject("noticeVO", noticeVO);
		mav.setViewName("redirect:/noticeList.gh");
		return mav;
	}
	
	// 글 삭제
	@RequestMapping("noticeDelete.gh")
	public ModelAndView noticeDelete(int no) throws Exception {
		noticeService.noticeDelete(no);
		mav.setViewName("redirect:/noticeList.gh");
		return mav;
	}
}