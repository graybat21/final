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
import net.kh.member.MemberService;
import net.kh.member.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MypageController {

	@Resource(name = "adminService")
	private AdminService adminService;
	
	@Resource
	private MemberService memberService;
	
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
	
	@RequestMapping("modifyMyInfo.gh")
	public String modifyMyInfo() {
		logger.info("modifyMyInfo - modifyMyInfo.gh");
		return "mypage/modifyMyInfo/개인회원 수정";
	}
	
	@RequestMapping("modify.gh")
	public ModelAndView modify(@RequestParam("no") int no, @RequestParam("password") String password,@RequestParam("tel") String tel,HttpSession session) throws Exception {
			logger.info("modify - modify.gh");
			String encryptPassword = passwordEncoder.encode(password);
//			System.out.println(" 변경할 비밀번호 ? "+password);
//			System.out.println(" 변경할 비밀번호 ? "+encryptPassword);
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
	
	@RequestMapping("/deleteform.gh")
	public String deleteform(){
		logger.info("deleteForm.gh - log");
		return "mypage/delete/회원 탈퇴";
	}
	
	@RequestMapping("/delete.gh")
	public ModelAndView delete(@RequestParam("no") int no,HttpSession session) throws Exception{
		session.invalidate();//세션초기화
		adminService.deleteMember(no);//삭제
		mav.setViewName("redirect:/main.gh");
		return mav;
	}
	
	@RequestMapping("/chkPW.gh")
	public void deletePwChk(@RequestParam("password") String password,@RequestParam("session_mem_no") String session_mem_no, HttpServletResponse response) throws Exception{
		System.out.println(password);
		System.out.println(session_mem_no);
		
		int PasswordChkValue = 0;
		
		Map<String, Object> map = new HashMap();
		map.put("session_mem_no",session_mem_no);
		
		//鍮꾨�踰덊샇 �씪移섑븯硫� 1, �씪移섑븯吏� �븡�쑝硫� 0
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
			System.out.println("鍮꾨�踰덊샇 �솗�씤 �떎�뙣�떎");
		}
		
		
	}

}
