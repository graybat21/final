package net.kh.host;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HostController {

	private static final Logger logger = LoggerFactory.getLogger(HostController.class);
	@Inject
	private JavaMailSenderImpl javaMailSenderImpl;

	@Resource(name = "hostService")
	private HostService hostService;
	
	@Inject
	BCryptPasswordEncoder passwordEncoder;
@Resource
	ModelAndView mav = new ModelAndView();

	@RequestMapping("/join/joinFormB.gh")
	public String joinStep2b() {
		return "member/joinForm2b/기업회원 가입폼";
	}

	@RequestMapping("/join/joinB.gh")
	public String joinStep3a(HttpSession session, HostVO host, MultipartHttpServletRequest request) throws Exception {

		String encryptPassword = passwordEncoder.encode(host.getPw());
		host.setPw(encryptPassword);

		String joinCode = getUuid();
		host.setAuth(joinCode);
		

		private String getUUID() {

			return UUID.randomUUID().toString().replaceAll("-", "");
		}
	

		session.setAttribute("host", host);
		mav.addObject(host);

		logger.info(host.toString());
		return "member/joinSuccess/개인회원가입 성공";
	}
	
	@RequestMapping(value = "/auth-h/{no}/{auth}")
	public ModelAndView authOk(@PathVariable String no, @PathVariable String auth) throws Exception {

		HostVO host = new HostVO();
		host.setAuth(auth);
		host.setNo(Integer.parseInt(no));

		hostService.hostAuthOk(host);
		mav.setViewName("member/authSuccess/인증성공 host");
		// mav.setViewName("member/authError/인증실패");

		return mav;
	}
	
	public void sendMail(int no, String email, String joinCode, String MemOrHost) throws Exception {

		MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();

		mimeMessage.setFrom(new InternetAddress("guesthi1111@gmail.com"));
		mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(email));
		mimeMessage.setSubject("GuestHi - 회원가입 인증요청메일 입니다.");

		StringBuilder sb = new StringBuilder();
		String uri = "http://localhost:8080/GuestHi/";
		sb.append("<h1><a href='" + uri + "'>");
		sb.append("<img src='http://i.imgur.com/Jo4vPeX.png'></a></h1>");
		sb.append("<h1>Welcome GuestHi</h1>");
		sb.append("저희 GuestHi에 가입해 주셔서 진심으로 감사드립니다.<br>");
		sb.append("회원님은 " + MemOrHost + " 으로 가입하셨습니다.<br>");
		sb.append("사이트 이용은 아래 링크를 통해 인증하신후 가능합니다.<br>");
		sb.append("<hr><br>");
		sb.append("<a href='" + uri + "auth-h/" + no + "/" + joinCode + "'>");
		sb.append("링크를 클릭하시면 인증이 왼료됩니다.</a>");
		mimeMessage.setText(sb.toString(), "UTF-8", "html");

		javaMailSenderImpl.send(mimeMessage);
	}
	
	private String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
