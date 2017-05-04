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
import net.kh.host.HostService;
import net.kh.host.HostVO;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private JavaMailSenderImpl javaMailSenderImpl;

	@Resource(name = "memberService")
	private MemberService memberService;

	@Resource(name = "hostService")
	private HostService hostService;

	ModelAndView mav = new ModelAndView();

	// 회원가입 선택
	@RequestMapping("/member/joinChoice.gh")
	public String memberStep1() {
		return "member/joinForm1/회원가입선택";
	}

	// 개인회원가입폼
	@RequestMapping("/member/joinFormA.gh")
	public String memberStep2a() {
		return "member/joinForm2a/개인회원가입";
	}

	// 기업회원가입폼
	@RequestMapping("/member/joinFormB.gh")
	public String memberStep2b() {
		return "member/joinForm2b/기업회원가입";
	}

	// 개인회원가입성공
	@RequestMapping("/member/joinA.gh")
	public String memberStep3a(HttpSession session, MemberVO member) throws Exception {

		// 인증코드 만들어서 메일보낼때 쓰고, 테이블에 입력할때도 넣는다.
		int ran = new Random().nextInt(90000) + 10000; // 10000 ~ 99999
		member.setAuth(ran);
		String joinCode = String.valueOf(ran);
		String MemOrHost = "개인"; // 이정보도 넘김.
		// session.setAttribute("joinCode", joinCode);// 없어도 될듯.

		/* http://localhost:8083/GuestHi/auth/{member.no}/{auth} */

		sendMail(member.getNo(), member.getEmail(), joinCode, MemOrHost);

		boolean insertSuccess = memberService.memberInsert(member);
		System.out.println(insertSuccess);
		return "member/loginSuccess/개인회원가입성공";
	}

	// 기업회원가입성공
	@RequestMapping("/member/joinB.gh")
	public String memberStep3b(HttpSession session, HostVO host) throws Exception {

		int ran = new Random().nextInt(90000) + 10000; // 10000 ~ 99999
		host.setAuth(ran);
		String joinCode = String.valueOf(ran);
		String MemOrHost = "기업";

		sendMail(host.getNo(), host.getEmail(), joinCode, MemOrHost);
		
		boolean insertSuccess = hostService.hostInsert(host);
		System.out.println(insertSuccess);

		return "member/joinmail2/기업회원가입성공";
	}

	private void sendMail(int no, String email, String joinCode, String MemOrHost) throws Exception {

		MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();
		System.out.println(email);
		// from, to 입력
		mimeMessage.setFrom(new InternetAddress("guesthi1111@gmail.com"));
		mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(email));

		// 제목 입력
		String subject = "GuestHi - 회원가입 인증 코드 발급 안내 입니다.";
		mimeMessage.setSubject(subject);

		// 내용 입력
		StringBuilder sb = new StringBuilder();
		String uri = "http://localhost:8080/GuestHi/";
		sb.append("<h1><a href='" + uri + "'>");
		sb.append("<img src='http://i.imgur.com/Jo4vPeX.png'></a></h1>");
		sb.append("<h1>Welcome GuestHi</h1>");
		sb.append("저희 GuestHi를 가입해 주셔서 감사드립니다.<br>");
		sb.append("회원님은 " + MemOrHost + "으로 가입하셨습니다.<br>");
		sb.append("아래 링크를 클릭하시면 사이트를 정상적으로 이용가능하십니다.<br>");
		sb.append("<hr><br>");
		sb.append("<a href='" + uri + "auth/" + no + "/" + joinCode + "'>");
		/* http://localhost:8083/GuestHi/auth/{member.no}/{auth} */
		sb.append("귀하의 인증 코드는 " + joinCode + " 입니다. 링크를 클릭하시면 인증됩니다.</a>");
		mimeMessage.setText(sb.toString(), "UTF-8", "html");

		javaMailSenderImpl.send(mimeMessage);
		System.out.println("메일 성공");
	}
	// 인증
	// @RequestMapping(value="/auth/{no}/{auth}")
	// public ModelAndView authOk(MemberVO member)throws Exception{
	//
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
