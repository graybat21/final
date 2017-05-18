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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

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

	// json 데이터로 응답을 보내기 위한r
	

	@RequestMapping("/tabRoomDetail.gh")
	public String tabRoomDetail(){
		return "guesthouse/roomdetail";
	}

	@RequestMapping("/roomInsertForm.gh")
	public ModelAndView roomInsertForm() throws Exception {
		ModelAndView model = new ModelAndView("mypage/roomInsertForm/룸 가입폼");
		/* model.addObject("host_no", 16); */
		return model;
	}

	@RequestMapping(value = "/roomInsert.gh", method = RequestMethod.POST, produces = "text/plain")
	public String upload(MultipartHttpServletRequest request, RoomVO room) throws Exception {
		
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
				image.setFilesize("0");
//				System.out.println(PATH + "얍얍");
				imageService.imageInsert(image);
				
				System.out.println("읍읍" + image);

			}

			
		}
		return "redirect:roomList.gh";
	}



	
	@RequestMapping("/roomList.gh")
	public ModelAndView roomList(HttpServletRequest request) throws Exception {

		ModelAndView model = new ModelAndView("mypage/roomList/방리스트");
		
		System.out.println(request.getSession().getAttribute("session_no"));
		
		String hno = (String) request.getSession().getAttribute("session_no");
		
		
		/*int no= 158; //몇번인지를 알아야해
		int h_no=16;*/
		/*RoomVO roomVO = roomService.roomList(no); // room에있는no -> image에있는 room_no=158
		List<String> image = roomService.allImage(h_no); //호스트넘버를 가져와야해

		model.addObject("room",roomVO);
		model.addObject("image",image);*/
		return model;
	}
	
	
	


	private String getUUID() {

		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	
	
}