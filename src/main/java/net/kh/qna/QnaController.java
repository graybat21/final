package net.kh.qna;

import java.util.List;
import java.util.logging.Logger;

import javax.annotation.Resource;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class QnaController {
	@Resource(name = "qnaService")
	private QnaService qnaService;
	
	private static final Logger logger = (Logger) LoggerFactory.getLogger(QnaController.class);

	@RequestMapping(value = "/QnaList.gh", method = RequestMethod.GET)
	public String QnaList(Model model) throws Exception{
		List list = qnaService.qnaList();
		logger.info(list.toString());
	
		model.addAttribute("list",list);
	
		return "qnaList";
	}
	
}
