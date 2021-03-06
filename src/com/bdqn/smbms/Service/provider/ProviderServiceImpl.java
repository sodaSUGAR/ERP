package src.com.bdqn.smbms.Service.provider;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import src.com.bdqn.smbms.POJO.Provider;
import src.com.bdqn.smbms.mapper.provider.ProviderMapper;

@Service
public class ProviderServiceImpl implements ProviderService {

	@Autowired
	private ProviderMapper providerMapper;
	
	public int add(Provider provider) {
		return providerMapper.add(provider);
	}

	public int modify(Provider provider) {
		return providerMapper.modify(provider);
	}

	public Provider getProviderById(Integer id) {
		return providerMapper.getProviderById(id);
	}

	@Override
	public int deleteByProviderId(Integer id) {
		return providerMapper.deleteByProviderId(id);
	}

	public List<Provider> getProviderList(String proName, String proCode) {
		return providerMapper.getProviderList(proName, proCode);
	}

}
