package net.kh.member;

import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.kh.utils.MemberEntryValidator;


@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private JavaMailSenderImpl javaMailSenderImpl;

	@Resource(name = "memberService")
	private MemberService memberService;

	@Inject
	BCryptPasswordEncoder passwordEncoder;

	ModelAndView mav = new ModelAndView();

	@RequestMapping("/joinChoice.gh")
	public String joinStep1() {
		return "member/joinForm1/회원가입 선택";
	}

	@RequestMapping("/join/joinFormA.gh")
	public String joinStep2a() {
		return "member/registerMember/개인회원 가입폼";
	}

	@RequestMapping("/join/joinA.gh")
	public ModelAndView joinStep3a(HttpSession session, @ModelAttribute("MemberVO") MemberVO member, BindingResult result) throws Exception {

		new MemberEntryValidator().validate(member, result);
		if (result.hasErrors()) {
			mav.setViewName("redirect:/joinChoice.gh");
			return mav;
		}
		String encryptPassword = passwordEncoder.encode(member.getPw());
		member.setPw(encryptPassword);

		String joinCode = getUuid();
		member.setAuth(joinCode);
		String MemOrHost = "개인";
		int no = memberService.memberGetCurrentNo();
		sendMail(no, member.getEmail(), joinCode, MemOrHost);

		member.setNo(no);
		boolean insertSuccess = memberService.memberInsert(member);

		session.setAttribute("mem", member);
		mav.addObject(member);

		logger.info(member.toString());
		mav.setViewName("member/joinSuccess/개인회원가입 성공");
		return mav;
	}
	
	
//	public ModelAndView register(@ModelAttribute @Valid User user, BindingResult bindingResult, HttpSession session)
//			throws Exception {
//
//		logger.info(user.toString());
//		userEntryValidator.validate(user, bindingResult);
//
//		String encryptPassword = passwordEncoder.encode(user.getPassword());
//		user.setPassword(encryptPassword);
//
//		ModelAndView mav = new ModelAndView("user/joinSuccess/JoinSuccess");
//
//		if (bindingResult.hasErrors()) {
//			mav.getModel().putAll(bindingResult.getModel());
//			mav.setViewName("user/register/Register");
//			return mav;
//		}
//
//		String joinCode = getUuid();
//		user.setAuth(joinCode);
//		sendMail(user.getUsername(), user.getEmail(), joinCode);
//
//		service.insert(user);
//		session.setAttribute("USER", user);
//		mav.addObject(user);
//
//		return mav;
//	}
	
	@RequestMapping("modifyMyInfo.gh")
	public String modifyMyInfo() {
		return "mypage/modifyMyInfo/개인회원 수정";
	}
	

	@RequestMapping(value = "emailCheck.gh", method = RequestMethod.POST)
	@ResponseBody
	public int emailCheck(@RequestBody String email) throws Exception {
		logger.info(email);
		int isEmailExist = memberService.emailCheck(email);
		return isEmailExist;
	}
	
	@RequestMapping(value = "/auth-m/{no}/{auth}")
	public ModelAndView authOk(@PathVariable String no, @PathVariable String auth) throws Exception {

		MemberVO member = new MemberVO();
		member.setAuth(auth);
		member.setNo(Integer.parseInt(no));

		memberService.memberAuthOk(member);
		mav.setViewName("member/authSuccess/인증성공");
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
		sb.append("<a href='" + uri + "auth-m/" + no + "/" + joinCode + "'>");
		sb.append("링크를 클릭하시면 인증이 왼료됩니다.</a>");
		mimeMessage.setText(sb.toString(), "UTF-8", "html");

		javaMailSenderImpl.send(mimeMessage);
	}

	private String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
