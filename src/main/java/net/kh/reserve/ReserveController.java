package net.kh.reserve;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.kh.host.HostVO;
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
	public ModelAndView tabReserve(HttpSession session, @RequestParam(value = "host_no") int host_no,
			@RequestParam(value = "from", required = false) Date from,
			@RequestParam(value = "to", required = false) Date to) throws Exception {
		ModelAndView mav = new ModelAndView("guesthouse/reserve");
		List<RoomVO> roomList = roomService.getRoomInfoByHostNo(host_no);
		List<RoomVO> bigImage = roomService.getRoomBigImage(host_no);
		List<Integer> roomNo = null;
		MemberVO member = new MemberVO();
		if (session.getAttribute("mem") != null) {
			member = (MemberVO) session.getAttribute("mem");
		}
		mav.addObject("member", member);

		if (from != null) {
			roomNo = roomService.getRoomNoInReservation(host_no);

			roomList = validSearch(roomList, roomNo, host_no, from, to);
		}
		logger.info(roomList.toString());
		mav.addObject("host_no", host_no);
		mav.addObject("from", from);
		mav.addObject("to", to);
		mav.addObject("roomList", roomList);
		mav.addObject("bigImage", bigImage);

		return mav;
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
				logger.info("날짜를 통해 얻은 최대인원수 등 : " + getInfoByDate);
				if (getInfoByDate != null) {
					max = Integer.parseInt(getInfoByDate.get("MAX").toString());
					sum = Integer.parseInt(getInfoByDate.get("SUMCOUNT").toString());
					rest = max - sum;
					if (rest <= 0) {
						System.out.println("제거할 방번호 구함.");
						int roomNo2 = (int) map.get("room_no");
						System.out.println(roomNo2);
						removeRoomNo.add(roomNo2);
					}
				}
			}
		}
		System.out.println();
		logger.info(removeRoomNo.toString());
		System.out.println();
		if (removeRoomNo != null) {
			for (int i = roomList.size() - 1; i >= 0; i--) {
				// roomList.get(i).setMax((int) map2.get(i).get("REST"));
				for (int j = removeRoomNo.size() - 1; j >= 0; j--) {
					if (roomList.get(i).getNo() == removeRoomNo.get(j).intValue()) {
						roomList.remove(i);
						System.out.println(removeRoomNo.get(j) + "제거 성공");
					}
				}
			}
		}
		return roomList;
	}

	@SuppressWarnings("deprecation")
	@RequestMapping("/myReservation.gh")
	public ModelAndView myReservation(HttpSession session) throws Exception {
		// @RequestParam(value = "srch_from", required = false) Date srch_from,
		// @RequestParam(value = "srch_to", required = false) Date srch_to
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
		for (int i = reserve.size() - 1; i >= 0; i--) {
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
			// if(checkin.after(srch_to) || checkout.before(srch_from)){
			// reserve.remove(i);
			// }
		}
		mav.addObject("reserve", reserve);
		return mav;
	}

	@RequestMapping("/myReserveList.gh")
	public ModelAndView myReserveList(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("mypage/reservation/예약된방목록");
		HostVO host = (HostVO) session.getAttribute("host");
		int host_no = host.getNo();
		List<HashMap<String, Object>> list = reserveService.getReserveInfoByHostNo(host_no);
		int totalPrice = 0;
		int price = 0;
		int count = 0;
		Date checkin;
		Date checkout;
		Date now = new Date();
		for (int i = list.size() - 1; i >= 0; i--) {
			count = Integer.parseInt(String.valueOf(list.get(i).get("COUNT")));
			price = Integer.parseInt((String) list.get(i).get("PRICE"));
			totalPrice = count * price;
			list.get(i).put("TOTALPRICE", totalPrice);
			checkin = (Date) list.get(i).get("CHECKIN");
			checkout = (Date) list.get(i).get("CHECKOUT");
			checkin.setHours(13);
			checkout.setHours(12);
			// status 칼럼 reservation 테이블에 추가해 줘서
			// host or admin 에서 변화시킬수 있게 함.
			if (now.after(checkout)) {
				list.get(i).put("STATUS", "만료");
			} else if (now.before(checkin)) {
				list.get(i).put("STATUS", "입금");
			} else {
				list.get(i).put("STATUS", "이용중");
			}
			// if(checkin.after(srch_to) || checkout.before(srch_from)){
			// list.remove(i);
			// }
		}
		logger.info(list.toString());
		mav.addObject("list", list);
		return mav;
	}

	
	@SuppressWarnings({ "deprecation" })
	@RequestMapping(value = "/insertReservation.gh", method = RequestMethod.POST)
	public ModelAndView insertReservation(PaymentVO payment/*,@RequestParam(value = "from", required = false) Date from,
			@RequestParam(value = "to", required = false) Date to*/) throws Exception {
		ModelAndView mav = new ModelAndView("guesthouse/reserveSuccess/예약 성공");
		ReserveVO reserve = new ReserveVO();
//		List<ReserveVO> reserveList=null;
//		DateFormat dFormat = new SimpleDateFormat("yyyyMMddHHmmss");
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
//		Date checkin = payment.getCheckin();
//		Date checkout = payment.getCheckout();
		String[] checkinArray = payment.getCheckin().split(" ");
		String[] checkoutArray = payment.getCheckout().split(" ");
//		String checkinStr = checkinArray[5] + "-"+checkinArray[1]+"-"+checkinArray[2];
//		String checkoutStr = checkoutArray[5] + "-"+checkoutArray[1]+"-"+checkoutArray[2];
//		System.out.println(checkinStr);
//		System.out.println(checkoutStr);
//		Date transCheckout = dFormat.parse(payment.getCheckout());
//		Date transCheckin = dFormat.parse(payment.getCheckin());
//		Date transCheckin = dFormat.parse(checkinStr);
		Date transCheckin = new Date(Integer.parseInt(checkinArray[5]), monthTrans(checkinArray[1]), Integer.parseInt(checkinArray[2]));
		Date transCheckout = new Date(Integer.parseInt(checkoutArray[5]), monthTrans(checkoutArray[1]), Integer.parseInt(checkoutArray[2]));
//		logger.info(transCheckin.toString(), transCheckout.toString());
		int sizeOfRoom = payment.getRoom_no().length;
		
		reserve.setMem_no(payment.getMem_no());
		reserve.setHost_no(payment.getHost_no());
//		reserve.setCheckin(checkin);
//		reserve.setCheckout(checkout);
		reserve.setCheckin(transCheckin);
		reserve.setCheckout(transCheckout);
		System.out.println("방개수" + sizeOfRoom);
		for (int i = 0; i < sizeOfRoom; i++) {
			reserve.setRoom_no(payment.getRoom_no()[i]);
			reserve.setCount(payment.getCount()[i]);
			if(payment.getCount()[i] != 0){
				reserveService.insertReservation(reserve);
//				reserveList.add(reserve);
			}
		}
		payment.setTransCheckin(transCheckin);
		payment.setTransCheckout(transCheckout);
		logger.info(payment.toString());
		mav.addObject("payment", payment);
		mav.addObject("sizeOfRoom",sizeOfRoom);
//		mav.addObject("reserveList",reserveList);
		return mav;
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	private int monthTrans(String month){
		int transMonth=0;
		switch (month) {
		case "Jan":
			transMonth = 0;
			break;
		case "Fab":
			transMonth = 1;
			break;
		case "Mar":
			transMonth = 2;
			break;
		case "Apr":
			transMonth = 3;
			break;
		case "May":
			transMonth = 4;
			break;
		case "Jun":
			transMonth = 5;
			break;
		case "Jul":
			transMonth = 6;
			break;
		case "Aug":
			transMonth = 7;
			break;
		case "Sep":
			transMonth = 8;
			break;
		case "Oct":
			transMonth = 9;
			break;
		case "Nov":
			transMonth = 10;
			break;
		case "Dec":
			transMonth = 11;
			break;
		default:
			break;
		}
		return transMonth;
	}
}
