package com.mountain.doo.service;

import com.mountain.doo.dto.LoginRequestDTO;
import com.mountain.doo.entity.Account;
import com.mountain.doo.entity.GENDER;
import com.mountain.doo.entity.LoginBoolean;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class AccountServiceTest {

    @Autowired
    AccountService accountService;
    PasswordEncoder encoder;



    @Test
    @DisplayName("DB에 회원정보 하나가 쌓여야 한다")
    void save(){
        Account save = new Account();
        save.setAccountId("777");
        save.setPassword("123a2sd");
        save.setName("123");
        save.setGender(GENDER.M);
        save.setEmail("11");
        save.setPhoneNo("00");
        save.setAddress("88");

        boolean isSaved = accountService.save(save);
        assertTrue(isSaved);

    }

    @Test
    @DisplayName("아이디 비밀번호 받아 맞는 정보 있으면 true 아니면 false")
    void login(){
        LoginRequestDTO dto = new LoginRequestDTO();
        dto.setAccount("777");
        dto.setPassword("123a2sd");
        dto.setAutoLogin(false);

        boolean a = accountService.login(dto);
        assertTrue(a);
    }
}