package com.mountain.doo.util;

import javax.servlet.http.HttpSession;

//회원 인증 인가 관련 상수와 메서드 가진 객체
public class LoginUtil {

    //로그인 세션 키
    public static final String LOGIN_KEY = "login";

    //로그인 여부 확인
    public static boolean isLogin(HttpSession session){
        return session.getAttribute(LOGIN_KEY)!=null;
    }


}
