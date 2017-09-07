package com.ecust.controller;

import com.ecust.pojo.MyCopyMessage;
import com.ecust.pojo.User;
import com.ecust.service.MyCopyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by cheng on 2017/8/31.
 */
@Controller
@RequestMapping("/copy")
public class MyCopyController {

    @Autowired
    private MyCopyService myCopyService;

    @ResponseBody
    @RequestMapping(value="/getText",method = RequestMethod.GET,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Map<String, Object> getText(HttpServletRequest request) {

        //创建session
        HttpSession session = request.getSession();

        //获得session中的用户
        User currentUser = (User) session.getAttribute("currentUser");

        return myCopyService.getText(currentUser.getId()+"");
    }

    public void clear() {

    }

    @ResponseBody
    @RequestMapping(value="/setText",method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public boolean setText(@RequestBody MyCopyMessage myCopyMessage, HttpServletRequest request) {

        //创建session
        HttpSession session = request.getSession();

        //获得session中的用户
        User currentUser = (User) session.getAttribute("currentUser");

        myCopyMessage.setUserId(currentUser.getId()+"");

        myCopyService.setText(myCopyMessage);

        return true;
    }

}
