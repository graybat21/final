package net.kh.common;


import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.kh.host.HostService;
import net.kh.host.HostVO;
import net.kh.member.MemberService;
import net.kh.member.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Resource(name = "memberService")
	private MemberService memberService;

	@Resource(name = "hostService")
	private HostService hostService;

	@Inject
	BCryptPasswordEncoder passwordEncoder;

	ModelAndView mav = new ModelAndView();

	@RequestMapping(value = "/login.gh", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, MemberVO member) throws Exception {

		try {
			
//			MemberVO member = (MemberVO)objectVO;
//			if(objectVO instanceof MemberVO){
//				
//			}else if(objectVO instanceof HostVO){
//				HostVO host=(HostVO)objectVO;
//			}
			String encodedPassword="";
			String rawPassword = member.getPw();
			MemberVO resultMember = memberService.memberLogin(member);
			
			if(resultMember != null){
				encodedPassword = resultMember.getPw();
				
				if (!(passwordEncoder.matches(rawPassword, encodedPassword))) {
					mav.setViewName("member/loginError/No Match PW");
					return mav;
				} else if (!resultMember.getAuth().equals("y")) {
					mav.setViewName("member/authNotYet/Auth Not Yet");
					return mav;
				}
	
				HttpSession session = request.getSession();
	
				session.setAttribute("mem", resultMember);
				session.setAttribute("session_mem_no", resultMember.getNo());
				session.setAttribute("session_mem_email", resultMember.getEmail());
				session.setAttribute("session_mem_name", resultMember.getName());
	
	
				session.setAttribute("TOKEN_SAVE_CHECK", "TRUE"); // ???
	
				mav.setViewName("member/loginSuccess/濡�洹몄�� �깃났");
				logger.info(resultMember.toString());
				return mav;
			}else{
				HostVO host=new HostVO();
				host.setEmail(member.getEmail());
				HostVO resultHost=hostService.hostLogin(host);
				encodedPassword = resultHost.getPw();
				
				if (!(passwordEncoder.matches(rawPassword, encodedPassword))) {
					mav.setViewName("member/loginError/No Match PW HOST");
					return mav;
				} else if (!resultHost.getAuth().equals("y")) {
					mav.setViewName("member/authNotYet/Auth Not Yet HOST");
					return mav;
				}
	
				HttpSession session = request.getSession();
	
				session.setAttribute("session_host_email", resultHost.getEmail());
				session.setAttribute("session_host_name", resultHost.getName());
				session.setAttribute("session_host_no", resultHost.getNo());
				session.setAttribute("host", resultHost); //��諛�鍮�
				session.setAttribute("session_addr1", resultHost.getAddr1());
				session.setAttribute("TOKEN_SAVE_CHECK", "TRUE"); // ???
	
				logger.info(resultHost.toString());
				mav.setViewName("member/loginSuccess/濡�洹몄�� �깃났 host");
				return mav;
			}
		} catch (NullPointerException e) {
			mav.setViewName("member/loginError/LOGIN ERROR");
			return mav;
		}
	}

	@RequestMapping("/logout.gh")
	public ModelAndView logout(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		if (session != null) {
			session.removeAttribute("session_host_no");
			session.invalidate();
			System.out.println("hostno?"+request.getSession().getAttribute("session_host_no"));
		}
		mav.addObject("member", new MemberVO());
		mav.addObject("host", new HostVO());
		mav.setViewName("main/main/LOGOUT");
		mav.setViewName("redirect:/main.gh");
		return mav;
	}
}
