package com.ecust.service.impl;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;

import com.ecust.dao.UserDao;
import com.ecust.pojo.Result;
import com.ecust.pojo.User;
import com.ecust.service.MailService;
import com.ecust.service.UserService;
import com.ecust.utils.EncodingTool;
import com.ecust.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterValidateService {

    @Autowired
    private MailService mailService;

    @Autowired
    private UserService userService;


    /**
     * 处理用户找回密码逻辑,
     */

    public synchronized Result findPswBack(User userIn, String url) {
        Result result = new Result();
        User currentUser = userService.queryUserByName(userIn.getUserName());
        if (currentUser == null) {
            result.setMessage("此用户不存在呢，点我去注册");
            result.setCode("signup");   // Controller 里判断 为 4 以后会 设置跳到 注册页面
            return result;
        }

        currentUser.setNewpassword(userIn.getNewpassword());
        currentUser.setActiveCode(MD5Util.encode2hex(currentUser.getUserName()));
        userService.updateUserForReNewPwd(currentUser);
        sendEmailToUserForPassword(currentUser, url);
        result.setMessage("我们已向您邮箱发了一封确认邮件，确认后生效");
        result.setCode("login");

        return result;
    }

    /**
     * 处理用户登录逻辑,不知都问什么，这里返回的咩有中文乱码，但是直接写在controller 里就有中文乱码
     */
    public synchronized Result login(User userIn, String url) {

        Result result = new Result();
        User currentUser = userService.queryUserByName(userIn.getUserName());

        // 如果用户已经注册过了，提醒用户去登录，
        if (currentUser != null) {
            if (currentUser.getStatus() != null && currentUser.getStatus() == 0) {
                result.setMessage("您注册过了，请注意查收激活邮件，点我回首页");
                result.setCode("login");

            } else {
                if (currentUser.getStatus() == 0) {
                    result.setMessage("您还没验证邮箱哦，登录邮箱去验证吧");
                    result.setCode("login");
                } else {
                    result.setMessage("此用户已经存在，您可以去直接去登录，点我回首页");
                    result.setCode("login");
                }

            }

            return result;
        }

        // 用户还未注册过，继续处理注册逻辑

        int userNums = userService.countUserNum();
        if (userNums < 50) {
            // 把用户信息写进数据库 , 并提示用户邮箱验证
            boolean bool = userService.createUser(userIn);
            if (bool) {
                // 注册成功，让用户进入邮箱验证
                sendEmailToUserForValidation(userIn, url);
                result.setMessage("注册成功，快去邮箱查看激活邮件吧，点我回首页");
                result.setCode("login");
                return result;
            } else {
                result.setMessage("注册失败，点我重新注册一次吧，点我重新注册");
                result.setCode("signup");
                return result;
            }
        } else {
            result.setMessage("该网站注册满员了，用 guest 账号登录吧<br> 用户：guest<br> 密码：guest<br>点我回首页");
            result.setCode("login");
            return result;
        }
    }

    /**
     * 处理注册
     */
    public void sendEmailToUserForValidation(User user, String url) {
        ///邮件的内容
        StringBuffer sb = new StringBuffer("点击下面链接激活账号，24小时生效 否则重新注册账号" +
                "，链接只能使用一次，请尽快确认！有任何问题可以直接回复此邮件联系我，" +
                "<br>Keep In Touch My dude<br>");
        sb.append("<a href=\"" + url + "/user/validateUser/1?email=");
        sb.append(user.getUserName());
        sb.append("&activeCode=");
        sb.append(user.getActiveCode());
        sb.append("\">" + url + "/user/validateUser/1?email=");
        sb.append(user.getUserName());
        sb.append("&activeCode=");
        sb.append(user.getActiveCode());
        sb.append("</a><br>");
        sb.append("您的用户名: " + user.getUserName());
        sb.append("<br>");
        sb.append("您的  密码: " + user.getPassword());
        sb.append("<br>");

        //发送邮件
        mailService.sendMail(user, sb.toString(), "Validate Your Account");

        System.out.println("发送邮件");

    }

    /**
     * 处理找回密码
     */
    public void sendEmailToUserForPassword(User user, String url) {
        ///邮件的内容
        StringBuffer sb = new StringBuffer("点击下面链接确认密重置密码，24小时生效，" +
                "，链接只能使用一次，请尽快激活！有任何问题可以直接回复此邮件联系我，" +
                "<br>Keep In Touch My dude<br>");
        sb.append("<a href=\"" + url + "/user/validateUser/2?email=");
        sb.append(user.getUserName());
        sb.append("&activeCode=");
        sb.append(user.getActiveCode());
        sb.append("\">" + url + "/user/validateUser/1?email=");
        sb.append(user.getUserName());
        sb.append("&activeCode=");
        sb.append(user.getActiveCode());
        sb.append("</a><br><br>");
        sb.append("您的新密码为: <font color = \"red\">" + user.getNewpassword() + "</font>");
        sb.append("</br>");

        //发送邮件
        mailService.sendMail(user, sb.toString(), "Re_New Password");

        System.out.println("发送邮件");

    }

    /**
     * 处理找回密码
     *
     * @throws ParseException
     */
    //传递激活码和email过来
    public synchronized Result processFindPassWordBack(String email, String validateCode) throws ParseException {
        Result result = null;
        //数据访问层，通过email获取用户信息
        User user = (User) userService.queryUserByName(email);

        if (user == null) {
            result = new Result("signup", "用户不存在，可能已经被移除，去注册吧");
            return result;
        }

        if (user != null && user.getStatus() == 0) {
            result = new Result("login", "您的用户名还未你激活，先去邮箱激活吧");
            return result;
        }
        //验证用户是否存在，点击链接进来激活的，用户一般都存在
        if (!validateCode.equals(user.getActiveCode())) {
            result = new Result("password", "激活邮件已经失效，点我重新找回密码吧");
            return result;
        }
        //验证用户激活状态
        if (user.getNewpassword() != null) {
            ///没激活
            Date currentTime = new Date();//获取当前时间
            //验证链接是否过期
            Date dNow = new Date();   //当前时间
            Date dBefore = new Date();
            Calendar calendar = Calendar.getInstance();  //得到日历
            calendar.setTime(dNow);//把当前时间赋给日历
            calendar.add(Calendar.DAY_OF_MONTH, -1);  //设置为前一天
            dBefore = calendar.getTime();   //得到前一天的时间
            if (dBefore.before(user.getRepwdTime())) {
                //验证激活码是否正确
                //激活成功， //并更新用户的激活状态，为已激活
                user.setPassword(user.getNewpassword());
                user.setActiveCode(MD5Util.encode2hex(user.getUserName()));
                result = new Result("login", "重置密码成功，点我去登录吧");
                userService.updateUser(user);
                return result;
            }else {
                result = new Result("login", "验证链接已经过期");
                userService.updateUser(user);
                return result;
            }
        } else {
            // 1 成功 2 重复激活 3 链接失效 4 未知错误
            // 验证邮件已经超时，拒绝验证
            // 超时后，如果该用户未验证，则删除该用户
            result = new Result("password", "新密码无效，点我重新找回密码吧");
            return result;
        }
    }


    /**
     * 处理激活
     *
     * @throws ParseException
     */
    //传递激活码和email过来
    public synchronized Result processActivate(String email, String validateCode) throws ParseException {
        Result result = null;
        //数据访问层，通过email获取用户信息
        User user = (User) userService.queryUserByName(email);
        //验证用户是否存在，点击链接进来激活的，用户一般都存在
        if (user != null) {
            //验证用户激活状态
            if (validateCode.equals(user.getActiveCode())) {
                ///没激活
                Date currentTime = new Date();//获取当前时间
                //验证链接是否过期
                Date dNow = new Date();   //当前时间
                Date dBefore = new Date();
                Calendar calendar = Calendar.getInstance();  //得到日历
                calendar.setTime(dNow);//把当前时间赋给日历
                calendar.add(Calendar.DAY_OF_MONTH, -1);  //设置为前一天
                dBefore = calendar.getTime();   //得到前一天的时间

                if (dBefore.before(user.getCreateTime())) {
                    //验证激活码是否正确
                    if (user.getStatus() == 0) {
                        //激活成功， //并更新用户的激活状态，为已激活
                        System.out.println("==sq===" + user.getStatus());
                        user.setStatus(1);//把状态改为激活
                        user.setActiveCode(MD5Util.encode2hex(user.getUserName()));
                        userService.updateUser(user); // 只有这个会更新 创建时间
                        result = new Result("login", "激活成功，点我去登录吧");
                        return result;
                    } else {
                        result = new Result("login", "您已经激活，点我去登录");
                        return result;
                    }
                } else {
                    // 验证邮件已经超时，拒绝验证
                    // 超时后，如果该用户未验证，则删除该用户
                    if (user.getStatus() == 0) {
                        userService.deleteUser(String.valueOf(user.getId()));
                    }
                    result = new Result("signup", "激活邮件已经失效，点我重新注册");
                    return result;
                }
            } else {
                result = new Result("login", "链接已经失效，不如去登录吧");
                return result;
            }
        } else {
            result = new Result("signup", "该用户已别移除，重新注册吧");
            return result;
        }
    }
}
