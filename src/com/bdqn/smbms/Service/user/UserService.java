package com.bdqn.smbms.Service.user;

import java.util.List;
import com.bdqn.smbms.POJO.Role;
import com.bdqn.smbms.POJO.User;

/**
 * 用户业务类
 * @author SUGAR
 *
 */
public interface UserService {
	//添加用户信息
	public int add(User user);
	//修改用户信息
	public int modify(User user);
	//修改密码
	public int updatePwd(Integer id, String pwd);
	//通过用户id删除
	public int deleteByUserId(Integer id);
	//用户登录
	public User loginByUser(String userCode, String userPwd);
	//查询所有角色用户
	public List<Role> getRoleList();
	//根据分页查询所有用户列表
	public List<User> getUserList(String userName, Integer from, Integer pageSize);
	//统计用户总数
	public int count(String userName);
	//根据id查询用户信息
	public User getUserListById(Integer id);
}
