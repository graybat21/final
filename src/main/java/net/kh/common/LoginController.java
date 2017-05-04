package net.kh.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

	ModelAndView mav = new ModelAndView();

//	// 로그인 폼 - 자바스크립트로 대체. 지금은 안씀
//	@RequestMapping(value = "/login.gh", method = RequestMethod.GET)
//	public String loginForm() {
//		return "member/loginForm/LOGIN";
//	}

	// 로그인동작 및 세션 생성
	@RequestMapping(value = "/login.gh", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, String email, String pw) throws Exception {

		MemberVO memverVO=new MemberVO();
		HostVO hostVO=new HostVO();
		memberVO.
		LoginVO resultHost=hostService.hostLogin((HostVO);
		MemberVO resultMember = memberService.memberLogin((MemberVO)vo);
		// ModelAndView mav = new ModelAndView();
		// System.out.println(result.getEmail());
		// System.out.println(result.getPw());

		if (result != null) {

			HttpSession session = request.getSession();

			session.setAttribute("mem", result);
			session.setAttribute("session_member_email", result.getEmail());
			session.setAttribute("session_member_name", result.getName());
			session.setAttribute("session_member_no", result.getNo());

			session.setAttribute("TOKEN_SAVE_CHECK", "TRUE"); // ???

			mav.setViewName("member/loginSuccess/LoginSuccess");

			return mav;
		}

		// System.out.println("로그인 실패");
		mav.setViewName("member/loginError/LoginError");
		return mav;

	}

	// 로그아웃 및 세션종료
	@RequestMapping("/logout.gh")
	public ModelAndView memberLogout(HttpServletRequest request, MemberVO member) {

		HttpSession session = request.getSession(false);
		// true 가 default, session 미존재시 새로 session 생성
		// false 일 경우, session 미존재시 그냥 null 값 반환
		if (session != null) {
			session.invalidate();
		}
		mav.addObject("member", new MemberVO());
		// ModelAndView mav = new ModelAndView();
		mav.setViewName("main/main/LOGOUT");
		return mav;
	}
}
