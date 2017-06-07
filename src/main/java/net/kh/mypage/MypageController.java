package net.kh.mypage;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.kh.admin.AdminService;
import net.kh.host.HostService;
import net.kh.host.HostVO;
import net.kh.member.MemberService;
import net.kh.member.MemberVO;
import net.kh.review.ReviewService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MypageController {

	@Resource(name = "adminService")
	private AdminService adminService;

	@Resource
	private MemberService memberService;
	
	@Resource
	private HostService hostService;


	@Resource
	private ReviewService reviewService;

	@Inject
	BCryptPasswordEncoder passwordEncoder;

	ModelAndView mav = new ModelAndView();
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 * 
	 * @throws Exception
	 */
	@RequestMapping("/myPage.gh")
	public String noticeList(HttpSession session, Model model) throws Exception {
		logger.info("MypageController - myPage.gh");

		if (session.getAttribute("mem") != null) {
			String writer = (String) session.getAttribute("session_mem_name");
			boolean hasREF = reviewService.selectREF(writer);
			model.addAttribute("REF", hasREF);
		}
		return "mypage/mypage/MY PAGE";

	}

	@RequestMapping("modifyMyInfo.gh")
	public String modifyMyInfo() {
		logger.info("modifyMyInfo - modifyMyInfo.gh");
		return "mypage/modifyMyInfo/개인회원 수정";
	}

	@RequestMapping("modify.gh")
	public ModelAndView modify(@RequestParam("no") int no, @RequestParam("password") String password,
			@RequestParam("tel") String tel, HttpSession session) throws Exception {
		logger.info("modify - modify.gh");
		String encryptPassword = passwordEncoder.encode(password);
		// System.out.println(" 변경할 비밀번호 ? "+password);
		// System.out.println(" 변경할 비밀번호 ? "+encryptPassword);
		MemberVO member = memberService.selectMemberByNo(no);
		member.setPw(encryptPassword);
		member.setPhone(tel);
		memberService.modify(member);

		member = memberService.selectMemberByNo(no);
		session.removeAttribute("mem");
		session.setAttribute("mem", member);

		mav.setViewName("redirect:/modifyMyInfo.gh");
		return mav;
	}
	
	@RequestMapping("hostmodify.gh")         
	public ModelAndView hostmodify(@RequestParam("no") int no, @RequestParam("password") String password,
			@RequestParam("tel") String tel,@RequestParam("zip") String zip,@RequestParam("addr1") String addr1,@RequestParam("addr2") String addr2, 
			HttpSession session) throws Exception {
//		logger.info(host.toString());
		String encryptPassword = passwordEncoder.encode(password);
		
		HostVO host = hostService.selectHostByNo(no);
		
		host.setPw(encryptPassword);
		host.setTel(tel);
		host.setZip(zip);
		host.setAddr1(addr1);
		host.setAddr2(addr2);
		hostService.modify(host);

		host = hostService.selectHostByNo(no);
		session.removeAttribute("host");
		session.setAttribute("host", host);

		mav.setViewName("redirect:/modifyMyInfoHost.gh");
		return mav;
	}

	@RequestMapping("/deleteform.gh")
	public String deleteform() {
		logger.info("deleteForm.gh - log");
		return "mypage/memdelete/회원 탈퇴";
	}
	
	@RequestMapping("/hostdeleteform.gh")
	public String hostdeleteform() {
		return "mypage/hostdelete/회원 탈퇴";
	}

	@RequestMapping("/delete.gh")
	public ModelAndView delete(@RequestParam("no") int no, HttpSession session) throws Exception {
		session.invalidate();// 세션초기화
		adminService.deleteMember(no);// 삭제
		mav.setViewName("redirect:/main.gh");
		return mav;
	}
	
	@RequestMapping("/hostdelete.gh")
	public ModelAndView hostdelete(@RequestParam("no") int no, HttpSession session) throws Exception {
		session.invalidate();// 세션초기화
		adminService.deleteHost(no);// 삭제
		mav.setViewName("redirect:/main.gh");
		return mav;
	}

	@RequestMapping("/chkPW.gh")
	public void deletePwChk(@RequestParam("password") String password,
			@RequestParam("session_mem_no") String session_mem_no, HttpServletResponse response) throws Exception {
		System.out.println(password);
		System.out.println(session_mem_no);

		int PasswordChkValue = 0;

		Map<String, Object> map = new HashMap();
		map.put("session_mem_no", session_mem_no);

		// 鍮꾨�踰덊샇 �씪移섑븯硫� 1, �씪移섑븯吏� �븡�쑝硫� 0
		String passwordChk = memberService.deletePwChk(map);

		if (passwordEncoder.matches(password, passwordChk)) {
			PasswordChkValue = 1;
		} else {
			PasswordChkValue = 0;
		}

		try {

			PrintWriter pw = response.getWriter();

			pw.print(PasswordChkValue);
			pw.flush();
			pw.close();

		} catch (Exception ex) {
			System.out.println("鍮꾨�踰덊샇 �솗�씤 �떎�뙣�떎");
		}

	}
	
	@RequestMapping("/chkPW2.gh")
	public void deletePwChk2(@RequestParam("password") String password,
			@RequestParam("session_host_no") String session_host_no, HttpServletResponse response) throws Exception {

		int PasswordChkValue = 0;

		Map<String, Object> map = new HashMap();
		map.put("session_host_no", session_host_no);

		// 鍮꾨�踰덊샇 �씪移섑븯硫� 1, �씪移섑븯吏� �븡�쑝硫� 0
		String passwordChk = hostService.deletePwChk(map);

		if (passwordEncoder.matches(password, passwordChk)) {
			PasswordChkValue = 1;
		} else {
			PasswordChkValue = 0;
		}

		try {

			PrintWriter pw = response.getWriter();

			pw.print(PasswordChkValue);
			pw.flush();
			pw.close();

		} catch (Exception ex) {
			System.out.println("鍮꾨�踰덊샇 �솗�씤 �떎�뙣�떎");
		}

	}

}
