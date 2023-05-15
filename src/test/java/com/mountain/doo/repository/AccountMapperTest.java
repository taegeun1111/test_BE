package com.mountain.doo.repository;

import com.mountain.doo.dto.AccountModifyDTO;
import com.mountain.doo.entity.Account;
import com.mountain.doo.entity.GENDER;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class AccountMapperTest {

    @Autowired
    AccountMapper mapper;

    @Test
    @DisplayName("DB에 회원정보 하나가 쌓여야 한다")
    void save(){
        Account save = new Account();
        save.setAccountId("3");
        save.setPassword("4");
        save.setName("5");
        save.setGender(GENDER.M);
        save.setEmail("5");
        save.setPhoneNo("5");
        save.setAddress("5");

        boolean isSaved = mapper.save(save);
        assertTrue(isSaved);

    }

    @Test
    @DisplayName("아이디로 회원정보 전체 검색하기")
    void searchInfoById(){
        AccountModifyDTO account = mapper.searchInfoById("id");
        System.out.println("account = " + account);


    }

    @Test
    @DisplayName("해당 아이디로 회원정보를 찾고 dto 정보를 수정하여 db에 저장해야 한다")
    void modify(){
       AccountModifyDTO build = new AccountModifyDTO();
        build.setPassword("444");
        build.setEmail("44");
        build.setPhoneNo("44");
        build.setAddress("444444444");
        build.setAccountId("1");

        boolean b = mapper.modifyInfo(build);
        System.out.println("b = " + b);
        assertTrue(b);


    }

}