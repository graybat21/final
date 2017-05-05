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
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping("/joinChoice.gh")
	public String joinStep1() {
		return "member/joinForm1/ȸ�����Լ���";
	}

	// ����ȸ��������
	@RequestMapping("/join/joinFormA.gh")
	public String joinStep2a() {
		return "member/joinForm2a/����ȸ������";
	}

	// ���ȸ��������
	@RequestMapping("/join/joinFormB.gh")
	public String joinStep2b() {
		return "member/joinForm2b/���ȸ������";
	}

	// ����ȸ�����Լ���
	@RequestMapping("/join/joinA.gh")
	public String joinStep3a(HttpSession session, MemberVO member) throws Exception {

		// �����ڵ� ���� ���Ϻ����� ����, ���̺� �Է��Ҷ��� �ִ´�.
		int ran = new Random().nextInt(900000) + 100000; // 100000 ~ 999999 : 6�ڸ�
		member.setAuth(ran);
		String joinCode = String.valueOf(ran);
		String MemOrHost = "����";
		
		int no = memberService.memberGetCurrentNo();
		sendMail(no, member.getEmail(), joinCode, MemOrHost);
		
		member.setNo(no);
		boolean insertSuccess = memberService.memberInsert(member);
		logger.info(member.toString());
		logger.info("����ȸ�� db insert? " + insertSuccess);
		return "member/joinSuccess/����ȸ�����Լ���";
	}

	// ���ȸ�����Լ���
	@RequestMapping("/join/joinB.gh")
	public String joinStep3b(HttpSession session, HostVO host) throws Exception {

		int ran = new Random().nextInt(90000) + 10000; // 10000 ~ 99999 : 5�ڸ�
		
		host.setAuth(ran);
		String joinCode = String.valueOf(ran);
		String MemOrHost = "���";

		int no = hostService.hostGetCurrentNo();
		sendMail(no, host.getEmail(), joinCode, MemOrHost);
		
		host.setNo(no);
		boolean insertSuccess = hostService.hostInsert(host);
		logger.info(host.toString());
		logger.info("���ȸ�� db insert? " + insertSuccess);
		return "member/joinSuccess/���ȸ�����Լ���";
	}

	private void sendMail(int no, String email, String joinCode, String MemOrHost) throws Exception {

		MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();

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
		logger.info(mimeMessage.toString());
	}

	// �̸����� ���� ����
	@RequestMapping(value = "/auth/{no}/{auth}")
	public ModelAndView authOk(@PathVariable String no, @PathVariable String auth) throws Exception {
		
		if (auth.length() == 5) {
			HostVO host = new HostVO();
			host.setAuth(Integer.parseInt(auth));
			host.setNo(Integer.parseInt(no));
			
			hostService.hostAuthOk(host);
			
			mav.setViewName("member/authSuccess/���ȸ�� ���� ����");
		} else if (auth.length() == 6) {
			MemberVO member = new MemberVO();
			member.setAuth(Integer.parseInt(auth));
			member.setNo(Integer.parseInt(no));
			
			memberService.memberAuthOk(member);
			mav.setViewName("member/authSuccess/����ȸ�� ���� ����");
		} else {
			// �Ѵ� ���� : auth error ��������
			mav.setViewName("member/authError/���� ����");
		}
		
		return mav;
	}

	// joinStep1()
	// joinStep2()
	// joinStep3()
	// joinStep4()
	// memberFindEmailForm()
	// memberFindEmailOk()
	// memberFindPwForm()
	// memberFindPwOk()
}
