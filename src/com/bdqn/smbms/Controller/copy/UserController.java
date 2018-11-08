package src.com.bdqn.smbms.Controller.copy;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import src.com.bdqn.smbms.POJO.Role;
import src.com.bdqn.smbms.POJO.User;
import src.com.bdqn.smbms.Service.user.UserService;

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
	
	@RequestMapping("/pageUser")
	@ResponseBody
	public Map<String, Object> pageUser(int page, int limit,String userName){
		int count = service.count(userName);
		List<User> list = service.getUserList(userName, page, limit);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", count);
		map.put("data", list);
		return map;
	}
	
	@RequestMapping("/delUser")
	@ResponseBody
	public String delUser(int id) {
		int result = service.deleteByUserId(id);
		if(result > 0) {
			return "true";
		} else {
			return "false";
		}
	}
	
	@RequestMapping("/getUserListById")
	public ModelAndView getUserListById(int id) {
		ModelAndView mv = new ModelAndView();
		User user = service.getUserListById(id);
		mv.addObject("user", user);
		mv.setViewName("userUpdate");
		return mv;
	}
	
	@RequestMapping("/getRole")
	@ResponseBody
	public String getRole() {
		List<Role> list = service.getRoleList();
		return JSON.toJSONString(list);
	}
	
	@RequestMapping("/addUser")
	@ResponseBody
	public String addUser(User user, HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		user.setCreatedBy(u.getId());
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simpleDateFormat.format(new Date());
		user.setCreationDate(date);
		int result = service.add(user);
		if(result > 0) {
			return "true";
		} else {
			return "false";
		}
	}
	
	@RequestMapping("/updateUser")
	@ResponseBody
	public String updateUser(User user, HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		user.setModifyBy(u.getId());
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simpleDateFormat.format(new Date());
		user.setModifyDate(date);
		int result = service.modify(user);
		if(result > 0) {
			return "true";
		} else {
			return "false";
		}
	}
}
