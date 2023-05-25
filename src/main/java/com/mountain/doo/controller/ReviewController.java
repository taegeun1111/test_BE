package com.mountain.doo.controller;


import com.mountain.doo.dto.issue.IssueRewriteRequestDTO;
import com.mountain.doo.dto.like.ReviewLikeResponseDTO;
import com.mountain.doo.dto.page.PageMaker;
import com.mountain.doo.dto.page.Search;
import com.mountain.doo.dto.review.ReviewDetailResponseDTO;
import com.mountain.doo.dto.review.ReviewListResponseDTO;
import com.mountain.doo.dto.review.ReviewRewriteRequestDTO;
import com.mountain.doo.dto.review.ReviewWriteRequestDTO;
import com.mountain.doo.entity.Review;
import com.mountain.doo.repository.ReviewMapper;
import com.mountain.doo.service.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequiredArgsConstructor
@RequestMapping("/review")
@Slf4j
public class ReviewController {

    private final ReviewService reviewService;
    private final ReviewMapper reviewMapper;

    // ==Review==
    // 전체 게시글 조회
    @GetMapping("/list")
    public String list(Search page, Model model){
        page.setAmount(15);
        log.info("review list GET");
//        log.info(review.getReviewTitle());
        List<ReviewListResponseDTO> responseDTO = reviewService.getList(page);

        PageMaker maker = new PageMaker(page, reviewService.getCount(page));
        // 페이징 알고리즘 작동
        model.addAttribute("rList", responseDTO);
        model.addAttribute("maker", maker);
        model.addAttribute("s", page);


        return "review/reviewList";
    };
    // 게시글 상세 조회
    @GetMapping("/detail")
    public String detail(int bno, @ModelAttribute("s") Search search, Model model, HttpServletRequest request){
        log.info("review detail GET");

        Object login = request.getSession().getAttribute("login");
        ReviewDetailResponseDTO detail = reviewService.getDetail(bno);

        log.info("detail에 접근한 User의 정보 : {}", request.getSession().getAttribute("login"));
        log.info("detail 게시물 정보 : {}",detail);
        ReviewLikeResponseDTO byAccountDTO = reviewService.findByAccount();
        log.info("like 누른 회원들 계정 정보 출력 : {}",byAccountDTO);
        model.addAttribute("login", login);
        model.addAttribute("is", detail);
        model.addAttribute("l",byAccountDTO);
        return "review/reviewDetail";
    }
//    @GetMapping("/detail")
//    public ResponseEntity<?>modify(@Validated @RequestBody ReviewLikeResponseDTO like){
//
//        return ResponseEntity.ok().body(detail)
//    }




    // 게시물 등록 화면 요청
    @GetMapping("/write")
    public String write(){
        System.out.println("/review/write : GET");
        return "";
    }
    // 게시물 등록 완료 처리
    @PostMapping("/write")
    public String write(ReviewWriteRequestDTO dto){
        System.out.println("/review/write : POST");
        log.info("산악 후기 게시물 작성 POST발생 : {}",dto);
        reviewService.register(dto);
        return "redirect:/review/list";
    }

    // 수정 요청
    @GetMapping("/modify")
    public String modify(int bno, Model model){
        Review review = reviewMapper.findOne(bno);
        ReviewListResponseDTO modifyReview = new ReviewListResponseDTO(review);

        model.addAttribute("is",modifyReview);

        return "review/reviewModify";
    }
    // 수정 완료 처리
    @PostMapping("/modify")
    public String modify(ReviewRewriteRequestDTO dto){
        ReviewRewriteRequestDTO requestDTO = new ReviewRewriteRequestDTO(dto);
        System.out.println("requestDTO = " + requestDTO);
        reviewService.modify(requestDTO);

        return "redirect:/review/detail?bno="+requestDTO.getBoardNo();
    }

    // 삭제
    @GetMapping("/delete")
    public String delete(int bno){
        reviewService.delete(bno);
        return  "redirect:/review/list";
    }



}
