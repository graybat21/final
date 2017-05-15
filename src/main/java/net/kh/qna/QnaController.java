package net.kh.qna;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.kh.utils.PageMaker;

/**
 * Handles requests for the application home page.
 */
@Controller
public class QnaController {
	@Resource(name = "qnaService")
	private QnaService qnaService;
	ModelAndView mav = new ModelAndView();


	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	// 리스트
	@RequestMapping(value = "/qnaList.gh")
	public String qnaListMan(PageMaker pagemaker, Model model) throws Exception {

		int page = 1;
		int totalCnt = 0;
		int countPerPage = 5;
		int countPerPaging = 5;
		
		page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);

		totalCnt = qnaService.selectListCnt(); // DB연동_ 총 갯수 구해오기
		pagemaker.setCount(totalCnt, countPerPaging);

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("first", first);
		map.put("last", last);
		List<QnaVO> list = qnaService.qnaList(map);

		model.addAttribute("qnaList", list);
		model.addAttribute("qnaPageMaker", pagemaker);

		return "qna/qnaList/QNA";
	}

	// 글쓰기
	@RequestMapping(value = "/qnaWrite.gh", method = RequestMethod.GET)
	public ModelAndView qnaWriteBoy(QnaVO qnaVo) throws Exception {
		mav.setViewName("qna/qnaWrite/게'하 QnA문의하기");
		return mav;
	}

	@RequestMapping(value = "/qnaWrite.gh", method = RequestMethod.POST)
	public String qnaWriteMan(QnaVO qnaVO) throws Exception {
		qnaService.qnaWrite(qnaVO);
		return "redirect:/qnaList.gh";
	}

	// 상세보기
	@RequestMapping("/qnaView.gh")
	public ModelAndView qnaViewGirl(int no) throws Exception {
		QnaVO qnaVO = qnaService.qnaView(no);
		mav.addObject("no", no);
		mav.addObject("qnaVO", qnaVO);
		mav.setViewName("qna/qnaView/문의하기내용");
		return mav;

	}

	// 수정하기
	@RequestMapping(value = "/qnaModify.gh", method = RequestMethod.GET)
	public ModelAndView qnaViewMama(int no) throws Exception {
		QnaVO qnaVO = qnaService.qnaView(no);
		mav.addObject("no", no);
		mav.addObject("qnaVO", qnaVO);
		mav.setViewName("qna/qnaModify/문의하기수정");
		return mav;
	}

	@RequestMapping(value = "/qnaModify.gh", method = RequestMethod.POST)
	public ModelAndView qnaModifyWoman(QnaVO qnaVO) throws Exception {
		logger.info(qnaVO.toString());
		qnaService.qnaModify(qnaVO);
		mav.addObject("qnaVO", qnaVO);
		mav.setViewName("redirect:/qnaList.gh");
		return mav;
	}

	// 글 삭제
	@RequestMapping("qnaDelete.gh")
	public ModelAndView qnaDeletePapa(int no) throws Exception {
		qnaService.qnaDelete(no);
		mav.setViewName("redirect:/qnaList.gh");
		return mav;
	}
	
	//답변글쓰기
	@RequestMapping(value="qnaRepl.gh",method=RequestMethod.GET)
	public ModelAndView qnaReplBrother(QnaVO qnaVO,int no) throws Exception{
		qnaService.qnaView(no);
		qnaVO.getSubject();
		qnaVO.setRestep(1);
		mav.addObject("QnaVO",qnaVO);
		mav.setViewName("qna/qnaRepl/답글작성");
		return mav;
	}
	@RequestMapping(value="qnaRepl.gh",method=RequestMethod.POST)
	public ModelAndView qnaReplSister(QnaVO qnaVO,int no ) throws Exception{
		qnaVO.setRef(no);
		qnaVO.setRestep(1);
		qnaVO.getSubject().replaceAll("\r\n", "<br />");
		logger.info(qnaVO.toString());
		qnaService.qnaRepl(qnaVO);
		mav.setViewName("redirect:/qnaList.gh");
		return mav;
	}

}
