package com.mountain.doo.controller;

import com.mountain.doo.dto.SecondhandBoardListDTO;
import com.mountain.doo.dto.SecondhandBoardWriteDTO;
import com.mountain.doo.entity.SecondhandBoard;
import com.mountain.doo.service.SecondhandBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
@Slf4j


public class SecondhandBoardController {

    SecondhandBoardService sc;

    //게시글 전체 조회
    @GetMapping("/handlist")
    public String getList(Model model){
        List<SecondhandBoardListDTO> list = sc.findAll();

        model.addAttribute("list",list);
        return "";
    }

    //게시물 하나 조회
    @GetMapping("/handboardOne")
    public String findOne(int boardNo,Model model){
        SecondhandBoard one = sc.findOne(boardNo);
        model.addAttribute("one",one);

        return "";
    }

    //게시물 작성 페이지 열림
    @GetMapping("/handWrite")
    public String handWrite(){
        return "";
    }


    //게시물 작성
    @PostMapping("/handWriteData")
    public String handWriteDate(Model model, SecondhandBoardWriteDTO dto){
        boolean wb = sc.handWriteData(dto);
        model.addAttribute("writeBoard",wb);

        return "";
    }

}
