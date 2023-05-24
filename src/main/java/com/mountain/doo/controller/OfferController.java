package com.mountain.doo.controller;

import com.mountain.doo.dto.AccountResponseDTO;
import com.mountain.doo.dto.OfferWriteRequestDTO;
import com.mountain.doo.entity.Offer;
import com.mountain.doo.service.OfferService;
import com.mountain.doo.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

@Controller
@RequiredArgsConstructor
@RequestMapping("/offer")
@Slf4j
public class OfferController {

    OfferService offerService;

    @GetMapping("/offer-main")
    public String offer() {
            log.info("추천메뉴");
            return "offer/offer-main";
    }



    @GetMapping("offer-eat")
    public String offerEat() {
        log.info("추천맛집");
        return "offer/offer-restaurant";
    }

    //글쓰기 버튼 클릭
    @GetMapping("write")
    public String write(){
        log.info("추천정보 글쓰기");

        return "offer/offer-writer";
    }

    @PostMapping("/write")
    public String postWrite(OfferWriteRequestDTO dto, HttpSession session) {
        log.info("글쓰기 완료 요청");
        AccountResponseDTO attribute = (AccountResponseDTO) session.getAttribute(LoginUtil.LOGIN_KEY);
        offerService.save(dto,attribute.getAccountId());

        return "redirect:/offer/offer-main";
    }

}
