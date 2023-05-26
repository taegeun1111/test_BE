package com.mountain.doo.controller;

import com.mountain.doo.dto.AccountResponseDTO;
import com.mountain.doo.dto.LoginUserResponseDTO;
import com.mountain.doo.dto.stamp.StampAddConditionDTO;
import com.mountain.doo.dto.stamp.StampResponseDTO;
import com.mountain.doo.entity.Stamp;
import com.mountain.doo.service.StampService;
import com.mountain.doo.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/event")
@Slf4j
public class StampController {

    private final StampService stampService;

    // 내 스탬프 보기
    @GetMapping("/stamp")
    public String myStampPage(Model model, HttpSession session){

        AccountResponseDTO loginUserData = (AccountResponseDTO) session.getAttribute(LoginUtil.LOGIN_KEY);

        String accountId=loginUserData.getAccountId();

        log.info("Get Stamp 요청 accountId: "+accountId);

        Stamp stamp = stampService.stampCount(accountId);

        model.addAttribute("stamp",stamp);

        boolean click = stampService.isClick(accountId);
        log.info("/stamp click여부 : "+click);
        model.addAttribute("isClick",click);


//        stampService.loginStamp(StampAddConditionDTO,accountId);

/*
        dto.setAccountId(loginUserData.getAccountId());

        //id가 가지고 있는 총 스탬프 수
        Stamp stampCount = stampService.stampCount(dto);
        stampService.boardBanner(dto);

// 민정님꺼
/*
        StampAddConditionDTO dto;
        model.addAttribute("sc",dto);
        */

        return "/event/stamp";

    }

        @PostMapping("/stamp")
    public String myStampPage(Model model){


        return "/event/stamp";
    }
/*
    @GetMapping("/banner-count")
    @ResponseBody
    public ResponseEntity<?> bannerCount(StampAddConditionDTO dto, Model model) {
        log.info("/stamp/banner-count?type={}&keyword={} ASYNC GET!");
        stampService.boardBanner(dto);
        return ResponseEntity.ok().body();

    }
    @PostMapping("/banner-count")
    @ResponseBody
    public ResponseEntity<?> handleBannerClick(
            @RequestBody StampAddConditionDTO stampAdd
            , BindingResult result
            , HttpSession session) {

        String id = session.getId();
        stampAdd.setAccountId(id);
*/
//---------------------------------------------------

//        model.addAttribute("stamp",stampCount);


//        return "/event/stamp";
//
//    }


//    @GetMapping("/banner-count")
//    @ResponseBody
//    public ResponseEntity<?> bannerCount(StampAddConditionDTO dto, Model model) {
//        log.info("/stamp/banner-count?type={}&keyword={} ASYNC GET!");
//        stampService.boardBanner(dto);
//        return ResponseEntity.ok().body();
//
//    }
    @PostMapping("/banner-count")
    @ResponseBody
    public void handleBannerClick(
            @RequestBody StampAddConditionDTO stampAdd
            , HttpSession session) {

        log.info("스탬프 비동기1 : "+stampAdd);


        AccountResponseDTO loginUserData = (AccountResponseDTO) session.getAttribute(LoginUtil.LOGIN_KEY);
        String accountId=loginUserData.getAccountId();
        log.info("스탬프 비동기1 accountId" + accountId);

        stampAdd.setAccountId(accountId);

        log.info("스탬프 비동기1 stampAdd" + stampAdd);

         stampService.update(stampAdd);
//        log.info("스탬프 비동기1 stampService.update(stampAdd) : " + );

        // 클릭 횟수 증가 또는 저장 로직 구현
        incrementClickCount(stampAdd.getAccountId(), stampAdd.isBannerClickCount(), stampAdd);
    }

        private void incrementClickCount(String accountId, boolean bannerClickCount,  StampAddConditionDTO stampAdd) {
            // 클릭 횟수를 저장하는 데이터베이스에 접근하여 클릭 횟수 증가 또는 저장 작업 수행
            // 예: 클릭 횟수 정보를 데이터베이스에서 조회하고, 증가시킨 후 다시 저장

        log.info("스탬프 비동기2 : "+stampAdd);

        String userId = stampAdd.getAccountId();
//        boolean flag = (boolean) stampAdd.get();

        }

//        log.info("스탬프 비동기 : "+stampAdd);
//        String userId = stampAdd.getAccountId();
//        boolean flag = (boolean) stampAdd.get();
//        stampService.update(stampAdd);


        // 클릭 횟수 증가 또는 저장 로직 구현
//    incrementClickCount(stampAdd.getAccountId(), stampAdd.isBannerClickCount());


    @PostMapping("/click-stamp")
    @ResponseBody
    public ResponseEntity<?> clickStampButton(@RequestBody StampAddConditionDTO stampAdd,HttpSession session){
        log.info("/memebers/click-stamp : " + stampAdd.isClickEvent());
        boolean b = stampAdd.isClickEvent();
        AccountResponseDTO loginUserData = (AccountResponseDTO) session.getAttribute(LoginUtil.LOGIN_KEY);
        String accountId=loginUserData.getAccountId();

        if(b==false){
            boolean attendCount = false;
            stampService.isLogin(attendCount,accountId);
            stampService.stampAdd(accountId);
        }

        return ResponseEntity.ok().body(b); // Spring에서 HTTP 응답을 나타내는 방법 중 하나
    }

//    public void accountTrueFalse(boolean b,String accountId){ //true이면 로그인 스탬프 +1
//        stampMapper.isLogin(b,accountId);
//        if(b==true){
//            stampMapper.currentAdd(accountId);
//            stampMapper.stampAdd(accountId);
//        }
////        log.info("AccountService에서 true/false : " + build.isAttendCount());
//    }

}