package com.bdqn.smbms.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bdqn.smbms.POJO.User;
import com.bdqn.smbms.Service.user.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService service;
	
	@RequestMapping("/login")
	@ResponseBody
	public String userLogin(String userCode, String userPwd, HttpServletRequest request) {
		User u = service.loginByUser(userCode, userPwd);
		if(u != null) {
			request.getSession().setAttribute("user", u);
			return "true";
		} else {
			return "false";
		}
	}
	
}
