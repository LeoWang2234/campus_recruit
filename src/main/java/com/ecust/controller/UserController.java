package com.ecust.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ecust.pojo.User;
import com.ecust.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(User user,HttpServletRequest request){
		String name = request.getParameter("userName");
		String password = request.getParameter("password");
		//用户名或密码为空,用户输入账号或密码不能为字符串“null”
		if(name == null || password == null){
			request.setAttribute("loginMsg","用户名或密码不能为空");
			return "forward:/login.jsp";
		}
		//注册时进行空格等信息的过滤
		if(!(name.trim().length()>0 && password.trim().length()>0)){
			request.setAttribute("loginMsg","用户名或密码非法不能登录");
			return "forward:/login.jsp";
		}
		User currentUser = userService.login(user);
		if(currentUser == null){
			request.setAttribute("loginMsg", "用户名或密码错误！");
			return "forward:/login.jsp";
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", currentUser);
			/*session.setAttribute("mainJsp","main/default.jsp");*/
			return "forward:/WEB-INF/views/main.jsp";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		
		session.invalidate();
		
		return "redirect:/login.jsp";
		
	}
	
	
	
}
