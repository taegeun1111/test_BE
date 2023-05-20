package com.mountain.doo.controller;

import com.mountain.doo.dto.stamp.StampAddConditionDTO;
import com.mountain.doo.dto.stamp.StampResponseDTO;
import com.mountain.doo.entity.Stamp;
import com.mountain.doo.service.StampService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/event")
@Slf4j
public class StampController {

    private final StampService stampService;

    // 내 스탬프 보기
    @GetMapping("/stamp")
    public String myStampPage(){
        return "/event/stamp";
    }

    @PostMapping("/stamp")
    public String myStampPage(StampAddConditionDTO dto, Model model){

        //id가 가지고 있는 총 스탬프 수
        Stamp stampCount = stampService.stampCount(dto);

        model.addAttribute("sc",stampCount);

        return "/event/stamp";
    }




}
