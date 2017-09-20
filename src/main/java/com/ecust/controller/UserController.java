package com.ecust.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.Map;

import javax.imageio.spi.RegisterableService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ecust.pojo.RUser;
import com.ecust.pojo.Result;
import com.ecust.service.impl.RegisterValidateService;
import com.ecust.utils.DataTrans;
import com.ecust.utils.EncodingTool;
import com.ecust.utils.MD5Util;
import com.sun.org.apache.regexp.internal.RE;
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
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RegisterValidateService registerValidateService;

    //登录
    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request) {
        String name = request.getParameter("userName");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        // 用户已经登录了，无需重复登录,跳转回主页
        if (currentUser != null) {
            // 现在 currentUser 不为空，说明可能是错误页面跳转过来的，也可能是超时页面重新登录的

            // 此时是超时页面跳转过来的
            if (name != null) {
                if (name.equals(currentUser.getUserName())) {
                    return "forward:/WEB-INF/views/main.jsp";
                } else {
                    // 登录传进来的名字和 session 里的名字对不上，跳转到登录页面
                    request.setAttribute("loginMsg", "input your info please");
                    return "forward:/login.jsp";
                }
            }

            return "forward:/WEB-INF/views/main.jsp";
        }

        //用户名或密码为空,用户输入账号或密码不能为字符串“null”
        if (name == null || password == null) {
            request.setAttribute("loginMsg", "input your info please");
            return "forward:/login.jsp";
        }
        //注册时进行空格等信息的过滤
        if (!(name.trim().length() > 0 && password.trim().length() > 0)) {
            request.setAttribute("loginMsg", "invalid input");
            return "forward:/login.jsp";
        }
        currentUser = userService.login(user);


        if (currentUser == null) {
            request.setAttribute("loginMsg", "username or password is wrong");
            return "forward:/login.jsp";
        } else {
            if (currentUser.getStatus() != null && currentUser.getStatus() == 0) {
                request.setAttribute("loginMsg", "Check Email for validation first please");
                return "forward:/login.jsp";
            }
            session.setAttribute("currentUser", currentUser);
            return "forward:/WEB-INF/views/main.jsp";
        }
    }

    //退出
    @RequestMapping("/logout")
    public String logout(HttpSession session) {

        session.invalidate();

        return "redirect:/login.jsp";

    }

    //首页
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home() {
        return "main/home";
    }

    //切换到list.jsp
    @RequestMapping(value = "/pageUser", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String pageDepartment(HttpServletRequest request) {

        return "user/list";
    }

    //查询所有用户
    @ResponseBody
    @RequestMapping(value = "/queryAllUser", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    //page传入页码
    public Map<String, Object> queryAllDepartment(@RequestParam("pageNo") Integer pageNo, @RequestParam("pageSize") Integer pageSize) {
        Map<String, Object> map = userService.queryAllUser(pageNo, pageSize);
        return map;
    }

    //添加角色
    @RequestMapping(value = "/createUser/{action}", method = RequestMethod.GET)
    public String createUserGet(HttpServletRequest request) throws UnsupportedEncodingException {
        return "forward:/login.jsp";
    }

    //添加角色
    @ResponseBody
    @RequestMapping(value = "/createUser/{action}", method = RequestMethod.POST)
    public ModelAndView createUser(HttpServletRequest request, @PathVariable int action) throws UnsupportedEncodingException {

        String url = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

        String name = request.getParameter("userName");
        String password = request.getParameter("password");

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("user/validation");


        Result result = null;
        User user = new User();
        if (action == 2) {
            // 此时是找回密码的逻辑
            user.setUserName(name);
            user.setNewpassword(password);
            user.setActiveCode(MD5Util.encode2hex(name));
            result = registerValidateService.findPswBack(user, url);
        } else {
            // 用户注册的逻辑
            user.setRoleName("user");
            user.setPassword(password);
            // 设置激活状态，默认未激活
            user.setStatus(0);
            user.setUserName(name);
            user.setActiveCode(MD5Util.encode2hex(name));
            result = registerValidateService.login(user, url);
        }

        modelAndView.addObject("message", result.getMessage());

        if (result.getCode().equals("signup")) {
            modelAndView.addObject("url", url + "/signup");
        } else {
            // 去登录
            modelAndView.addObject("url", url);
        }
        return modelAndView;
    }


    //获取要修改的用户
    @ResponseBody
    @RequestMapping(value = "/validateUser/{action}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ModelAndView validateUser(@PathVariable("action") int action,
                                     @RequestParam("email") String name,
                                     @RequestParam("activeCode") String activeCode, HttpServletRequest request) {

        String url = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("user/validation");

        Result result = null;
        try {
            if (action == 1) {
                result = registerValidateService.processActivate(name, activeCode);
            }else {
                result = registerValidateService.processFindPassWordBack(name, activeCode);
            }
            modelAndView.addObject("message", result.getMessage());
            if (result.getCode().equals("login")) {
                modelAndView.addObject("url", url);
            }
            if (result.getCode().equals("signup")) {
                modelAndView.addObject("url", url + "/signup");
            }
            if (result.getCode().equals("password")) {
                modelAndView.addObject("url", url + "/findpasswordback");
            }
        } catch (ParseException e) {
            modelAndView.addObject("message", "Server internal Error");
        }

        return modelAndView;
    }


    //获取要修改的用户
    @ResponseBody
    @RequestMapping(value = "/queryUserById", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Map<String, Object> queryUserById(@RequestParam("id") int id) {
        Map<String, Object> map = userService.queryUserById(id);
        return map;
    }

    //更新设备
    @ResponseBody
    @RequestMapping(value = "/updateUser", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public boolean updateUser(@RequestBody User user) {
        Boolean bool = userService.updateUser(user);
        return bool;
    }

    //删除用户
    @ResponseBody
    @RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public boolean deleteUser(@PathVariable("id") String id) {
        Boolean bool = userService.deleteUser(id);
        return bool;
    }

    //切换到list.jsp
    @RequestMapping(value = "/pageRole", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String pageRole(HttpServletRequest request) {

        return "user/roleList";
    }

    //查询所有角色
    @ResponseBody
    @RequestMapping(value = "/queryAllRole", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Map<String, Object> queryAllRole() {
        Map<String, Object> map = userService.queryAllRole();
        return map;
    }

    //添加角色
    @ResponseBody
    @RequestMapping(value = "/createRole", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public boolean createEquipment(@RequestBody Map<String, String> param) {
        String createId = param.get("createId");
        String roleName = param.get("roleName");
        String remark = param.get("remark");
        boolean bool = userService.createRole(createId, roleName, remark);
        return bool;
    }

    //删除角色
    @ResponseBody
    @RequestMapping(value = "/deleteRole/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public boolean deleteRole(@PathVariable("id") String id) {
        Boolean bool = userService.deleteRole(id);
        return bool;
    }
}
