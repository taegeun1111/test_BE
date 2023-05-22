package com.mountain.doo.interceptor;

import com.mountain.doo.util.LoginUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Configuration
@Slf4j
public class AfterInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        HttpSession session = request.getSession(); //세션 생성
        log.info("AfterInterceptor : "+ session);
      
        if(LoginUtil.isLogin(session)){
            response.sendRedirect("/");
            return false;
        }

        return true;
    }

}
