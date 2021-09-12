package com.hong.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckHandler extends HandlerInterceptorAdapter
{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception
	{
		
		if( request.getSession().getAttribute("UserVO") == null )
		{
			response.sendRedirect( request.getContextPath()+"/login" );
			return false;
		}else
		{
			return true;
		}
	}
}
