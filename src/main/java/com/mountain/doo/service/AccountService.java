package com.mountain.doo.service;


import com.mountain.doo.dto.AccountModifyDTO;
import com.mountain.doo.dto.AccountResponseDTO;
import com.mountain.doo.dto.AutoLoginDTO;
import com.mountain.doo.dto.LoginRequestDTO;
import com.mountain.doo.dto.stamp.StampAddConditionDTO;
import com.mountain.doo.entity.Account;
import com.mountain.doo.entity.LoginBoolean;
import com.mountain.doo.repository.AccountMapper;
import com.mountain.doo.repository.LoginTimeMapper;
import com.mountain.doo.repository.StampMapper;
import com.mountain.doo.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.util.List;

import static com.mountain.doo.entity.LoginBoolean.*;

@Service
@Slf4j
@RequiredArgsConstructor
public class AccountService {
    private final AccountMapper mapper;
    private final PasswordEncoder encoder;
    private final LoginTimeMapper loginTimeMapper;
    private final StampMapper stampMapper;

    public List<Account> allAccount(){
        return mapper.allAccount();
    }

    //로그인 검증
    public boolean login(LoginRequestDTO dto,
                         HttpSession session,
                         HttpServletResponse response){
        log.info("AccountService의 login()진입");

        LoginBoolean loginBoolean = loginBoolean(dto);
        log.info("loginBoolean : "+loginBoolean);

        if (loginBoolean.equals(SUCCESS)) {
            log.info("로그인 성공");
            //자동로그인 여부 확인
            if(dto.isAutoLogin()){
                //자동 로그인 처리 쿠키 생성
                Cookie autoLoginCookie = new Cookie(LoginUtil.AUTO_LOGIN_COOKIE,session.getId());
                //쿠키 셋팅
                int limitTime = 60*60*24*90;
                autoLoginCookie.setMaxAge(limitTime);
                autoLoginCookie.setPath("/");
                //쿠키를 클라이언트에 응답 전송
                response.addCookie(autoLoginCookie);
                //DB에도 쿠키에 저장된 값과 수명을 저장
                mapper.saveAutoLogin(
                        AutoLoginDTO.builder()
                                .sessionId(session.getId())
                                .accountId(dto.getAccount())
                                .limitTime(LocalDateTime.now().plusDays(90))
                                .build()
                );
            }

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
        log.info("AccountService의 loginBoolean() 진입");
        Account account = mapper.myInfo(dto.getAccount()); //아이디로 계정찾기

        log.info("account : " + account);
        log.info("account.getPassword() : "+account.getPassword());
        log.info("dto.getPassword() : "+dto.getPassword());


        //비밀번호 확인
        boolean matches = encoder.matches(dto.getPassword(), account.getPassword());
//        boolean matches = encoder.matches( account.getPassword(),dto.getPassword());
        log.info("matches : "+matches);

        if(account==null) {
            return NOT_FOUND;
        }else if(!matches){
            return FALSE_PW;
        }else {
            return SUCCESS;
        }
    }

    public boolean save(Account account) {
        log.info("account: {}", account);

        account.setPassword(encoder.encode(account.getPassword()));

        return mapper.save(account);
    }


    public boolean modify(String accountId,AccountModifyDTO dto){
        AccountModifyDTO account = mapper.searchInfoById(accountId);
        AccountModifyDTO accountModifyDTO = account.changeAccount(dto);
        accountModifyDTO.setPassword(encoder.encode(dto.getPassword()));
        accountModifyDTO.setAccountId(accountId);
       return mapper.modifyInfo(accountModifyDTO);


    }
    public boolean deleteInfo(String accountId){
        return mapper.deleteInfo(accountId);
    }

    public Account myInfo(String accountId) {
        return mapper.myInfo(accountId);
    }

    // 로그인 성공시 세션에 로그인한 회원의 정보 저장
    public boolean maintainAccountState(HttpSession session, String accountId,StampAddConditionDTO stampDto){
        Account account = myInfo(accountId);

        //현재 로그인한 사람의 화면에 보여줄 일부정보 -> dto
        AccountResponseDTO dto= AccountResponseDTO.builder()
                .accountId(account.getAccountId())
                .name(account.getName())
                .build();
        //이 정보들을 세션에 저장
        session.setAttribute(LoginUtil.LOGIN_KEY,dto);

        // 세션의 수명을 설정 -> 1시간
        session.setMaxInactiveInterval(60 * 60);

        //db에 저장된 로그인 시간
        LocalDate dbLoginTime = loginTimeMapper.findLoginTime(accountId);
        //현재 로그인한 시간
        LocalDate currentLoginTime = LocalDate.now();
        boolean b=false;

    if (dbLoginTime != null) {

        //db에 저장된 로그인 시간과 현재 로그인된 시간과 비교해서
        Period period = Period.between(dbLoginTime, LocalDate.now());
        int days = period.getDays();
        //1보다 크면(하루가 지나면)
        if(days>=1){
            //현재 로그인 시간을 db에 저장하고
            b = loginTimeMapper.updateLoginTime(accountId, currentLoginTime);
            //스탬프 개수 +1
            upStamp(stampDto);
        }
        log.info("dbLoginTime등록여부1" + b);
        return b;
    }else { //dbLoginTime테이블에 등록 안된 사람이면(아마도 처음 회원가입하고 들어온 사람이면)
        b = loginTimeMapper.saveLoginTime(accountId, currentLoginTime);
        upStamp(stampDto);
        log.info("dbLoginTime등록여부2" + b);
        return b;
    }
    }

    //로그인 스탬프 전체 개수 +1 해주는 함수
    public void upStamp(StampAddConditionDTO dto){
        boolean isAttendCountUp = stampMapper.booleanLogin(dto);
    }

    //자동로그인 해제
    public void autoLoginClear(HttpServletRequest request, HttpServletResponse response){
        //쿠키 가져오고
        Cookie cookie = WebUtils.getCookie(request, LoginUtil.AUTO_LOGIN_COOKIE);
        //쿠키 수명 0초로 = 쿠키 삭제
        if(cookie!=null){
            cookie.setMaxAge(0);
            cookie.setPath("/");
            response.addCookie(cookie);
        }
        mapper.saveAutoLogin(
                AutoLoginDTO.builder()
                        .sessionId("none")
                        .limitTime(LocalDateTime.now())
                        .accountId(LoginUtil.getcurrentLoginMemberAccount(request.getSession()))
                        .build()
        );
    }

}
