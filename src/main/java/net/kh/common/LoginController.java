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

	// // �α��� �� - �ڹٽ�ũ��Ʈ�� ��ü. ������ �Ⱦ�
	// @RequestMapping(value = "/login.gh", method = RequestMethod.GET)
	// public String loginForm() {
	// return "member/loginForm/LOGIN";
	// }

	// �α��ε��� �� ���� ����
	@RequestMapping(value = "/login.gh", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, MemberVO member) throws Exception {

		MemberVO resultMember = memberService.memberLogin(member);
		// ModelAndView mav = new ModelAndView();
		// System.out.println(result.getEmail());
		// System.out.println(result.getPw());

		if (resultMember != null) {
			if(resultMember.getAuth() == 100){
				mav.setViewName("member/authNotYet/���� �����");
				return mav;
			}

			HttpSession session = request.getSession();

			session.setAttribute("mem", resultMember);
			session.setAttribute("session_email", resultMember.getEmail());
			session.setAttribute("session_name", resultMember.getName());
			session.setAttribute("session_no", resultMember.getNo());

			session.setAttribute("TOKEN_SAVE_CHECK", "TRUE"); // ???

			mav.setViewName("member/loginSuccess/����ȸ�� �α���");

			return mav;
		} else {
			HostVO host = new HostVO();
			host.setEmail(member.getEmail());
			host.setPw(member.getPw());
			HostVO resultHost = hostService.hostLogin(host);
			if (resultHost != null) {

				HttpSession session = request.getSession();

				session.setAttribute("host", resultHost);
				session.setAttribute("session_email", resultHost.getEmail());
				session.setAttribute("session_name", resultHost.getName());
				session.setAttribute("session_no", resultHost.getNo());

				session.setAttribute("TOKEN_SAVE_CHECK", "TRUE"); // ???

				mav.setViewName("member/loginSuccess/GHȸ�� �α���");

				return mav;
			}
		}
		mav.setViewName("member/loginError/�α��� ����");

		return mav;
	}

	// �α׾ƿ� �� ��������
	@RequestMapping("/logout.gh")
	public ModelAndView logout(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		// true �� default, session ������� ���� session ����
		// false �� ���, session ������� �׳� null �� ��ȯ
		if (session != null) {
			session.invalidate();
		}
		mav.addObject("member", new MemberVO());
		mav.addObject("host", new HostVO());
		// ModelAndView mav = new ModelAndView();
		mav.setViewName("main/main/LOGOUT");
		return mav;
	}
}
