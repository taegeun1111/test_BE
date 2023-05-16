package com.mountain.doo.repository;

import com.mountain.doo.dto.AccountModifyDTO;
import com.mountain.doo.entity.Account;
import com.mountain.doo.entity.GENDER;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class AccountMapperTest {

    @Autowired
    AccountMapper mapper;

    @Test
    @DisplayName("마이페이지 정보 조회")
    void mypage(){
        String id="3";
        Account account = mapper.myInfo(id);
        System.out.println("account = " + account);

    }

    @Test
    @DisplayName("DB에 회원정보 하나가 쌓여야 한다")
    void save(){
        Account save = new Account();
        save.setAccountId("88");
        save.setPassword("8");
        save.setName("8");
        save.setGender(GENDER.M);
        save.setEmail("88");
        save.setPhoneNo("88");
        save.setAddress("88");

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
        build.setPassword("88");
        build.setEmail("88");
        build.setPhoneNo("88");
        build.setAddress("88");
        build.setAccountId("id");

        boolean b = mapper.modifyInfo(build);
        System.out.println("b = " + b);
        assertTrue(b);


    }

    @Test
    @DisplayName("해당 아이디 정보 삭제, db에서 하나의 정보가 삭제되어야 한다")
    void deleteInfo(){


        String id="3";
        mapper.deleteInfo(id);
        List<Account> accounts = mapper.allAccount();
        for (Account account : accounts) {
            System.out.println("accounts = " + account.getAccountId());

        }

    }


}