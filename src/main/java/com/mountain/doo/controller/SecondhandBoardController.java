package com.mountain.doo.controller;

import com.mountain.doo.dto.SecondhandBoardListDTO;
import com.mountain.doo.entity.SecondhandBoard;
import com.mountain.doo.service.SecondhandBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
@Slf4j


public class SecondhandBoardController {

    SecondhandBoardService sc;

    //게시글 전체 조회
    @GetMapping("/list")
    public String getList(Model model){
        List<SecondhandBoardListDTO> list = sc.findAll();

        model.addAttribute("list",list);
        return "";
    }

}
