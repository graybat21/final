package net.kh.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.kh.common.LoginController;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Resource(name = "memberService")
	private MemberService memberService;

	ModelAndView mav = new ModelAndView();

	// 로그인 폼
	@RequestMapping(value = "/login.gh", method = RequestMethod.GET)
	public String loginForm(MemberVO member) {
		return "member/loginForm2/LOGIN";
	}

	// 로그인동작 및 세션 생성
	@RequestMapping(value = "/login.gh", method = RequestMethod.POST)
	public ModelAndView memberLogin(HttpServletRequest request, MemberVO member) throws Exception {

		MemberVO result = memberService.memberLogin(member);
		// ModelAndView mav = new ModelAndView();
//		System.out.println(result.getEmail());
//		System.out.println(result.getPw());
		
		if (result != null) {

			HttpSession session = request.getSession();

			session.setAttribute("mem", result);
			session.setAttribute("session_member_email", result.getEmail());
			session.setAttribute("session_member_name", result.getName());
			session.setAttribute("session_member_no", result.getNo());

			session.setAttribute("TOKEN_SAVE_CHECK", "TRUE");

			mav.setViewName("member/loginSuccess/LoginSuccess");
			
			return mav;
		}

//		System.out.println("로그인 실패");
		mav.setViewName("member/loginError/LoginError");
		return mav;

	}
	//
	// @RequestMapping("/logout.dog")
	// public ModelAndView memberLogout(HttpServletRequest request, MemberModel
	// mem) {
	//
	// HttpSession session = request.getSession(false);
	//
	// if (session != null) {
	// session.invalidate();
	// }
	// mav.addObject("member", new MemberModel());
	// // ModelAndView mav = new ModelAndView();
	// mav.setViewName("member/logout");
	// return mav;
	// }

	// joinStep1()
	// joinStep2()
	// joinStep3()
	// joinStep4()
	// memberFindEmailForm()
	// memberFindEmailOk()
	// memberFindPwForm()
	// memberFindPwOk()
}
