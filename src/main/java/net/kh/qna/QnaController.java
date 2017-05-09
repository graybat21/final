package net.kh.qna;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class QnaController {
	@Resource(name = "qnaService")
	private QnaService qnaService;
	ModelAndView mav = new ModelAndView();
	
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	//리스트
	@RequestMapping(value = "/qnaList.gh")
	public String qnaListMan(Model model) throws Exception{
		List<QnaVO> list = qnaService.qnaList();
		logger.info(list.toString());
	
		model.addAttribute("list",list);
	
		return "qna/qnaList/QNA";
	}
	//글쓰기
	@RequestMapping(value="/qnaWrite.gh",method=RequestMethod.GET)
	public ModelAndView qnaWriteBoy(HttpSession session,QnaVO qnaVo) throws Exception{
		mav.setViewName("qna/qnaWrite/게'하 QnA문의하기");
		return mav;
	}
	@RequestMapping(value="/qnaWrite.gh",method=RequestMethod.POST)
	public String qnaWriteMan(QnaVO qnaVO) throws Exception{
		qnaVO.setRestep(0);
		qnaService.qnaWrite(qnaVO);
		return "redirect:/qnaList.gh";
	}
	//상세보기
	@RequestMapping(value="/qnaView",method=RequestMethod.GET)
	public ModelAndView qnaViewGirl(int no) throws Exception{
		QnaVO qnaVO = qnaService.qnaView(no);
		mav.addObject("no",no);
		mav.setViewName("qna/qnaView/문의하기내용");
		return mav;
	
	}
}
