package net.kh.reserve;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	@Inject
	private ReserveService reserveService;

	@RequestMapping("/tabReserve.gh")
	public ModelAndView tabReserve(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("guesthouse/reserve");

		MemberVO member = (MemberVO)session.getAttribute("mem");
		mav.addObject(member);
		int host_no = 21;
		RoomVO room = (RoomVO) roomService.getRoomInfoByHostNo(host_no);
		mav.addObject(room);
		return mav;
	}

	@SuppressWarnings("deprecation")
	@RequestMapping("/myReservation.gh")
	public ModelAndView myReservation(HttpSession session
			) throws Exception {
//		@RequestParam(value = "srch_from", required = false) Date srch_from,
//		@RequestParam(value = "srch_to", required = false) Date srch_to
		ModelAndView mav = new ModelAndView("mypage/reserve/내 예약내역 확인");
		// HashMap<String, Object> map=new HashMap<String, Object>();
		MemberVO member = (MemberVO) session.getAttribute("mem");
		List<HashMap<String, Object>> reserve = reserveService.getReserveInfoByMemNo(member.getNo());
		int totalPrice = 0;
		int price = 0;
		int count = 0;
		Date checkin;
		Date checkout;
		Date now = new Date();
		for (int i = reserve.size() - 1; i >=0 ; i--) {
			count = Integer.parseInt(String.valueOf(reserve.get(i).get("COUNT")));
			price = Integer.parseInt((String) reserve.get(i).get("PRICE"));
			totalPrice = count * price;
			reserve.get(i).put("TOTALPRICE", totalPrice);
			checkin = (Date) reserve.get(i).get("CHECKIN");
			checkout = (Date) reserve.get(i).get("CHECKOUT");
			checkin.setHours(13);
			checkout.setHours(12);
			// status 칼럼 reservation 테이블에 추가해 줘서
			// host or admin 에서 변화시킬수 있게 함.
			if (now.after(checkout)) {
				reserve.get(i).put("STATUS", "만료");
			} else if (now.before(checkin)) {
				reserve.get(i).put("STATUS", "입금");
			} else {
				reserve.get(i).put("STATUS", "이용중");
			}
//			if(checkin.after(srch_to) || checkout.before(srch_from)){
//				reserve.remove(i);
//			}
		}
		mav.addObject("reserve", reserve);
		return mav;
	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

}
