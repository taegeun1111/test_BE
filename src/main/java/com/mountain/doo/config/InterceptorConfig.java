package com.mountain.doo.config;

//인터셉터 관련 설정

import com.mountain.doo.interceptor.BoardInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor
public class InterceptorConfig implements WebMvcConfigurer {

    private final BoardInterceptor boardInterceptor;

    //인터셉터 설정 등록
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //게시판 인터셉터 설정
        registry.addInterceptor(boardInterceptor)
        .addPathPatterns("/board/*")      //어떤 경로 인터셉터 실행할것인가
        .excludePathPatterns("/board리스트","/board상세보기");     //실행하지 않을 경로
   }


}
