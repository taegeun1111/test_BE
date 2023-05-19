package com.mountain.doo.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;

@SpringBootTest
class LoginTimeMapperTest {

    @Autowired
    LoginTimeMapper mapper;

    @Test
    public void findLoginTimeTest(){
        String accountId = "1111";
        LocalDate loginTime = mapper.findLoginTime(accountId);
        System.out.println("loginTime : "+loginTime);
//
//        Period period = Period.between(loginTime, LocalDate.now());
//        int days = period.getDays();
//        System.out.println("날짜 차이 : "+days);
//
//        if(days>=1){
//            LocalDate currentLoginTime = LocalDate.now();
//            mapper.updateLoginTime(accountId,currentLoginTime);
//        }
    }
}