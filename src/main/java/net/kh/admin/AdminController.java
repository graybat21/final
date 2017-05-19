package net.kh.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.kh.discount.DiscountVO;
import net.kh.host.HostVO;
import net.kh.member.MemberVO;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Resource(name="adminService")
	private AdminService adminService;
	
	
	// 관리자의 회원관리 - 회원 목록
	@RequestMapping("/adminmemberList.gh")
	public ModelAndView memberList(MemberVO member) throws Exception {
											// memList.jsp 의미
		ModelAndView mav = new ModelAndView("memList");
		
		List<MemberVO> memberList = adminService.memberList(member);
		mav.addObject("memberList", memberList);
			
		return mav;
		
	}
	
	// 관리자의 회원관리 - 회원 강제 탈퇴
	@RequestMapping("/adminmemberDelete.gh")
	public ModelAndView deleteMember(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String no = request.getParameter("no");
		adminService.deleteMember(Integer.parseInt(no));
		mav.setViewName("redirect:/adminmemberList.gh");
		return mav;
		
	}
	
	// 관리자의 호스트관리 - 호스트 목록
	@RequestMapping("/adminhostList.gh")
	public ModelAndView hostList(HostVO host) throws Exception {
											//hostList.jsp 의미
		ModelAndView mav = new ModelAndView("hostList");
		List<HostVO> hostList = adminService.hostList(host);
		mav.addObject("hostList", hostList);
		
		return mav;
	}
	
	//관리자의 호스트관리 - 호스트 강제 탈퇴
	@RequestMapping("/adminhostDelete.gh")
	public ModelAndView deleteHost(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String no = request.getParameter("no");
		adminService.deleteHost(Integer.parseInt(no));
		mav.setViewName("redirect:/adminhostList.gh");
		
		return mav;
	}
	
	// 관리자의 게하 방 관리
	@RequestMapping("/adminRoomList.gh")
	public ModelAndView adminRoomList(AdminVO admin) throws Exception {
											// roomList.jsp
		ModelAndView mav = new ModelAndView("roomList");
		
		List<AdminVO> adminRoomList = adminService.adminRoomList(admin);
		//logger.info(adminRoomList.toString());
		
		mav.addObject("adminRoomList", adminRoomList);
		
		return mav;
	}
	
	//관리자의 방 관리 - 방 삭제
	@RequestMapping("/adminRoomDelete.gh")
	public ModelAndView deleteRoom(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String no = request.getParameter("no");
		adminService.deleteRoom(Integer.parseInt(no));
		mav.setViewName("redirect:/adminRoomList.gh");
		
		return mav;
	}
	
	//관리자의 특가 관리
	@RequestMapping("/adminDiscountList.gh")
	public ModelAndView adminDiscountList(DiscountVO discount) throws Exception {
											//discountList.jsp
		ModelAndView mav = new ModelAndView("discountList");
		
		List<DiscountVO> adminDiscountList = adminService.adminDiscountList(discount);
		mav.addObject("adminDiscountList", adminDiscountList);
		
		return mav;
	}
}
