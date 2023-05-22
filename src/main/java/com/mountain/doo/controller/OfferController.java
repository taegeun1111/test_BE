package com.mountain.doo.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/offer")
@Slf4j
public class OfferController {
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
    }
