package com.bdqn.smbms.mapper.user;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.bdqn.smbms.POJO.Role;
import com.bdqn.smbms.POJO.User;

public interface UserMapper {
	//添加用户信息
	public int add(User user);
	//修改用户信息
	public int modify(User user);
	//修改密码
	public int updatePwd(@Param("id")Integer id, @Param("pwd")String pwd);
	//通过用户id删除
	public int deleteByUserId(@Param("id")Integer id);
	//用户登录
	public User loginByUser(@Param("userCode")String userCode,@Param("userPassword")String userPwd);
	//查询所有用户角色
	public List<Role> getRoleList();
	//查询所有用户信息并进行分页
	public List<User> getUserList(@Param("userName")String userName,@Param("userRole")Integer userRole,@Param("from")Integer from, @Param("pageSize")Integer pageSize);
	//统计总数量
	public int count();
	//根据uid查询用户信息
	public User getUserListById(@Param("id")Integer id);
}
