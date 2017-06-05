package net.kh.qna;

import java.util.HashMap;
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

	// 由ъ�ㅽ��
	@RequestMapping(value = "/qnaList.gh")
	public String qnaListMan(PageMaker pagemaker, Model model) throws Exception {

		int page = 1;
		int totalCnt = 0;
		int countPerPage = 10;
		int countPerPaging = 5;

		page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);

		totalCnt = qnaService.selectListCnt(); // DB�곕��_ 珥� 媛��� 援ы�댁�ㅺ린
		
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("first", first);
		map.put("last", last);
		List<QnaVO> list = qnaService.qnaList(map);

		model.addAttribute("qnaList", list);
		model.addAttribute("qnaPageMaker", pagemaker);

		return "qna/qnaList/QNA"; // qna/qnaList
	}

	// 내가쓴QNA+답변
	@RequestMapping(value = "/myqnaList.gh")
	public String myqnaListMan(PageMaker pagemaker, Model model, HttpServletRequest request) throws Exception {
		String name;
		HttpSession session = request.getSession();
		if (session.getAttribute("session_mem_name") != null) {
			name = (String) session.getAttribute("session_mem_name");
		} else
			name = (String) session.getAttribute("session_host_name");
		

		int page = 1;
		int totalCnt = 0;
		int countPerPage = 10;
		int countPerPaging = 5;

		page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);

		totalCnt = qnaService.selectListCntByName(name); // DB에서작성자 이름+해당답변 리스트의 갯수
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("first", first);
		map.put("last", last);
		map.put("name", name);


		List<QnaVO> list = qnaService.myqnaList(map);

		model.addAttribute("qnaList", list);
		model.addAttribute("qnaPageMaker", pagemaker);

		return "mypage/myqnaList/MYQNA";
	}

	// 湲��곌린
	@RequestMapping(value = "/qnaWrite.gh", method = RequestMethod.GET)
	public ModelAndView qnaWriteBoy(QnaVO qnaVO) throws Exception {
		mav.setViewName("qna/qnaWrite/寃�'�� QnA臾몄����湲�");
		mav.addObject("qnaVO", qnaVO); //異�媛�
		return mav;
	}

	@RequestMapping(value = "/qnaWrite.gh", method = RequestMethod.POST)
	public String qnaWriteMan(QnaVO qnaVO) throws Exception {

		int newRef = this.qnaService.refMax();
		qnaVO.setRef(newRef);
		
		qnaService.qnaWrite(qnaVO);
		return "redirect:/myqnaList.gh";
		
	}

	// ���몃낫湲�
	@RequestMapping("/qnaView.gh")
	public ModelAndView qnaViewGirl(int no) throws Exception {
		QnaVO qnaVO = qnaService.qnaView(no);
		mav.addObject("no", no);
		mav.addObject("qnaVO", qnaVO);
		mav.setViewName("qna/qnaView/臾몄����湲곕�댁��");
		return mav;

	}

	// ������湲�
	@RequestMapping(value = "/qnaModify.gh", method = RequestMethod.GET)
	public ModelAndView qnaViewMama(int no) throws Exception {
		QnaVO qnaVO = qnaService.qnaView(no);
		mav.addObject("no", no);
		mav.addObject("qnaVO", qnaVO);
		mav.setViewName("qna/qnaModify/臾몄����湲곗����");
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

	// 湲� ����
	@RequestMapping("qnaDelete.gh")
	public ModelAndView qnaDeletePapa(int no) throws Exception {
		qnaService.qnaDelete(no);
		mav.setViewName("redirect:/qnaList.gh");
		return mav;
	}

	// �듬�湲��곌린
	@RequestMapping(value = "qnaRepl.gh", method = RequestMethod.GET)
	public ModelAndView qnaReplBrother(QnaVO qnaVO, int no) throws Exception {
		qnaService.qnaView(no);
		qnaVO.getSubject();
		qnaVO.setRestep(1);
		mav.addObject("QnaVO", qnaVO);
		mav.setViewName("qna/qnaRepl/�듦�����");
		return mav;
	}

	@RequestMapping(value = "qnaRepl.gh", method = RequestMethod.POST)
	public ModelAndView qnaReplSister(QnaVO qnaVO, int no) throws Exception {
		qnaVO.setRef(no);
		qnaVO.setRestep(1);
		qnaVO.getSubject().replaceAll("\r\n", "<br />");
		logger.info(qnaVO.toString());
		qnaService.qnaRepl(qnaVO);
		mav.setViewName("redirect:/qnaList.gh");
		return mav;
	}
	
	//異�媛�
	@RequestMapping(value = "updateRef.gh")
	public ModelAndView qnaRestep(QnaVO qnaVO, int no) throws Exception {

		mav.setViewName("redirect:/qnaList.gh");

		return mav;
	}

}
