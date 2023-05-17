package com.mountain.doo.service;


import com.mountain.doo.dto.AccountModifyDTO;
import com.mountain.doo.entity.Account;
import com.mountain.doo.repository.AccountMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class AccountService {
    private final AccountMapper mapper;

    public List<Account> allAccount(){
        return mapper.allAccount();
    }

    public boolean login(LoginRequestDTO dto){
        LoginBoolean loginBoolean = loginBoolean(dto);


        if (loginBoolean.equals(SUCCESS)) {
            log.info("로그인 성공");
            return true;
        }else if(loginBoolean.equals(FALSE_PW)){
            log.info("비밀번호 틀림");
            return false;
        }else{
            log.info("회원가입요망");
            return false;
        }
    }

    //계정확인여부
    public LoginBoolean loginBoolean(LoginRequestDTO dto){
        Account account = mapper.myInfo(dto.getAccount()); //아이디로 계정찾기

        //비밀번호 확인
        boolean matches = encoder.matches(dto.getPassword(), account.getPassword());

        if(account==null) {
            return NOT_FOUND;
        }else if(!matches){
            return FALSE_PW;
        }else {
            return SUCCESS;
        }
    }

    public boolean save(Account account) {
                account.setPassword(encoder.encode(account.getPassword()));

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
