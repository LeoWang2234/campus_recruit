package com.ecust;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ecust.pojo.User;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		//创建session  
        HttpSession session =request.getSession();  
        //无需登录，允许访问的地址  
        String[] allowUrls =new String[]{"/login"};  
              
        //获取请求地址  
        String url =request.getRequestURL().toString();  
         
        
        //获得session中的用户  
        Object currentUser = session.getAttribute("currentUser");
        
        
        for (String strUrl : allowUrls) {  
            if(url.contains(strUrl))  
            {  
                return true;  
            }  
        }  
        
        
        //用户未登陆或登陆过期
        if(currentUser == null)  
        {  
        	response.sendRedirect(request.getContextPath()+"/login.jsp");  
            return false;                      
        }  
        
             
        return true;  
		
		
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
