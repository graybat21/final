package net.kh.admin;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.kh.discount.DiscountVO;
import net.kh.host.HostVO;
import net.kh.member.MemberVO;
import net.kh.reserve.ReserveVO;
import net.kh.room.RoomVO;
import net.kh.utils.PageMaker;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Resource(name="adminService")
	private AdminService adminService;
	
	
	// 관리자의 회원관리 - 회원 목록
	@RequestMapping("/adminmemberList.gh")
	public ModelAndView memberList(PageMaker pagemaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
											// memList.jsp 의미
		ModelAndView mav = new ModelAndView("memList");
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		int page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		int totalCnt = adminService.memberListCnt(map); // DB연동_ 총 갯수 구해오기
		int countPerPage = 5;
		int countPerPaging = 3;

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;

		map.put("first", first);
		map.put("last", last);
		
		List<MemberVO> memberList = adminService.memberList(map);
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);
		mav.addObject("memberList", memberList);
		mav.addObject("pageMaker", pagemaker);
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
					
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
	public ModelAndView hostList(PageMaker pagemaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
											//hostList.jsp 의미
		ModelAndView mav = new ModelAndView("hostList");
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		int page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		int totalCnt = adminService.hostListCnt(map); // DB연동_ 총 갯수 구해오기
		int countPerPage = 4;
		int countPerPaging = 3;

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;

		map.put("first", first);
		map.put("last", last);
		
		List<HostVO> hostList = adminService.hostList(map);
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);
		mav.addObject("hostList", hostList);
		mav.addObject("pageMaker", pagemaker);
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
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
	
//	 관리자의 게하 방 관리
	@RequestMapping("/adminroomList.gh")
	public ModelAndView adminRoomList(PageMaker pagemaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView("roomList");
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		int page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		int totalCnt = adminService.roomListCnt(map); // DB연동_ 총 갯수 구해오기
		int countPerPage = 3;
		int countPerPaging = 3;

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;

		map.put("first", first);
		map.put("last", last);
		
		List<RoomVO> roomList = adminService.adminRoomList(map);
		
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);
		mav.addObject("roomList", roomList);
		mav.addObject("pageMaker", pagemaker);
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		
		return mav;
	}
	
	//관리자의 방 관리 - 방 삭제
	@RequestMapping("/adminRoomDelete.gh")
	public ModelAndView deleteRoom(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String no = request.getParameter("no");
		
		adminService.deleteImage(Integer.parseInt(no));
		adminService.deleteRoom(Integer.parseInt(no));
		mav.setViewName("redirect:/adminRoomList.gh");
		
		return mav;
	}
	
	//관리자의 특가 관리
	@RequestMapping("/adminDiscountList.gh")
	public ModelAndView adminDiscountList(PageMaker pagemaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		
		ModelAndView mav = new ModelAndView("discountList");
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		int page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		int totalCnt = adminService.discountListCnt(map); // DB연동_ 총 갯수 구해오기
		int countPerPage = 3;
		int countPerPaging = 3;

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;

		map.put("first", first);
		map.put("last", last);
		
		List<DiscountVO> adminDiscountList = adminService.adminDiscountList(map);
		
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);
		mav.addObject("adminDiscountList", adminDiscountList);
		mav.addObject("pageMaker", pagemaker);
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		
		return mav;
	}
	
	//관리자의 특가 관리 - 특가 삭제
	@RequestMapping("/adminDiscountDelete.gh")
	public ModelAndView deleteDiscount(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String no = request.getParameter("no");
		
		adminService.deleteDiscount(Integer.parseInt(no));
		mav.setViewName("redirect:/adminDiscountList.gh");
		
		return mav;
	}
	
	
	//관리자의 예약내역목록 관리
	@RequestMapping("/adminReserveList.gh")
	public ModelAndView adminReserveList(PageMaker pagemaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		
		ModelAndView mav = new ModelAndView("reserveList");
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		int page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		int totalCnt = adminService.reserveListCnt(map); // DB연동_ 총 갯수 구해오기
		int countPerPage = 3;
		int countPerPaging = 3;
		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;

		map.put("first", first);
		map.put("last", last);
		
		List<ReserveVO> adminReserveList = adminService.adminReserveList(map);
		
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);
		mav.addObject("adminReserveList", adminReserveList);
		mav.addObject("pageMaker", pagemaker);
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		
		return mav;
	}
	
	//예약 내역 삭제
	@RequestMapping("/adminReserveDelete.gh")
	public ModelAndView deleteReserve(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String no = request.getParameter("no");
		
		adminService.deleteImage(Integer.parseInt(no));
		adminService.deleteRoom(Integer.parseInt(no));
		mav.setViewName("redirect:/adminReserveList.gh");
		
		return mav;
	}
}
