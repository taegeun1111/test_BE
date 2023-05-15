package com.mountain.doo.repository;

import com.mountain.doo.dto.AccountModifyDTO;
import com.mountain.doo.entity.Account;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AccountMapper {

    boolean save(Account account);

    //아이디로 회원정보 조회
    AccountModifyDTO searchInfoById(String accountId);

    boolean modifyInfo(String accountId,AccountModifyDTO dto);


}
