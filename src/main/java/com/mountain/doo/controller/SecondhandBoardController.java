package com.mountain.doo.controller;

import com.mountain.doo.dto.SecondhandRewriteRequestDTO;
import com.mountain.doo.dto.page.PageMaker;
import com.mountain.doo.dto.page.Search;
import com.mountain.doo.dto.SecondhandBoardListDTO;
import com.mountain.doo.dto.SecondhandBoardWriteDTO;
import com.mountain.doo.dto.page.SecondhandSearch;
import com.mountain.doo.dto.review.ReviewDetailResponseDTO;
import com.mountain.doo.entity.SecondhandBoard;
import com.mountain.doo.entity.SecondhandType;
import com.mountain.doo.repository.SecondhandBoardMapper;
import com.mountain.doo.service.SecondhandBoardService;
import com.mountain.doo.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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

    private final SecondhandBoardService sc;
    private final SecondhandBoardMapper mapper;

    //게시글 전체 조회
    @GetMapping("/list")
    public String getList(Model model, SecondhandSearch page) {


//        boolean flag=false;
//        request.getSession().getAttribute("login");

//        if(login!=null) flag=true;

//        if (!flag) return "redirect:/club/sign-in";

        page.setAmount(15);
        List<SecondhandBoardListDTO> list = sc.findAll(page);

        //페이징 알고리즘 작동
        PageMaker maker = new PageMaker(page, sc.count(page));
        log.info("page = {}", page);
        model.addAttribute("shbList", list);
        model.addAttribute("maker", maker);
        model.addAttribute("s", page);
        return "secondHand/handList";
    }

    //게시물 상세 조회
    @GetMapping("/detail")
    public String findOne(int bno, Model model, HttpServletRequest request) {
        SecondhandBoard detail = sc.findOne(bno);
        System.out.println("detail = " + detail);
        Object login = request.getSession().getAttribute("login");

        model.addAttribute("is", new SecondhandBoardListDTO(detail));
        model.addAttribute("login", login);
        return "secondHand/handDetail";
    }

    //게시물 작성 페이지 열림
    @GetMapping("/write")
    public String handWrite(HttpSession session) {


        //회원정보있는 회원만 게시판 작성 가능
        return "secondHand/handWrite";
    }


    //게시물 작성
    @PostMapping("/write")
    public String handWriteDate(SecondhandBoardWriteDTO dto, HttpSession session) {
        sc.handWriteData(dto, session);
        log.info("handWrite 저장되는 값 {}", dto);
        return "redirect:/board/list";
    }


    // 수정 요청
    @GetMapping("/modify")
    public String modify(SecondhandRewriteRequestDTO dto, @ModelAttribute("s") Search search, Model model) {
        SecondhandBoard secondhand = mapper.findOne(dto.getBoardNo());
        model.addAttribute("bno", secondhand.getSecondHandBoardNo());
        model.addAttribute("title", secondhand.getSecondhandTitle());
        model.addAttribute("content", secondhand.getSecondhandContent());
        model.addAttribute("modifyTime", secondhand.getSecondhandModify());
        return "";
    }

    // 수정 완료 처리
    @PostMapping("/modify")
    public String modify(SecondhandRewriteRequestDTO dto) {
        sc.modify(dto);
        return "";
    }

    // 게시물 삭제
    @GetMapping("/delete")
    public String delete(int boardNo) {
        sc.delete(boardNo);
        return "";
    }
}
