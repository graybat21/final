package net.kh.main;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.kh.reserve.ReserveService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Inject
	public ReserveService reserveService;

	@SuppressWarnings("deprecation")
	@RequestMapping("/ghList.gh")
	public ModelAndView ghList(Search search) throws Exception {
		ModelAndView mav = new ModelAndView("main/ghList/검색리스트");

		List<Map<String, Object>> reserve = reserveService.selectSearchHappy();
		// List<Date> dateList = new ArrayList<Date>();
		Date from = search.getFrom();
		Date to = search.getTo();

		from.setHours(13);
		to.setHours(12);
		
		reserve = validDateSearch(reserve, from, to); // 날짜 검색에 걸리는것 뺌
		reserve = validPriceSearch(reserve, search.getMax_price());
		reserve = validAddressSearch(reserve, search.getArea());
		reserve = validCountSearch(reserve, search.getParticipant());
		mav.addObject("reserve", reserve);
		mav.addObject(search);
		return mav;
	}

	@RequestMapping("/ghDetail.gh")
	public String ghDetail(@RequestParam("no") int no, Model model)throws Exception{
		// 호스트 정보를 받아서 보내줌
		model.addAttribute("detail", no);
		
		return "guesthouse/ghDetail/방 상세보기";
	}
	
	@SuppressWarnings("deprecation")
	private List<Map<String, Object>> validDateSearch(List<Map<String, Object>> reserve, Date from, Date to) {
		Date checkin;
		Date checkout;
		int sizeOfList = reserve.size();
		for (int i = sizeOfList - 1; i >= 0; i--) {
			checkin = (Date) reserve.get(i).get("CHECKIN");
			checkout = (Date) reserve.get(i).get("CHECKOUT");
			checkin.setHours(13);
			checkout.setHours(12);
			if (((Date) reserve.get(i).get("CHECKOUT")).before(from)
					|| ((Date) reserve.get(i).get("CHECKIN")).after(to)) {
			} else {
				System.out.println("날짜 불만족 삭제" + reserve.get(i).get("NAME"));
				reserve.remove(i);
			}
		}
		return reserve;
	}

	private List<Map<String, Object>> validPriceSearch(List<Map<String, Object>> reserve, int max_price) {
		int sizeOfList = reserve.size();
		for (int i = sizeOfList - 1; i >= 0; i--) {
			if (Integer.parseInt((String) reserve.get(i).get("PRICE")) > max_price) {
				reserve.remove(i);
				System.out.println("가격불만족 삭제" + reserve.get(i).get("NAME"));
			}
		}
		return reserve;
	}

	private List<Map<String, Object>> validCountSearch(List<Map<String, Object>> reserve, int participants) {
		int sizeOfList = reserve.size();
		int max;
		int count;
		for (int i = sizeOfList - 1; i >= 0; i--) {
			max = Integer.parseInt(String.valueOf(reserve.get(i).get("MAX")));
			count = Integer.parseInt(String.valueOf(reserve.get(i).get("COUNT")));
			System.out.println(max + "..." + count);
			if (max - count < participants) {
				reserve.remove(i);
				System.out.println("인원수불만족 삭제 " + reserve.get(i).get("NAME"));
			}
		}
		return reserve;
	}

	private List<Map<String, Object>> validAddressSearch(List<Map<String, Object>> reserve, String area) {
		int sizeOfList = reserve.size();
		String addr1;
		for (int i = sizeOfList - 1; i >= 0; i--) {
			addr1 = (String) reserve.get(i).get("ADDR1");
			if (!addr1.contains(area)) {
				reserve.remove(i);
				System.out.println("주소 불만족 삭제 " + reserve.get(i).get("NAME"));
			}
		}
		return reserve;
	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@Resource
	private MainService main;

	@SuppressWarnings("unchecked")
	@RequestMapping("/main.gh")
	public String main(Model model) throws Exception{
		List<HashMap<String, Object>> mainlist = main.main();
		model.addAttribute("list", mainlist);
		return "main/main/ma";
	}

}
