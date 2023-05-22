package com.mountain.doo.controller;


import com.mountain.doo.dto.AccountModifyDTO;
import com.mountain.doo.dto.AutoLoginDTO;
import com.mountain.doo.dto.LoginRequestDTO;
import com.mountain.doo.dto.stamp.StampAddConditionDTO;
import com.mountain.doo.entity.Account;
import com.mountain.doo.service.AccountService;
import com.mountain.doo.util.FileUtil;
import com.mountain.doo.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;

import static com.mountain.doo.util.LoginUtil.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/account")
@Slf4j
public class AccountController {
    @Value("${file.upload.root-path}")
    private String rootPath;

    private final AccountService accountService;

    //회원가입페이지
    @GetMapping("/sign-up")
    public String signUp() {
        log.info("회원가입페이지");
        return "account/sign-up";
    }

    @PostMapping("/sign-up")
    public String signUp(Account account, MultipartFile clientProfileImage) {


        log.info("가입처리요청");
        log.info("회원가입 비번  :" + account.getPassword());

        String savePath = null;
        if (!clientProfileImage.isEmpty()) { //프로필 추가 했으면
        //rootPath에 파일을 업로드
            //루트 디렉토리 생성
            File root = new File(rootPath);
            if (!root.exists()) root.mkdirs();
            savePath = FileUtil.uploadFile(clientProfileImage, rootPath);
        }

        boolean save = accountService.save(account,savePath);

        if (save) {
            return "redirect:/account/sign-in";  //로그인페이지
        }
        return "/sign-up"; // 회원가입페이지
    }

    // 로그인 요청 페이지
    @GetMapping("/sign-in")
    public String login() {

        return "account/sign-in";
    }


    @PostMapping("/sign-in")
    public String login(LoginRequestDTO dto,
                        HttpServletResponse response,
                        HttpServletRequest request,
                        Model model) {
        log.info("sessionId : " + request.getSession().getId());
        log.info("-----------------------------------{}", dto);

        boolean login = accountService.login(dto, request.getSession(), response);


        if (login) {
            //service에 세션 보냄

            accountService.maintainAccountState(request.getSession(), dto.getAccount());
            return "redirect:/"; //로그인되면 메인페이지(메인 아직 없어서 마이페이지로 ㅎㅎ)

        } else {
            return "account/sign-in"; //로그인 안되면 로그인 페이지 다시
        }
    }


    // 회원정보 수정페이지
    @GetMapping("/modify")
    public String modify() {
        log.info("정보수정");
        return "account/account-modify";
    }


    //정보수정
    @PostMapping("/modify")
    public String modify(String accountId, AccountModifyDTO dto) {
        boolean modify = accountService.modify(accountId, dto);
        if (modify) {
            return "redirect:/account/mypage";  //수정하면 메인페이지(로그인페이지)
        }
        return "account/account-modify"; //수정 안되면 다시 수정페이지
    }

    @GetMapping("/mypage")
    public String mypage(Model model, String accountId) {
        //회원정보 마이페이지
        log.info("account mypage 요청");
        Account account = accountService.myInfo(accountId);
        model.addAttribute("mypage", account);
        return "account/mypage";
    }

    //로그아웃 처리
    @GetMapping("/log-out")
    public String logOut(HttpServletRequest request,
                         HttpServletResponse response) {

        HttpSession session = request.getSession();

        if (isLogin(session)) { //로그인 되어있으면
            if (isAutoLogin(request)) {
                //자동 로그인 해제
                accountService.autoLoginClear(request, response);
            }

            session.removeAttribute("login");

            session.invalidate();
            return "redirect:/";
        }
//        로그인이 안되어 있다면
        return "redirect:/account/login";
    }


    //태근 커뮤니티 페이지 이동 추가
    @GetMapping("/community")
    public String community() {
        log.info("community 페이지 이동 GET 발생");
        return "account/selectCategory";
    }


    //아이디,이메일 중복 검사
    @GetMapping("/check")
    @ResponseBody
    //검사 타입(아이디인지,이메일인지), 검사 키워드(어떤 계정인)
    public ResponseEntity<?> check(String type, String keyword) {
        log.info("/account/check?type={}&keyword={} ASYNC GET!", type, keyword);
        boolean flag = accountService.checkSignUpValue(type, keyword);
        return ResponseEntity.ok().body(flag);
    }
}


