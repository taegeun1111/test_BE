package com.mountain.doo.controller;

import com.mountain.doo.dto.Page.PageMaker;
import com.mountain.doo.dto.Page.Search;
import com.mountain.doo.dto.SecondhandBoardListDTO;
import com.mountain.doo.dto.SecondhandBoardWriteDTO;
import com.mountain.doo.entity.SecondhandBoard;
import com.mountain.doo.entity.SecondhandType;
import com.mountain.doo.service.SecondhandBoardService;
import com.mountain.doo.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
@Slf4j


public class SecondhandBoardController {

    SecondhandBoardService sc;

    //게시글 전체 조회
    @GetMapping("/handlist")
    public String getList(Model model, Search search, HttpServletRequest request){
        List<SecondhandBoardListDTO> list = sc.findAll(search);

        //페이징 아록리즘 작동
        PageMaker maker = new PageMaker(search,sc.count(search));

        model.addAttribute("shblist",list);
        model.addAttribute("maker",maker);
        model.addAttribute("search",search);
        return "/handlist";
    }

    //게시물 하나 조회
    @GetMapping("/handboardOne")
    public String findOne(int boardNo,Model model){
        SecondhandBoard one = sc.findOne(boardNo);
        model.addAttribute("one",one);

        return "/handlistOne";
    }

    //게시물 작성 페이지 열림
    @GetMapping("/handWrite")
    public String handWrite(HttpSession session){


        //회원정보있는 회원만 게시판 작성 가능
        return "/write";
    }


    //게시물 작성
    @PostMapping("/handWriteData")
    public String handWriteDate(SecondhandBoardWriteDTO dto,HttpSession session){
         sc.handWriteData(dto,session);

        return "redirect/List";
    }

}
