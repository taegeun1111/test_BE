package com.mountain.doo.controller;

import com.mountain.doo.dto.*;

import com.mountain.doo.dto.feed.FeedRewriteRequestDTO;
import com.mountain.doo.dto.page.PageMaker;
import com.mountain.doo.dto.page.ClubSearch;
import com.mountain.doo.dto.page.Search;

import com.mountain.doo.entity.Club;
import com.mountain.doo.repository.ClubMapper;

import com.mountain.doo.service.ClubService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/club")
public class ClubController {

    private final ClubService clubService;
    private final ClubMapper clubMapper;

    //모집글(정기모임 + 소모임) 전체 조회 + 필터링
    @GetMapping("/list")
    public String list(String clubRecruitType,
            ClubSearch page, Model model, HttpServletRequest request) {
//        boolean flag=false;
        System.out.println("clubRecruitType = " + clubRecruitType);
//        //세션을 확인
//        Object login = request.getSession().getAttribute("login");
//
//        if(login!=null) flag=true;
//
//        if (!flag) return "redirect:/club/sign-in";

        // Page : 기본 생성자 만들고, setter로 넣음
        log.info("/board/list : GET");
        log.info("page : {}",page);
        page.setAmount(6);
        List<ClubListResponseDTO> responseDTOS
                = clubService.getList(page);
//        List<ClubListResponseDTO> responseDTOS
//                = clubService.getList();

        //페이징 알고리즘 작동
        PageMaker maker = new PageMaker(page,clubService.getCount(page));

        System.out.println("maker = " + maker);
        model.addAttribute("bList", responseDTOS);
        model.addAttribute("maker",maker); //페이징 정보를 줌
        model.addAttribute("s",page);  //키워드 검색후 입력한 검색어 계속 남아있도록
        return "club/clubList";
    }

    // 글쓰기 화면 조회 요청
    @GetMapping("/write")
    public String write(Model model, HttpServletRequest request) {
        Object login = request.getSession().getAttribute("login");

        System.out.println("/club/write : GET");
        model.addAttribute("login",login);
        return "club/clubWrite";
    }

    // 글 등록 요청 처리
    @PostMapping("/write")
    public String write(ClubWriteRequestDTO dto) {
        System.out.println("/club/write : POST");
        clubService.register(dto);
        log.info("dto의 값 : {}",dto);
        return "redirect:/club/list";
    }

    //수정 요청/버튼클릭
    @GetMapping("/modify")
    public String modify(){
        log.info("정보수정");
        return "";
    }


    //정보수정
    @PostMapping("/modify")
    public String modify(ClubModifyDTO dto){
        boolean modify = clubService.modify(dto);
        if(modify) {
            return "";  //수정 되었을 때
        }
        return  ""; //수정 안되면 다시 수정페이지
    }

    //글 상세보기
    @GetMapping("/detail")
    public String detail(int bno, @ModelAttribute("s") ClubSearch search, Model model,  HttpServletRequest request){
        log.info("club detail GET");

        Object login = request.getSession().getAttribute("login");

        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println("login = " + login);
        System.out.println("detail = " + clubService.getDetail(bno));
        System.out.println();
        System.out.println();
        System.out.println();

        model.addAttribute("login", login);
        model.addAttribute("c", clubService.getDetail(bno));

        log.info("search 목록 : {}",search);
        return "club/clubDetail";
    }


    //글 삭제
    @PostMapping("/delete")
    public String delete(int clubBoardNo){
        System.out.println("/club/delete : POST");
        log.info(String.valueOf(clubBoardNo));
        return "redirect:/club/list";
    }

}