package src.com.bdqn.smbms.Service.provider;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import src.com.bdqn.smbms.POJO.Provider;

public interface ProviderService {
	//添加供应商
	public int add(Provider provider);
	//修改供应商信息
	public int modify(Provider provider);
	//通过proId获取Provider
	public Provider getProviderById(@Param("id")Integer id);
	//通过供应商id删除
	public int deleteByProviderId(@Param("id")Integer id);
	//通过供应商名称、编码获取供应商列表-模糊查询-providerList
	public List<Provider> getProviderList(@Param("proName")String proName, @Param("proCode")String proCode);
}
