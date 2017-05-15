package net.kh.room;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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

import net.kh.qna.QnaVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RoomController {

	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);

	// @Resource(name = "roomService")
	@Inject
	private RoomService roomService;
	@Inject
	private ImageService imageService;
	private final String PATH = "C:/Java/upload/";
	/* String uploadPath = "C:\\Java\\upload\\"; */

	ModelAndView mav = new ModelAndView();

	// paging
	/*
	 * private int currentPage = 1; // 현재 페이지 private int totalCount; // 총 게시물의
	 * 수 private int blockCount = 4; // 현재 페이지에 보여줄 게시물의 갯수 private int
	 * blockPage = 5; // 보여줄 페이지의 갯수 private String pagingHtml; // paging을 구현한
	 * HTML private Paging paging; // 페이징 클래스의 변수 선언
	 */

	// json 데이터로 응답을 보내기 위한
	@Autowired
	MappingJackson2JsonView jsonView;

	@RequestMapping("/roomInsertForm.gh")
	public ModelAndView roomInsertForm() throws Exception {
		ModelAndView model = new ModelAndView("mypage/roomInsertForm/룸 가입폼");
		model.addObject("host_no", 16);
		return model;
	}
	

	@RequestMapping(value="/roomInsert.gh", method=RequestMethod.POST, produces="text/plain")
	public ModelAndView upload(MultipartHttpServletRequest request, RoomVO room) throws Exception {
		logger.info(room.toString()); //no->seq
		ModelAndView model = new ModelAndView();
		model.setView(jsonView);
		roomService.roomInsert2(room);
		ImageVO image = new ImageVO();
		int room_no = roomService.roomGetCurrentNo();
		
		Iterator<String> itr =  request.getFileNames();
		
        if(itr.hasNext()) {
        	List<MultipartFile> mpf = request.getFiles(itr.next());
            // 임시 파일을 복사한다.
            for(int i = 0; i < mpf.size(); i++) {
            	String orgFileName = mpf.get(i).getOriginalFilename();
            	String newFileName = getUUID() + orgFileName.substring((orgFileName.lastIndexOf(".")));
            	
                File file = new File(PATH+newFileName);
                
                logger.info(file.getAbsolutePath());
                mpf.get(i).transferTo(file);//복사
                System.out.println("얍얍");
              image.setFilename(newFileName);
              image.setRoom_no(room_no-1);//
              image.setFilesize("0");
              
                imageService.imageInsert(image);
                
            }
            
            JSONObject json = new JSONObject();
            json.put("code", "true");
            model.addObject("result", json);
            return model;
            
        } else {
        	
            JSONObject json = new JSONObject();
            json.put("code", "false");
            model.addObject("result", json);
            return model;
            
        }
	}

	private String getUUID() {

		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}
/*
 * @RequestMapping(value = "/room/roomInsert.gh", method = RequestMethod.POST)
 * public ModelAndView roomInsert(HttpServletRequest
 * request, @ModelAttribute("article") RoomVO article,
 * MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {
 * session = req.getSessiom();
 * 
 * article.setId((String) session.getAttribute("id"));
 * 
 * bbs.Service.write(article);
 * 
 * String realFolder = "c:/Java/upload/"; File dir = new FIle(realFolder); if
 * (!dir.isDirectory()) { dir.mkdirs();
 * 
 * }
 * 
 * List<MultipartFile> mf = mhsq.getFiles("uploadFile"); if (mf.size() == 1 &&
 * mf.get(0).getOriginalFilename().equals("")) {
 * 
 * } else { for (int i = 0; i < mf.size(); i++) { String genId =
 * UUID.randomUUID().toString(); String originalfileName =
 * mf.get(index).getOriginalFilename();
 * 
 * String saveFileName = genId + "." + getExtension(originalfileName);
 * 
 * String savePath = realFolder + saveFileName;
 * 
 * long fileSize = mf.get(i).getSize();
 * 
 * mf.get(i).transferTo(new File(savePath));
 * bbsService.fileUpload(originalfileName, saveFileName, fileSize);
 * 
 * } } return new ModelAndView("redirect:list.do");
 * 
 * }
 * 
 * @RequestMapping(value = "/ajaxUpload") public String ajaxUpload() { return
 * "ajaxUpload"; }
 * 
 * @RequestMapping(value = "/fileUpload") public String
 * fileUp(MultipartHttpServletRequest multi) {
 * 
 * // 저장 경로 설정 String root =
 * multi.getSession().getServletContext().getRealPath("/"); String path = root +
 * "resources/upload/";
 * 
 * String newFileName = ""; // 업로드 되는 파일명
 * 
 * File dir = new File(path); if (!dir.isDirectory()) { dir.mkdir(); }
 * 
 * Iterator<String> files = multi.getFileNames(); while (files.hasNext()) {
 * String uploadFile = files.next();
 * 
 * MultipartFile mFile = multi.getFile(uploadFile); String fileName =
 * mFile.getOriginalFilename(); System.out.println("실제 파일 이름 : " + fileName);
 * newFileName = System.currentTimeMillis() + "." +
 * fileName.substring(fileName.lastIndexOf(".") + 1);
 * 
 * try { mFile.transferTo(new File(path + newFileName)); } catch (Exception e) {
 * e.printStackTrace(); } }
 * 
 * System.out.println("id : " + multi.getParameter("id"));
 * System.out.println("pw : " + multi.getParameter("pw"));
 * 
 * return "ajaxUpload"; }
 */
/*
 * mav.setViewName("mypage/roomInsertForm/gg");
 * 
 * return mav; }
 */

/*
 * @RequestMapping("/room/roomInsert.gh") public String
 * roomInsert(MultipartHttpServletRequest multipartHttpServletRequest, RoomVO
 * member) throws Exception { // 써야지.. MultipartFile multipartFile =
 * multipartHttpServletRequest.getFile("file[0]"); String filename =
 * multipartFile.getOriginalFilename(); if (filename != "") {
 * GoodsModel.setGoods_image(System.currentTimeMillis() + "_" +
 * multipartFile.getOriginalFilename()); String savimagename =
 * System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename();
 * FileCopyUtils.copy(multipartFile.getInputStream(), new
 * FileOutputStream(uploadPath + "/" + savimagename)); } else {
 * GoodsModel.setGoods_image("NULL"); }
 * 
 * return "mypage/roomInsert/등록 성공"; }
 */

// roomView()
// roomDelete()
