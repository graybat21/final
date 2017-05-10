package net.kh.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Resource(name="adminService")
	private AdminService adminService;
	
	

	
	
	@RequestMapping("/adminmemberList.gh")
	public ModelAndView memberList(AdminVO admin) throws Exception {
		
		ModelAndView mav = new ModelAndView("admin/memList/멤버리스트");
		
		List<AdminVO> memberList = adminService.memberList(admin);
		mav.addObject("memberList", memberList);
			
		return mav;
		
	}
	
	@RequestMapping("/adminmemberDelete.gh")
	public ModelAndView deleteMember(AdminVO admin) throws Exception {
		
		ModelAndView mav = new ModelAndView("redirect:admin/memList/멤버삭제");
		
		adminService.deleteMember(admin);
		
		return mav;
		
	}

}
