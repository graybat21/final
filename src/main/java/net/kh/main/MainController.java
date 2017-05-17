package net.kh.main;
//package net.kh.main;
//
//import java.util.List;
//
//import javax.annotation.Resource;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.mycom.goods.GoodsModel;
//import com.mycom.goods.GoodsService;
//
//@Controller
//public class MainController {
//	
//	@Resource(name="goodsService")
//	private GoodsService goodsService;
//	
//	ModelAndView mav = new ModelAndView();
//	
//	
//	@RequestMapping(value="/main.dog")
//	public ModelAndView mainForm(){
//		
//		//goods ��ǰ���� �⺻=0, ��õ=1, ����Ʈ=2, �Ż�=3�� ���� ���� ���������� ����
//		List<GoodsModel> goodsSelectList1 = goodsService.goodsSelectList1("1");
//		List<GoodsModel> goodsSelectList2 = goodsService.goodsSelectList1("2");
//		List<GoodsModel> goodsSelectList3 = goodsService.goodsSelectList1("3");
//		
//		
//		mav.addObject("goodsList1", goodsSelectList1);
//		mav.addObject("goodsList2", goodsSelectList2);	
//		mav.addObject("goodsList3", goodsSelectList3);	
//		mav.setViewName("mainForm");
//		return mav;
//	}
//	
//	@RequestMapping(value="/logchek.dog")
//	public ModelAndView logchek(){
//		
//		mav.setViewName("basket/basketAddError");
//		
//		return mav;
//	}
//	
//	
//}
