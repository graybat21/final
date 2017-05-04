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

	// ȸ������ ����
	@RequestMapping("/member/joinChoice.gh")
	public String memberStep1() {
		return "member/joinForm1/ȸ�����Լ���";
	}

	// ����ȸ��������
	@RequestMapping("/member/joinFormA.gh")
	public String memberStep2a() {
		return "member/joinForm2a/����ȸ������";
	}

	// ���ȸ��������
	@RequestMapping("/member/joinFormB.gh")
	public String memberStep2b() {
		return "member/joinForm2b/���ȸ������";
	}

	// ����ȸ�����Լ���
	@RequestMapping("/member/joinA.gh")
	public String memberStep3a(HttpSession session, MemberVO member) throws Exception {

		// �����ڵ� ���� ���Ϻ����� ����, ���̺� �Է��Ҷ��� �ִ´�.
		int ran = new Random().nextInt(90000) + 10000; // 10000 ~ 99999
		member.setAuth(ran);
		String joinCode = String.valueOf(ran);
		String MemOrHost = "����"; // �������� �ѱ�.
		// session.setAttribute("joinCode", joinCode);// ��� �ɵ�.

		/* http://localhost:8083/GuestHi/auth/{member.no}/{auth} */

		sendMail(member.getNo(), member.getEmail(), joinCode, MemOrHost);

		boolean insertSuccess = memberService.memberInsert(member);
		System.out.println(insertSuccess);
		return "member/loginSuccess/����ȸ�����Լ���";
	}

	// ���ȸ�����Լ���
	@RequestMapping("/member/joinB.gh")
	public String memberStep3b(HttpSession session, HostVO host) throws Exception {

		int ran = new Random().nextInt(90000) + 10000; // 10000 ~ 99999
		host.setAuth(ran);
		String joinCode = String.valueOf(ran);
		String MemOrHost = "���";

		sendMail(host.getNo(), host.getEmail(), joinCode, MemOrHost);
		
		boolean insertSuccess = hostService.hostInsert(host);
		System.out.println(insertSuccess);

		return "member/joinmail2/���ȸ�����Լ���";
	}

	private void sendMail(int no, String email, String joinCode, String MemOrHost) throws Exception {

		MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();
		System.out.println(email);
		// from, to �Է�
		mimeMessage.setFrom(new InternetAddress("guesthi1111@gmail.com"));
		mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(email));

		// ���� �Է�
		String subject = "GuestHi - ȸ������ ���� �ڵ� �߱� �ȳ� �Դϴ�.";
		mimeMessage.setSubject(subject);

		// ���� �Է�
		StringBuilder sb = new StringBuilder();
		String uri = "http://localhost:8080/GuestHi/";
		sb.append("<h1><a href='" + uri + "'>");
		sb.append("<img src='http://i.imgur.com/Jo4vPeX.png'></a></h1>");
		sb.append("<h1>Welcome GuestHi</h1>");
		sb.append("���� GuestHi�� ������ �ּż� ����帳�ϴ�.<br>");
		sb.append("ȸ������ " + MemOrHost + "���� �����ϼ̽��ϴ�.<br>");
		sb.append("�Ʒ� ��ũ�� Ŭ���Ͻø� ����Ʈ�� ���������� �̿밡���Ͻʴϴ�.<br>");
		sb.append("<hr><br>");
		sb.append("<a href='" + uri + "auth/" + no + "/" + joinCode + "'>");
		/* http://localhost:8083/GuestHi/auth/{member.no}/{auth} */
		sb.append("������ ���� �ڵ�� " + joinCode + " �Դϴ�. ��ũ�� Ŭ���Ͻø� �����˴ϴ�.</a>");
		mimeMessage.setText(sb.toString(), "UTF-8", "html");

		javaMailSenderImpl.send(mimeMessage);
		System.out.println("���� ����");
	}
	// ����
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
