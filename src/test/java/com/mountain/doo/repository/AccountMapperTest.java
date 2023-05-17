package com.mountain.doo.repository;

import com.mountain.doo.dto.AccountModifyDTO;
import com.mountain.doo.dto.LoginRequestDTO;
import com.mountain.doo.entity.Account;
import com.mountain.doo.entity.GENDER;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.beans.Encoder;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class AccountMapperTest {

    @Autowired
    AccountMapper mapper;

    @Autowired
    PasswordEncoder encoder;

    @Test
    @DisplayName("마이페이지 정보 조회")
    void mypage() {
        String id = "123";
        Account account = mapper.myInfo(id);
        System.out.println("account = " + account);

    }




    @Test
    @DisplayName("DB에 회원정보 하나가 쌓여야 한다")
    void save(){
        Account save = new Account();
        save.setAccountId("00");
        save.setPassword(encoder.encode("ehddn1111"));
        save.setName("11");
        save.setGender(GENDER.M);
        save.setEmail("11");
        save.setPhoneNo("00");
        save.setAddress("88");

        boolean isSaved = mapper.save(save);
        assertTrue(isSaved);

    }

    @Test
    @DisplayName("아이디로 회원정보 전체 검색하기")
    void searchInfoById(){
        AccountModifyDTO account = mapper.searchInfoById("123");
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
        build.setAccountId("123");

        boolean b = mapper.modifyInfo(build);
        System.out.println("b = " + b);
        assertTrue(b);


    }

    @Test
    @DisplayName("해당 아이디 정보 삭제, db에서 하나의 정보가 삭제되어야 한다")
    void deleteInfo(){


        String id="123";
        mapper.deleteInfo(id);
        List<Account> accounts = mapper.allAccount();
        for (Account account : accounts) {
            System.out.println("accounts = " + account.getAccountId());

        }

    }

    @Test
    @DisplayName("아이디와 이메일 중복이면 1, 아니면 0을 리턴한다")
    void isDuplicate(){

        String keyword = "sss";
        int duplicate = mapper.isDuplicate("account_id", keyword);
        System.out.println(duplicate);
assertEquals(1,duplicate);

    }


}