package com.mountain.doo.service;


import com.mountain.doo.dto.AccountModifyDTO;
import com.mountain.doo.entity.Account;
import com.mountain.doo.repository.AccountMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class AccountService {
    private final AccountMapper mapper;

    public boolean save(Account account) {
       return mapper.save(account);
    }


    public boolean modify(String accountId,AccountModifyDTO dto){
        AccountModifyDTO account = mapper.searchInfoById(accountId);
         account.changeAccount(dto);
         account.setAccountId(accountId);
       return mapper.modifyInfo(account);


    }

}
