package net.kh.room;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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

    String PATH = "C:\\Java\\workspace_sts\\GuestHi\\src\\main\\webapp\\resources\\upload";


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
	public ModelAndView tabRoomDetail(@RequestParam(value = "host_no") int host_no,
			@RequestParam(value = "from", required = false) Date from,
			@RequestParam(value = "to", required = false) Date to) throws Exception {
		ModelAndView mav = new ModelAndView("guesthouse/roomdetail");
		List<RoomVO> roomList = roomService.getRoomInfoByHostNo(host_no);
		List<RoomVO> bigImage = roomService.getRoomBigImage(host_no);
		List<Integer> roomNo = null;
//		List<Integer> removeRoomNo = new ArrayList<>();
		logger.info("\nfrom : " + from.toString());
		if (from != null) {
			roomNo = roomService.getRoomNoInReservation(host_no);

			roomList = validSearch(roomList, roomNo, host_no, from, to);
		}
		logger.info(roomList.toString());
		mav.addObject("host_no", host_no);
		mav.addObject("roomList", roomList);
		mav.addObject("bigImage", bigImage);
		return mav;
	}
	
	@RequestMapping("/RoomImage.gh")
	public void roomImage(@RequestParam(value="room_no") int room_no,HttpServletResponse response) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("room_no", room_no);

		try{
			String str = roomService.getRoomImage(map);
		
			PrintWriter out = response.getWriter();
			out.write(str);
			out.flush();
			out.close();
			
		}catch(IOException e){
			System.out.println("이미지 안불러와진다.RoomImage.gh");
		}
		
	}

	private List<RoomVO> validSearch(List<RoomVO> roomList, List<Integer> roomNo, int host_no, Date from, Date to)
			throws Exception {

		// 두번째 방법으로 from~to 사이 날짜를 개별적으로 검사한다.
		// 각 날짜에 예약한 인원수를 구해서 빼는 방식으로 검사한다.
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(from);
		long diff = to.getTime() - from.getTime();
		long diffDays = diff / (24 * 60 * 60 * 1000);
		int countOfDays = Math.round(diffDays);
		System.out.println("날짜간격 : " + countOfDays);
		int max = 0;
		int sum = 0;
		int rest = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<Integer> removeRoomNo = new ArrayList<>();
		map.put("host_no", host_no);
		for (int i = 0; i < countOfDays; i++) {
			cal1.add(Calendar.DATE, 1);
			map.put("d", cal1.getTime());
			logger.info("검색하는 날짜 : " + cal1.getTime().toString());
			for (int j = roomNo.size() - 1; j >= 0; j--) {
				map.put("room_no", roomNo.get(j));
				HashMap<String, Object> getInfoByDate = roomService.getCountByDate(map);
				if (getInfoByDate != null) {
					max = Integer.parseInt(getInfoByDate.get("MAX").toString());
					sum = Integer.parseInt(getInfoByDate.get("SUMCOUNT").toString());
					rest = max - sum;
					if (rest <= 0) {
						System.out.println("제거할 방번호 구함.");
						int roomNo2=(int) map.get("room_no");
						System.out.println(roomNo2);
						removeRoomNo.add(roomNo2);
					}
				}
			}
		}
		System.out.println();
		logger.info(removeRoomNo.toString());
		System.out.println();
		if(removeRoomNo != null){
			for (int i = roomList.size() - 1; i >= 0; i--) {
				for(int j = removeRoomNo.size()-1 ; j>=0;j--){
					if (roomList.get(i).getNo() == removeRoomNo.get(j).intValue()) {
						System.out.println(removeRoomNo.get(j) + "제거 성공");
						roomList.remove(i);
					}
				}
			}
		}
		return roomList;
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

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
}