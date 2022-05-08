package com.work.filter;

import com.work.utils.SystemConstant;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        if(request.getSession().getAttribute(SystemConstant.LOGIN_USER)==null){

            response.sendRedirect(request.getContextPath()+"/admin/login.html");
            return false;
        }
        return true;
    }
}
