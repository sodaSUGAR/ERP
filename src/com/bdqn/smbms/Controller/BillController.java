package src.com.bdqn.smbms.Controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import src.com.bdqn.smbms.POJO.Bill;
import src.com.bdqn.smbms.POJO.Provider;
import src.com.bdqn.smbms.POJO.User;
import src.com.bdqn.smbms.Service.bill.BillService;

@Controller
public class BillController {
	
	@Autowired
	private BillService service;

	@RequestMapping("/pageBill")
	@ResponseBody
	public Map<String, Object> pageBill(int page, int limit,String proName) {
		int count = service.getBillCount(proName);
		List<Bill> list = service.getBillList(page, limit, proName);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", count);
		map.put("data", list);
		return map;
	}
	
	@RequestMapping("/dellBill")
	@ResponseBody
	public String delBill(int id) {
		int result = service.deleteByBillId(id);
		if(result > 0) {
			return "true";
		} else {
			return "false";
		}
	}
	
	@RequestMapping("/getBillListById")
	public ModelAndView getBillListById(int id) {
		ModelAndView mv = new ModelAndView();
		Bill bill = service.getBillById(id);
		mv.addObject("bill", bill);
		mv.setViewName("billUpdate");
		return mv;
	}
	
	@RequestMapping("/getProvider")
	@ResponseBody
	public String getProvider() {
		List<Provider> list = service.getProviderList();
		return JSON.toJSONString(list);
	}
	
	@RequestMapping("/addBill")
	@ResponseBody
	public String addBill(@ModelAttribute Bill bill, HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		bill.setCreatedBy(u.getId());
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simpleDateFormat.format(new Date());
		bill.setCreationDate(date);
		int result = service.add(bill);
		if(result > 0) {
			return "true";
		} else {
			return "false";
		}
	}
	
	@RequestMapping("/updateBill")
	@ResponseBody
	public String updateBill(@ModelAttribute Bill bill, HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		bill.setModifyBy(u.getId());
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simpleDateFormat.format(new Date());
		bill.setModifyDate(date);
		
		int result = service.modify(bill);
		System.out.println(result);
		if(result > 0) {
			return "true";
		} else {
			return "false";
		}
	}
}
