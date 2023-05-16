package com.mountain.doo.controller;


import com.mountain.doo.dto.AccountModifyDTO;
import com.mountain.doo.entity.Account;
import com.mountain.doo.service.AccountService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/account")
@Slf4j
public class AccountController {

    private final AccountService accountService;

    //회원가입페이지
    @GetMapping("/sign-up")
    public String signUp(){
        log.info("회원가입페이지");
        return "account/sign-up";
    }

    @PostMapping("/sign-up")
    public String signUp(Account account){
        log.info("가입처리요청");
//        boolean save = accountService.save(account);
//        if(save) {
//            return "redirect:/account/sign-in";  //로그인페이지
//        }
//        return "account/sign-up"; // 회원가입페이지

        return "redirect:/account/sign-in";
    }

    @GetMapping("/sign-in")
    public String signIn(Account account){
        log.info("로그인요청");
//        boolean save = accountService.save(account);
//        if(save) {
//            return "redirect:/account/sign-in";  //로그인페이지
//        }
//        return "account/sign-up"; // 회원가입페이지

        return "account/sign-in";
    }

    @GetMapping("/modify")
    public String modify(){
        log.info("정보수정");
        return "";
    }


//정보수정
    @PostMapping("/modify")
    public String modify(String accountId,AccountModifyDTO dto){
        boolean modify = accountService.modify(accountId, dto);
        if(modify) {
            return "redirect:/main";  //수정하면 메인페이지
        }
        return  ""; //수정 안되면 수정페이지
    }

}
