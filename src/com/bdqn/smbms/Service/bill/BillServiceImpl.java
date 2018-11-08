package src.com.bdqn.smbms.Service.bill;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import src.com.bdqn.smbms.POJO.Bill;
import src.com.bdqn.smbms.POJO.Provider;
import src.com.bdqn.smbms.mapper.bill.BillMapper;

@Service
public class BillServiceImpl implements BillService {

	@Autowired
	private BillMapper billMapper;
	
	@Override
	public int add(Bill bill) {
		int result = billMapper.add(bill);
		return result;
	}

	@Override
	public int deleteByBillId(Integer id) {
		int result = billMapper.deleteByBillId(id);
		return result;
	}

	@Override
	public int modify(Bill bill) {
		int result = billMapper.modify(bill);
		return result;
	}

	@Override
	public Bill getBillById(Integer id) {
		Bill bill = billMapper.getBillById(id);
		return bill;
	}

	@Override
	public List<Bill> getBillList(Integer pageNo,Integer pageSize,String proName) {
		pageNo = (pageNo - 1) * pageSize;
		List<Bill> list = billMapper.getBillList( pageNo, pageSize, proName);
		return list;
	}

	@Override
	public int getBillCount(String proName) {
		return billMapper.getBillCount(proName);
	}

	@Override
	public List<Provider> getProviderList() {
		return billMapper.getProviderList();
	}

}
