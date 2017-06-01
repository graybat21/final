package net.kh.main;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collections;
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

import net.kh.host.HostService;
import net.kh.host.HostVO;
import net.kh.reserve.ReserveService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Inject
	public ReserveService reserveService;
	@Inject
	public HostService hostService;

	@SuppressWarnings("deprecation")
	@RequestMapping("/ghList.gh")
	public ModelAndView ghList(Search search) throws Exception {
		ModelAndView mav = new ModelAndView("main/ghList/검색리스트");

		List<Map<String, Object>> reserve = reserveService.selectSearchHappy();
		// List<Date> dateList = new ArrayList<Date>();
		HashMap<String, Object> map=new HashMap<String, Object>();
		Date from = search.getFrom();
		Date to = search.getTo();
		from.setHours(13);
		to.setHours(12);
		map.put("from", from);
		map.put("to", to);
		logger.info(reserve.toString());
		reserve = validPriceSearch(reserve, search.getMax_price());
		reserve = validAddressSearch(reserve, search.getArea());
		reserve = validCountSearch(reserve, search.getParticipant());
		reserve = validDateSearch(reserve, map); // 날짜 검색에 걸리는것 뺌
		mav.addObject("reserve", reserve);
		mav.addObject(search);
		return mav;
	}

	@RequestMapping("/ghDetail.gh")
	public String ghDetail(@RequestParam("host_no") int host_no,@RequestParam(value="tab",defaultValue="1") int tab, Model model)throws Exception{
		// 호스트 정보를 받아서 보내줌
		
		HostVO host=hostService.getHostInfoByHostNo(host_no);
		logger.info(host.toString());
//		String address=host.getAddr1()+host.getAddr2()+host.getZip();
//		String tel = host.getTel();
//		model.addAttribute("address",address);
		
		model.addAttribute("hostinfo",host);
		model.addAttribute("host_no", host_no);
		model.addAttribute("tab", tab);
		System.out.println(host_no);
		System.out.println(tab);
		return "guesthouse/ghDetail/방 상세보기";
	}
	
	private List<Map<String, Object>> validDateSearch(List<Map<String, Object>> reserve,HashMap<String, Object> map) throws Exception {
		
		List<Integer> invalidHostNo = reserveService.validSearch(map);
		int sizeOfInvalidHostNo = invalidHostNo.size();
		int sizeOfList = reserve.size();
		for(int i=sizeOfList -1 ; i>=0;i--){
			for(int j=sizeOfInvalidHostNo-1;j>=0;j--){
				if(invalidHostNo.get(j).intValue() == Integer.parseInt(String.valueOf(reserve.get(i).get("HOST_NO")))){
					System.out.println("날짜불만족 삭제" + reserve.get(i).get("HOST_NO"));
					reserve.remove(i);
					j=0;
				}
			}
		}
		
//		Date checkin;
//		Date checkout;
//		for (int i = sizeOfList - 1; i >= 0; i--) {
//			checkin = (Date) reserve.get(i).get("CHECKIN");
//			checkout = (Date) reserve.get(i).get("CHECKOUT");
//			checkin.setHours(13);
//			checkout.setHours(12);
//			if (checkout.before(from) || checkin.after(to)) {
//				
//			} else {
//				System.out.println("날짜 불만족 삭제" + reserve.get(i).get("NAME"));
//				reserve.remove(i);
//			}
//		}
		return reserve;
	}

	private List<Map<String, Object>> validPriceSearch(List<Map<String, Object>> reserve, int max_price) {
		int sizeOfList = reserve.size();
		for (int i = sizeOfList - 1; i >= 0; i--) {
			if (Integer.parseInt((String) reserve.get(i).get("PRICE")) > max_price) {
				System.out.println("가격불만족 삭제" + reserve.get(i).get("NAME"));
				reserve.remove(i);
			}
		}
		return reserve;
	}

	private List<Map<String, Object>> validCountSearch(List<Map<String, Object>> reserve, int participants) {
		int sizeOfList = reserve.size();
		int max;
		for (int i = sizeOfList - 1; i >= 0; i--) {
			max = Integer.parseInt(String.valueOf(reserve.get(i).get("MAX")));
			if (max < participants) {
				System.out.println("인원수불만족 삭제 " + reserve.get(i).get("NAME"));
				reserve.remove(i);
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
				System.out.println("주소 불만족 삭제 " + reserve.get(i).get("NAME"));
				reserve.remove(i);
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
		Collections.shuffle(mainlist);
		model.addAttribute("list", mainlist);
		return "main/main/ma";
	}

}
