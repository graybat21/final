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
import net.kh.member.MemberService;

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
	
	@Inject
	BCryptPasswordEncoder passwordEncoder;
	
	ModelAndView mav = new ModelAndView();
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/myPage.gh")
	public String noticeList(Model model) {
		logger.info("MypageController - myPage.gh");

		return "mypage/mypage/MY PAGE";

	}
	
	@RequestMapping("/memdeleteform.gh")
	public String deleteform(){
		logger.info("회원탈퇴하기");
		return "mypage/memdelete/회원탈퇴";
	}
	
	@RequestMapping("/memdelete.gh")
	public ModelAndView delete(@RequestParam("no") int no,HttpSession session) throws Exception{
		session.invalidate();//로그아웃 처리
		adminService.deleteMember(no);//탈퇴 처리
		mav.setViewName("redirect:/main.gh");
		return mav;
	}
	
	@RequestMapping("/memchkPW.gh")
	public void deletePwChk(@RequestParam("password") String password,@RequestParam("session_mem_no") String session_mem_no, HttpServletResponse response) throws Exception{
		System.out.println(password);
		System.out.println(session_mem_no);
		
		int PasswordChkValue = 0;
		
		Map<String, Object> map = new HashMap();
		map.put("session_mem_no",session_mem_no);
		
		//비밀번호 일치하면 1, 일치하지 않으면 0
		String passwordChk = memberService.deletePwChk(map);
		
		if(passwordEncoder.matches(password, passwordChk)){
			PasswordChkValue = 1;
		}else{
			PasswordChkValue = 0;
		}
		
		try{
			
			PrintWriter pw = response.getWriter();
			
			pw.print(PasswordChkValue);
			pw.flush();
			pw.close();
		
		}catch(Exception ex){
			System.out.println("비밀번호 확인 실패다");
		}
	}
	
	@RequestMapping("/hostdeleteform.gh")
	public String deleteform2(){
		logger.info("회원탈퇴하기");
		return "mypage/hostdelete/회원탈퇴";
	}
	
	@RequestMapping("/hostdelete.gh")
	public ModelAndView delete2(@RequestParam("no") int no,HttpSession session) throws Exception{
		session.invalidate();//로그아웃 처리
		adminService.deleteHost(no);//탈퇴 처리
		mav.setViewName("redirect:/main.gh");
		return mav;
	}
	
	@RequestMapping("/hostchkPW.gh")
	public void deletePwChk2(@RequestParam("password") String password,@RequestParam("session_host_no") String session_host_no, HttpServletResponse response) throws Exception{
		
		int PasswordChkValue = 0;
		
		Map<String, Object> map = new HashMap();
		map.put("session_host_no",session_host_no);
		
		//비밀번호 일치하면 1, 일치하지 않으면 0
		String passwordChk = hostService.deletePwChk(map);
		
		if(passwordEncoder.matches(password, passwordChk)){
			PasswordChkValue = 1;
		}else{
			PasswordChkValue = 0;
		}
		
		try{
			
			PrintWriter pw = response.getWriter();
			
			pw.print(PasswordChkValue);
			pw.flush();
			pw.close();
		
		}catch(Exception ex){
			System.out.println("비밀번호 확인 실패다");
		}
	}
}
