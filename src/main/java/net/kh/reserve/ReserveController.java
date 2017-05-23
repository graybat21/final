package net.kh.reserve;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.kh.member.MemberVO;
import net.kh.room.RoomService;
import net.kh.room.RoomVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReserveController {

	private static final Logger logger = LoggerFactory.getLogger(ReserveController.class);

	@Inject
	private RoomService roomService;

	@RequestMapping("/tabReserve.gh")
	public ModelAndView tabReserve(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("guesthouse/reserve");

		MemberVO member = (MemberVO) session.getAttribute("mem");
		mav.addObject(member);
		int host_no = 21;
		RoomVO room = (RoomVO) roomService.getRoomInfoByHostNo(host_no);
		mav.addObject(room);
		return mav;
	}
	
	@RequestMapping("/myReservation.gh")
	public ModelAndView myReservation()throws Exception{
		ModelAndView mav=new ModelAndView("mypage/reserve/내 예약내역 확인");
		
		
		return mav;
	}

}
