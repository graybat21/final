package net.kh.admin;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.kh.host.HostVO;
import net.kh.qna.QnaVO;
import net.kh.room.RoomVO;
import net.kh.utils.PageMaker;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Resource(name="adminService")
	private AdminService adminService;
	
	
	// 관리자의 회원관리 - 회원 목록
	@RequestMapping("/adminmemberList.gh")
	public ModelAndView memberList(PageMaker pagemaker,AdminVO admin) throws Exception {
											// memList.jsp 의미
		int page = 1;
		int totalCnt = 0;
		int countPerPage = 10;
		int countPerPaging = 5;
		
		page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);

		totalCnt = adminService.memberListCnt(); // DB연동_ 총 갯수 구해오기
		pagemaker.setCount(totalCnt, countPerPaging);

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("first", first);
		map.put("last", last);
		List<AdminVO> list = adminService.memberList(map);

		ModelAndView mav = new ModelAndView("memList");
		mav.addObject("memberList", list);
		mav.addObject("memberPageMaker", pagemaker);

		return mav;
	}
	
	// 관리자의 회원관리 - 회원 강제 탈퇴
	@RequestMapping("/adminmemberDelete.gh")
	public ModelAndView deleteMember(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String no = request.getParameter("no");
		adminService.deleteMember(no);
		mav.setViewName("redirect:/adminmemberList.gh");
		return mav;
		
	}
	
	// 관리자의 호스트관리 - 호스트 목록
	@RequestMapping("/adminhostList.gh")
	public ModelAndView hostList(PageMaker pagemaker, HostVO host) throws Exception {
											//hostList.jsp 의미
		int page = 1;
		int totalCnt = 0;
		int countPerPage = 10;
		int countPerPaging = 5;
		
		page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);

		totalCnt = adminService.hostListCnt(); // DB연동_ 총 갯수 구해오기
		pagemaker.setCount(totalCnt, countPerPaging);

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("first", first);
		map.put("last", last);
		List<HostVO> list = adminService.hostList(map);

		ModelAndView mav = new ModelAndView("hostList");
		mav.addObject("hostList", list);
		mav.addObject("hostPageMaker", pagemaker);
		logger.info(list.toString());
		
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
	public ModelAndView adminRoomList(RoomVO room) throws Exception {
		
		ModelAndView mav = new ModelAndView("admin/roomList/게스트하우스 방 목록");
		
		List<RoomVO> adminRoomList = adminService.adminRoomList(room);
		mav.addObject("adminRoomList", adminRoomList);
		
		return mav;
	}
}
