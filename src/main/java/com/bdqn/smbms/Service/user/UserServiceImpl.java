package com.bdqn.smbms.Service.user;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.bdqn.smbms.POJO.Role;
import com.bdqn.smbms.POJO.User;
import com.bdqn.smbms.mapper.user.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	private static Logger logger = Logger.getLogger(UserServiceImpl.class);
	@Autowired
	private UserMapper userMapper;
	
	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor= {RuntimeException.class})
	public int add(User user) {
		return userMapper.add(user);
	}

	@Override
	public int modify(User user) {
		return userMapper.modify(user);
	}

	@Override
	public int updatePwd(@Param("id")Integer id, @Param("pwd")String pwd) {
		return userMapper.updatePwd(id, pwd);
	}

	@Override
	public int deleteByUserId(@Param("id")Integer id) {
		return userMapper.deleteByUserId(id);
	}

	@Override
	public User loginByUser(@Param("userCode")String userCode,@Param("userPassword")String userPwd) {
		logger.info("UserServiceImpl welcome SMBMS =========");
		User user = null;
		user = userMapper.loginByUser(userCode, userPwd);
		
		//匹配密码
//		if(null != user) {
//			if(!user.getUserPassword().equals(userPwd)) {
//				user = null;
//			}
//		}
		return user;
	}

	@Override
	public List<Role> getRoleList() {
		return userMapper.getRoleList();
	}

	@Override
	public List<User> getUserList(String userName, Integer userRole, Integer from, Integer pageSize) {
		from = (from - 1) * pageSize;
		return userMapper.getUserList(userName, userRole, from, pageSize);
	}

	@Override
	public int count() {
		return userMapper.count();
	}

	@Override
	public User getUserListById(Integer id) {
		return userMapper.getUserListById(id);
	}

}
