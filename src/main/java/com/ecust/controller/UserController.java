package com.ecust.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecust.pojo.Equipment;
import com.ecust.pojo.User;
import com.ecust.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//登录
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
			return "forward:/WEB-INF/views/main.jsp";
		}
	}
	//退出
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		
		session.invalidate();
		
		return "redirect:/login.jsp";
		
	}
	
	//首页
	@RequestMapping(value ="/home",method = RequestMethod.GET)
	public String home(){
		return "main/home";
	}
	
	//切换到list.jsp
	@RequestMapping(value="/pageUser",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String pageDepartment(HttpServletRequest request){
	
		return "user/list";
	}
	
	//查询所有用户
	@ResponseBody
	@RequestMapping(value="/queryAllUser",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	//page传入页码
	public Map<String,Object> queryAllDepartment(@RequestParam("pageNo")Integer pageNo,@RequestParam("pageSize")Integer pageSize){
		Map<String,Object> map  = userService.queryAllUser(pageNo,pageSize);
		return map;
	}
	
	//添加角色
	@ResponseBody
	@RequestMapping(value="/createUser",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean createUser(@RequestBody User user){
		
		boolean bool = userService.createUser(user);
		return bool;
	}
	
	//获取要修改的用户
	@ResponseBody
	@RequestMapping(value="/queryUserById",method = RequestMethod.GET,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String,Object> queryUserById(@RequestParam("id")int id){
		Map<String,Object> map = userService.queryUserById(id);
		return map;
	}
	
	//更新设备
	@ResponseBody
	@RequestMapping(value="/updateUser",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean updateUser(@RequestBody User user){
		Boolean bool = userService.updateUser(user);
		return bool;
	}
	
	//删除用户
	@ResponseBody
	@RequestMapping(value="/deleteUser/{id}",method = RequestMethod.GET,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean deleteUser(@PathVariable("id") String id){
		Boolean bool = userService.deleteUser(id);
		return bool;
	}
	
	//切换到list.jsp
	@RequestMapping(value="/pageRole",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String pageRole(HttpServletRequest request){
	
		return "user/roleList";
	}
	
	//查询所有角色
	@ResponseBody
	@RequestMapping(value="/queryAllRole",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String,Object> queryAllRole(){
		Map<String,Object> map  = userService.queryAllRole();
		return map;
	}
	
	//添加角色
	@ResponseBody
	@RequestMapping(value="/createRole",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean createEquipment(@RequestBody Map<String,String> param){
		String createId = param.get("createId");
		String roleName = param.get("roleName");
		String remark = param.get("remark");
		boolean bool = userService.createRole(createId,roleName,remark);
		return bool;
	}
	
	//删除角色
	@ResponseBody
	@RequestMapping(value="/deleteRole/{id}",method = RequestMethod.GET,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean deleteRole(@PathVariable("id") String id){
		Boolean bool = userService.deleteRole(id);
		return bool;
	}
}
