package com.bdqn.smbms;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bdqn.smbms.POJO.Bill;
import com.bdqn.smbms.Service.bill.BillService;

public class Test {

	public static void main(String[] args) {
			ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
			BillService service = (BillService) ctx.getBean("billServiceImpl");
			Bill bill = new Bill();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = simpleDateFormat.format(new Date());
			bill.setBillCode("BILL2016_0019");
			bill.setProductDesc("日用品-洗发、护发");
			bill.setProductName("洗发水、护发素");
			bill.setProductUnit("瓶");
			bill.setProductCount(500.0);
			bill.setTotalPrice(25000.0);
			bill.setProviderId(7);
			bill.setIsPayment(2);
			bill.setModifyBy(16);
			bill.setModifyDate(date);
			
			int result = service.add(bill);
			System.out.println(result);
			
		
	}

}
