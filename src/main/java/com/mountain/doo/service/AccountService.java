package com.mountain.doo.service;


import com.mountain.doo.dto.AccountModifyDTO;
import com.mountain.doo.dto.AccountResponseDTO;
import com.mountain.doo.dto.AutoLoginDTO;
import com.mountain.doo.dto.LoginRequestDTO;
import com.mountain.doo.dto.stamp.StampAddConditionDTO;
import com.mountain.doo.entity.*;
import com.mountain.doo.repository.AccountMapper;
import com.mountain.doo.repository.LoginTimeMapper;
import com.mountain.doo.repository.StampMapper;
import com.mountain.doo.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.*;
import javax.websocket.Session;
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
    public LoginBoolean login(LoginRequestDTO dto,
                         HttpSession session,
                         HttpServletResponse response){

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

            return SUCCESS;
        }else if(loginBoolean.equals(FALSE_PW)){
            log.info("비밀번호 틀림");
            return FALSE_PW;
        }else{
            log.info("회원가입요망");
            return NOT_FOUND;
        }
    }



    //계정확인여부
    public LoginBoolean loginBoolean(LoginRequestDTO dto){
        log.info("AccountService의 loginBoolean() 진입");
        System.out.println("dto.getPassword() = " + dto.getPassword());
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

    public boolean save(Account account,final String savePath) {
        log.info("account: {}", account);

        account.setPassword(encoder.encode(account.getPassword()));
        account.setProfileImg(savePath);

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
    public void maintainAccountState(HttpSession session, String accountId){
        Account account = myInfo(accountId);

        //현재 로그인한 사람의 화면에 보여줄 일부정보 -> dto
        AccountResponseDTO dto= AccountResponseDTO.builder()
                .accountId(account.getAccountId())
                .name(account.getName())
                .profile(account.getProfileImg())
                .build();
        //이 정보들을 세션에 저장
        session.setAttribute(LoginUtil.LOGIN_KEY,dto);
        log.info("maintainAccountState에서 저장한 세션 : "+session.getAttribute(LoginUtil.LOGIN_KEY));
        // 세션의 수명을 설정 -> 1시간
        session.setMaxInactiveInterval(60 * 60 * 24);

        //< 로그인 스탬프 여부 처리하는 부분 >
        //db에 저장된 로그인 시간 가져오기
        LocalDate dbLoginTime = loginTimeMapper.findLoginTime(accountId);
        //현재 로그인한 시간
        LocalDate currentLoginTime = LocalDate.now();
        boolean b=false;

    if (dbLoginTime != null) {
        //db에 저장된 로그인 시간과 현재 로그인된 시간과 비교해서
        Period period = Period.between(dbLoginTime, LocalDate.now());
        int days = period.getDays();
        boolean click = stampMapper.isClick(accountId);
        //1보다 크면(하루가 지났다면)
        if(days>=1){
            //현재 로그인 시간을 db에 저장하고
            b = loginTimeMapper.updateLoginTime(accountId, currentLoginTime);
            
            return;
        }
        //아직 하루 안지났고 스탬프 버튼 안클릭 -> 버튼 계속 활성화되어 있어야 함
        if(days<1&&click==false){
            b=true;
            stampMapper.isLogin(b,accountId);
            return;
        }
        //아직 하루 안지났고 스탬프 버튼 클릭 했음
        if(days<1&&click==true){
            b=false;
            stampMapper.isLogin(b,accountId);
        }


    } else { //dbLoginTime테이블에 등록 안된 사람이면(아마도 처음 회원가입하고 들어온 사람이면)
        b = loginTimeMapper.saveLoginTime(accountId, currentLoginTime);
        stampMapper.isLogin(b,accountId);
        //stamp테이블에도 추가
        stampMapper.addAccount(accountId);
        //click_stamp테이블에도 추가
        stampMapper.saveClickStamp(accountId);
    }

    }

//    public void accountTrueFalse(boolean b,String accountId){ //true이면 로그인 스탬프 +1
//        stampMapper.isLogin(b,accountId);
//        if(b==true){
//            stampMapper.currentAdd(accountId);
//            stampMapper.stampAdd(accountId);
//        }
////        log.info("AccountService에서 true/false : " + build.isAttendCount());
//    }

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
//mm
    public boolean checkSignUpValue(String type, String keyword) {
        int flagNum = mapper.isDuplicate(type, keyword);
        log.info("flagNum : "+flagNum);
        if(flagNum==0) return false;
        else return true;
    }

    public List<Issue>  issueFindAll(String accountId){
        List<Issue> issue = mapper.issueFindAll(accountId);
        return issue;
    }

    public List<Feed> feedFindAll(String accountId){
        List<Feed> feed = mapper.feedFindAll(accountId);
        return feed;
    }

    public List<Club> offerFindAll(String accountId){
        List<Club> club = mapper.clubFindAll(accountId);
        return club;
    }

    public List<Review> reviewFindAll(String accountId){
        List<Review> review = mapper.reviewFindAll(accountId);

        return review;
    }

    public List<SecondhandBoard> secondhandFindAll(String accountId){
        List<SecondhandBoard> board = mapper.secondhandFindAll(accountId);
        return board;
    }




}
