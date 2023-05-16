package com.mountain.doo.interceptor;

import com.mountain.doo.util.LoginUtil;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AfterInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        HttpSession session = request.getSession();

        if(LoginUtil.isLogin(session)){
            response.sendRedirect("/");
            return false;
        }
        return true;


    }
}
