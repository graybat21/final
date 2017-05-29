package net.kh.host;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HostController {

	private static final Logger logger = LoggerFactory.getLogger(HostController.class);

	private String uploadPath = "C:\\Java\\Final\\src\\main\\webapp\\resources\\upload";
	/*c70ae73c18dc4c838e0e6cd8b148d81b.jpg*/
	@Inject
	private JavaMailSenderImpl javaMailSenderImpl;

	@Resource(name = "hostService")
	private HostService hostService;

	@Inject
	BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("/join/joinFormB.gh")
	public String joinStep2b() {
		return "member/registerHost/기업회원 가입폼";
	}

	@RequestMapping(value = "/join/joinB.gh", method = RequestMethod.POST)
	public ModelAndView joinStep3a(HostVO host) throws Exception {
		ModelAndView mav = new ModelAndView();
		try {
			String newFileName;
			MultipartFile mf = host.getImageFile();
			host.setImagename("");
			if (!mf.isEmpty()) {
				String orgname = mf.getOriginalFilename();
				String ext = orgname.substring(orgname.lastIndexOf('.'));
				newFileName = getUuid() + ext;
				File dir = new File(uploadPath);
				if (!dir.isDirectory()) {
					dir.mkdirs();
				}
				File serverFile = new File(uploadPath + File.separator + newFileName);
				mf.transferTo(serverFile);
				host.setImagename(newFileName);
			}
			String encryptPassword = passwordEncoder.encode(host.getPw());
			host.setPw(encryptPassword);

			String joinCode = getUuid();
			host.setAuth(joinCode);

			int no = hostService.hostGetCurrentNo();
			sendMail(no, host.getEmail(), joinCode, "게스트하우스");

			host.setNo(no);
			hostService.hostInsert(host);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.setViewName("member/authNotYet/기업회원가입 인증대기중");

		return mav;
	}

	// @RequestMapping(value = "/join/joinB.gh", method = RequestMethod.POST)
	// public ModelAndView joinStep3a(MultipartHttpServletRequest req, HostVO
	// host)
	// throws Exception {
	// 
	// System.out.println(" ===== ");
	// Map<String, Object> returnObject = new HashMap<String, Object>();
	// try {
	// Iterator<String> iter = req.getFileNames();
	// MultipartFile mfile = null;
	// String fieldName = "";
	// List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,
	// Object>>();
	// File dir = new File(PATH);
	// if (!dir.isDirectory()) {
	// dir.mkdirs();
	// }
	// System.out.println("while문 전에...");
	// while (iter.hasNext()) {
	// fieldName = (String) iter.next();
	// System.out.println(fieldName);
	// mfile = req.getFile(fieldName);
	// String origName;
	// origName = new String(mfile.getOriginalFilename().getBytes("8859_1"),
	// "UTF-8");
	//
	// if ("".equals(origName)) {
	// continue;
	// }
	// String ext = origName.substring(origName.lastIndexOf('.')); // 확장자
	// String saveFileName = getUuid() + ext;
	// File serverFile = new File(PATH + saveFileName);
	// mfile.transferTo(serverFile);
	//
	// Map<String, Object> file = new HashMap<String, Object>();
	// file.put("imagename", saveFileName);
	// file.put("sfile", serverFile);
	// resultList.add((HashMap<String, Object>) file);
	//
	// host.setImagesize("0");
	// host.setImagename(saveFileName);
	// String encryptPassword = passwordEncoder.encode(host.getPw());
	// host.setPw(encryptPassword);
	//
	// String joinCode = getUuid();
	// host.setAuth(joinCode);
	//
	// int no = hostService.hostGetCurrentNo();
	// sendMail(no, host.getEmail(), joinCode, "게스트하우스");
	//
	// host.setNo(no);
	// boolean insertSuccess = hostService.hostInsert(host);
	//
	// mav.addObject(host);
	// }
	//
	// } catch (UnsupportedEncodingException e) {
	// e.printStackTrace();
	// } catch (IllegalStateException e) {
	// e.printStackTrace();
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	// mav.setViewName("member/authNotYet/기업회원가입 인증대기중");
	//
	// return mav;
	// }

	@RequestMapping(value = "/auth-h/{no}/{auth}")
	public ModelAndView authOk(@PathVariable String no, @PathVariable String auth) throws Exception {
		ModelAndView mav = new ModelAndView();
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
