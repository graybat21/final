package net.kh.room;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RoomController {

	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);

	String PATH = "C:\\java_eclipse\\work\\guestHi\\src\\main\\webapp\\resources\\upload";

	// @Resource(name = "roomService")
	@Inject
	private RoomService roomService;
	@Inject
	private ImageService imageService;

	/* String uploadPath = "C:\\Java\\upload\\"; */

	// paging
	/*
	 * private int currentPage = 1; // 현재 페이지 private int totalCount; // 총 게시물의
	 * 수 private int blockCount = 4; // 현재 페이지에 보여줄 게시물의 갯수 private int
	 * blockPage = 5; // 보여줄 페이지의 갯수 private String pagingHtml; // paging을 구현한
	 * HTML private Paging paging; // 페이징 클래스의 변수 선언
	 */

	@RequestMapping("/tabRoomDetail.gh")
	// json 데이터로 응답을 보내기 위한r ---------여기ㅣㅣㅣㅣㅣㅣㅣㅣㅣ수정
	public ModelAndView tabRoomDetail(@RequestParam(value = "host_no") int host_no) throws Exception {
		ModelAndView mav = new ModelAndView("guesthouse/roomdetail");
		System.out.println("얍얍얍얍" + host_no);
		/*Map map = new HashMap();
		map.put("host_no", host_no);
		map.put("room_no", room_no);*/
		List<RoomVO> roomList = roomService.getRoomInfoByHostNo(host_no);
		
		List<RoomVO> bigImage = roomService.getRoomBigImage(host_no);
		
		System.out.println(roomList.toString() + "얍얍gm");

		mav.addObject("host_no", host_no);
		mav.addObject("roomList", roomList);
		mav.addObject("bigImage", bigImage);
		return mav;
	}

	@RequestMapping("/roomInsertForm.gh")
	public ModelAndView roomInsertForm(HttpServletRequest request) throws Exception {
		ModelAndView model = new ModelAndView("mypage/roomInsertForm/룸 가입폼");
		/* model.addObject("host_no", 16); */

		// 글 작성시 host_no 넘겨주기 위해서
		int h_no = (int) (request.getSession().getAttribute("session_host_no"));
		model.addObject("h_no", h_no);
		///

		return model;
	}

	@RequestMapping(value = "/roomInsert.gh", method = RequestMethod.POST, produces = "text/plain")
	public String upload(MultipartHttpServletRequest request, RoomVO room, HttpSession session) throws Exception {

		ModelAndView model = new ModelAndView();
		// board insert
		roomService.roomInsert2(room);

		ImageVO image = new ImageVO();
		int room_no = roomService.roomGetCurrentNo();

		Iterator<String> itr = request.getFileNames(); // 다중

		String newFileName = "";
		if (itr.hasNext()) {
			List<MultipartFile> mpf = request.getFiles(itr.next()); // 값넣기
			// 임시 파일을 복사한다.
			for (int i = 0; i < mpf.size(); i++) {

				String orgFileName = mpf.get(i).getOriginalFilename();
				if (orgFileName == "") {
					break;
				} else {
					newFileName = getUUID() + orgFileName.substring((orgFileName.lastIndexOf(".")));
				}
				File file = new File(PATH + "/" + newFileName);

				logger.info(orgFileName + "============원래 파일명=========");
				logger.info(file.getAbsolutePath() + "========= 암호화 ===========");
				mpf.get(i).transferTo(file);// 복사 try
				image.setFilename(newFileName);
				image.setRoom_no(room_no - 1);//
				imageService.imageInsert(image);

				model.addObject("roomNumber", image.getRoom_no());
				
				
			}

		}
		return "redirect:roomList.gh";
	}

	@RequestMapping("/roomList.gh")
	public String roomList(HttpServletRequest request, Model model) throws Exception {
		// 호스트 넘버를 통해서 등록한 방정보를 불러온다.
		// 각 방마다 대표이미지만 불러온다.
		int h_no = (int) (request.getSession().getAttribute("session_host_no"));

		List<RoomVO> roomVO = roomService.getRoomInfoByHostNo(h_no); // room에있는no
		List<ImageVO> image = imageService.getImageByHostNo(h_no); // 호스트넘버를
																	// 가져와야해
		logger.info(image.toString());
		// session.setAttribute("image", image);
		model.addAttribute("room", roomVO);
		model.addAttribute("image", image);
		

		return "mypage/roomList/방리스트";
	}

	private String getUUID() {

		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}