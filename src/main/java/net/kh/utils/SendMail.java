package net.kh.utils;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSenderImpl;

public class SendMail {
	@Inject
	private JavaMailSenderImpl javaMailSenderImpl;

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
}
