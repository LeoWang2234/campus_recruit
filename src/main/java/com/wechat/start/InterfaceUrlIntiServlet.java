package com.wechat.start;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

/**
 * ClassName: InterfaceUrlIntiServlet
 * @Description: 项目启动初始化 servlet
 * @author dapengniao
 * @date 2016 年 3 月 10 日 下午 4:08:43
 */
public class InterfaceUrlIntiServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    public void init(ServletConfig config) throws ServletException {
        InterfaceUrlInti.init();
    }

}