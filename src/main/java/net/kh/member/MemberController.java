package net.kh.member;

import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.kh.common.LoginController;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private JavaMailSenderImpl javaMailSenderImpl;

	@Resource(name = "memberService")
	private MemberService memberService;

	ModelAndView mav = new ModelAndView();

	// �α��� ��
	@RequestMapping(value = "/login.gh", method = RequestMethod.GET)
	public String loginForm(MemberVO member) {
		return "member/loginForm/LOGIN";
	}

	// �α��ε��� �� ���� ����
	@RequestMapping(value = "/login.gh", method = RequestMethod.POST)
	public ModelAndView memberLogin(HttpServletRequest request, MemberVO member) throws Exception {

		MemberVO result = memberService.memberLogin(member);
		// ModelAndView mav = new ModelAndView();
		// System.out.println(result.getEmail());
		// System.out.println(result.getPw());

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

		// System.out.println("�α��� ����");
		mav.setViewName("member/loginError/LoginError");
		return mav;

	}

	@RequestMapping("/logout.gh")
	public ModelAndView memberLogout(HttpServletRequest request, MemberVO member) {

		HttpSession session = request.getSession(false);
		// true �� default, session ������� ���� session ����
		// false �� ���, session ������� �׳� null �� ��ȯ
		if (session != null) {
			session.invalidate();
		}
		mav.addObject("member", new MemberVO());
		// ModelAndView mav = new ModelAndView();
		mav.setViewName("main/main/LOGOUT");
		return mav;
	}

	@RequestMapping("/sendmail.gh")
	public String sendmailform() {
		return "member/joinmail/sendmailform";
	}

	// ȸ������ �̸��� ����
	@RequestMapping(value = "/sendmail2.gh")
	public String sendMailAuth(HttpSession session, MemberVO member) throws Exception {

		MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();
		
		mimeMessage.setFrom(new InternetAddress("guesthi1111@gmail.com"));
		mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(member.getEmail()));

		String subject = "GuestHi - ȸ������ ���� �ڵ� �߱� �ȳ� �Դϴ�.";
		mimeMessage.setSubject(subject);

		int ran = new Random().nextInt(90000) + 10000; // 10000 ~ 99999
		member.setAuth(ran);
		String joinCode = String.valueOf(ran);
		session.setAttribute("joinCode", joinCode);
		StringBuilder sb = new StringBuilder();
		String uri = "http://localhost:8080/GuestHi/";
		sb.append("<h1><a href='" + uri + "'>");
		sb.append("<img src='http://i.imgur.com/Jo4vPeX.png'></a></h1>");
		sb.append("<h1>Welcome GuestHi</h1>");
		sb.append("<hr><br>");
		sb.append("<a href='" + uri + "auth/" + member.getNo() + "/" + joinCode + "'>");
		/*http://localhost:8083/GuestHi/auth/{member.no}/{auth}*/
		sb.append("������ ���� �ڵ�� " + joinCode + " �Դϴ�. ��ũ�� Ŭ���Ͻø� �����˴ϴ�.</a>");
		mimeMessage.setText(sb.toString(), "UTF-8", "html");

		javaMailSenderImpl.send(mimeMessage);
		
		boolean insertSuccess =memberService.memberInsert(member);
		System.out.println(insertSuccess);
		
		return "member/joinmail2/sendmailsuccess";
	}
	
	// ����
//	@RequestMapping(value="/auth/{no}/{auth}")
//	public ModelAndView authOk(MemberVO member)throws Exception{
//		
//	}

	// joinStep1()
	// joinStep2()
	// joinStep3()
	// joinStep4()
	// memberFindEmailForm()
	// memberFindEmailOk()
	// memberFindPwForm()
	// memberFindPwOk()
}
