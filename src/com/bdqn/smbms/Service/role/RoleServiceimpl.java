package src.com.bdqn.smbms.Service.role;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import src.com.bdqn.smbms.POJO.Role;
import src.com.bdqn.smbms.mapper.role.RoleMapper;

@Service
public class RoleServiceimpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;
	@Override
	public List<Role> getRoleList() {
		// TODO Auto-generated method stub
		return roleMapper.getRoleList();
	}
}
