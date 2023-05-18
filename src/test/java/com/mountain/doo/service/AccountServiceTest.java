package com.mountain.doo.service;

import com.mountain.doo.entity.Account;
import com.mountain.doo.entity.GENDER;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class AccountServiceTest {

    @Autowired
    AccountService accountService;

    @Test
    @DisplayName("DB에 회원정보 하나가 쌓여야 한다")
    void save(){
        Account s = new Account();
        s.setAccountId("135");
        s.setPassword("135");
        s.setName("135");
        s.setGender(GENDER.M);
        s.setEmail("135");
        s.setPhoneNo("135");
        s.setAddress("135");


        boolean save = accountService.save(s);
        assertTrue(save);


    }
}