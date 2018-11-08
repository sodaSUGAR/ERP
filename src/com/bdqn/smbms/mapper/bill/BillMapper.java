package com.bdqn.smbms.mapper.bill;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.bdqn.smbms.POJO.Bill;
import com.bdqn.smbms.POJO.Provider;

public interface BillMapper {
	//添加订单信息
	public int add(Bill bill);
	//通过订单id删除
	public int deleteByBillId(@Param("id")Integer id);
	//修改订单信息
	public int modify(Bill bill);
	//通过billId获取Bill
	public Bill getBillById(@Param("id")Integer id);
	//獲取所有訂單數量
	public int getBillCount(@Param("productName")String proName);
	//通过查询条件获取供应商列表-模糊查询-getBillList
	public List<Bill> getBillList(@Param("pageNo")Integer pageNo, @Param("pageSize")Integer pageSize, @Param("productName")String proName);
	//根据供应商ID查询订单数量
	public int getBillCountByProviderId(@Param("providerId")Integer providerId);
	//在订单里查询所有供应商集合
	public List<Provider> getProviderList();
}
