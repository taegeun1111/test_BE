package com.mountain.doo.service;


import com.mountain.doo.dto.AccountModifyDTO;
import com.mountain.doo.dto.AccountResponseDTOMinjung;
import com.mountain.doo.dto.page.Search;
import com.mountain.doo.entity.Account;
import com.mountain.doo.repository.AccountMapper;
import com.mountain.doo.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class AccountService {
    private final AccountMapper mapper;

    public List<Account> allAccount(){
        return mapper.allAccount();
    }

    public boolean login(
            String accountId, String password){

        return mapper.login(accountId,password);
    }

    public boolean save(Account account) {
       return mapper.save(account);
    }


    public boolean modify(String accountId,AccountModifyDTO dto){
        AccountModifyDTO account = mapper.searchInfoById(accountId);
         account.changeAccount(dto);
         account.setAccountId(accountId);
       return mapper.modifyInfo(account);


    }
    public boolean deleteInfo(String accountId){
        return mapper.deleteInfo(accountId);
    }

    public Account myInfo(String accountId) {
        return mapper.myInfo(accountId);
    }

    // 로그인 성공시 세션에 로그인한 회원의 정보 저장
    public void maintainAccountState(HttpSession session,String accountId){
        Account account = myInfo(accountId);

        //현재 로그인한 사람의 화면에 보여줄 일부정보 -> dto
        AccountResponseDTOMinjung dto=AccountResponseDTOMinjung.builder()
                .name(account.getAccountId())
                .name(account.getName())
                .build();
        //이 정보들을 세션에 저장
        session.setAttribute(LoginUtil.LOGIN_KEY,dto);
        // 세션의 수명을 설정
        session.setMaxInactiveInterval(60 * 60);
    }
}
