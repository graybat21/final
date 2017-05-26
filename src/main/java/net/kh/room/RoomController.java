package net.kh.room;

import java.io.File;
import java.util.Iterator;
import java.util.List;
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

import net.kh.host.HostVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RoomController {

	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);

	String PATH = "C:\\Java\\Final\\src\\main\\webapp\\resources\\upload";

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
		System.out.println("얍얍" + host_no);
		List<RoomVO> roomList = roomService.getRoomInfoByHostNo(host_no);
		mav.addObject("host_no", host_no);
		mav.addObject("roomList", roomList);
		return mav;
	}

	@RequestMapping("/roomInsertForm.gh")
	public ModelAndView roomInsertForm() throws Exception {
		ModelAndView model = new ModelAndView("mypage/roomInsertForm/룸 가입폼");
		/* model.addObject("host_no", 16); */
		return model;
	}

	@RequestMapping(value = "/roomInsert.gh", method = RequestMethod.POST, produces = "text/plain")
	public String upload(MultipartHttpServletRequest request, RoomVO room, HttpSession session) throws Exception {

		/*
		 * Set PATHSET =
		 * request.getSession().getServletContext().getResourcePaths("/");
		 */
		// String PATH = "GuestHi/upload";
		// request.getSession().getServletContext().getRealPath("/upload");

		// GUESTHi
		// C:\Java\Final\src\main\webapp\resources
		logger.info(room.toString()); // no->seq
		ModelAndView model = new ModelAndView();
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

				newFileName = getUUID() + orgFileName.substring((orgFileName.lastIndexOf(".")));

				File file = new File(PATH + "/" + newFileName);

				logger.info(orgFileName + "============원래 파일명=========");
				logger.info(file.getAbsolutePath() + "========= 암호화 ===========");
				mpf.get(i).transferTo(file);// 복사 try
				image.setFilename(newFileName);
				image.setRoom_no(room_no - 1);//
				// System.out.println(PATH + "얍얍");
				imageService.imageInsert(image);

				System.out.println("읍읍" + image);
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

		// int no = 152;
		// int no = roomService.roomGetCurrentNo()-1;//room_no
		// int h_no = 21;
		List<RoomVO> roomVO = roomService.getRoomInfoByHostNo(h_no); // room에있는no
		List<ImageVO> image = imageService.getImageByHostNo(h_no); // 호스트넘버를
																	// 가져와야해

		// session.setAttribute("image", image);
		model.addAttribute("room", roomVO);
		model.addAttribute("image", image);
		return "mypage/roomList/방리스트";
	}

	private String getUUID() {

		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}