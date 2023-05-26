package com.mountain.doo.controller;


import com.mountain.doo.dto.AccountResponseDTO;
import com.mountain.doo.dto.feed.*;
import com.mountain.doo.dto.like.ReviewLikeResponseDTO;
import com.mountain.doo.dto.page.Search;
import com.mountain.doo.dto.page.PageMaker;
import com.mountain.doo.dto.review.ReviewDetailResponseDTO;
import com.mountain.doo.dto.review.ReviewLikeUserResponseDTO;
import com.mountain.doo.entity.Feed;
import com.mountain.doo.repository.FeedMapper;
import com.mountain.doo.service.FeedService;
import com.mountain.doo.util.FileUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;


@Controller
@RequiredArgsConstructor
@RequestMapping("/feed")
@Slf4j
public class FeedController {

    @Value("${file.upload.root-path}")
    private String rootPath;
    private final FeedService feedService;
    private final FeedMapper feedMapper;

    // ==Feed==
    // 전체 게시글 조회
    @GetMapping("/list")
    public String list(Search page, Model model, HttpServletRequest request){
        log.info("feed list GET");

//        log.info(feed.getFeedTitle());
        page.setAmount(8);
        page.setType("");
        page.setKeyword("");
        List<FeedListResponseDTO> responseDTO = feedService.getList(page);

        PageMaker maker = new PageMaker(page, feedService.getCount(page));
//        System.out.println("responseDTO = " + responseDTO);
//        System.out.println("page = " + page);
//        System.out.println("maker = " + maker);
        Object login = request.getSession().getAttribute("login");
        System.out.println("login333 = " + login);
        // 페이징 알고리즘 작동

        List<FeedLikeUserResponseDTO> byAccountDTO = feedService.findByAccount();

        log.info("Feed like 누른 회원들 계정 정보 출력 : {}",byAccountDTO);

        boolean heartResult = isHeartResult(login, byAccountDTO, responseDTO);

        model.addAttribute("login",login);
        model.addAttribute("fList", responseDTO);
        model.addAttribute("maker", maker);
        model.addAttribute("s", page);
        model.addAttribute("r",heartResult);

        return "feed/feedList";
    };

    private boolean isHeartResult(Object login, List<FeedLikeUserResponseDTO> byAccountDTO,  List<FeedListResponseDTO> responseDTO) {
        boolean heartResult = false;
        if (login != null) {
            String accountId = ((AccountResponseDTO) login).getAccountId();

            for (FeedLikeUserResponseDTO heartList : byAccountDTO) {
                if (heartList.getAccountId().equals(accountId)){
                    heartResult = true;
                    break;
                }else {
                    heartResult = false;
                }
            }
        }
        return heartResult;
    }




    // 게시글 상세 조회
    @GetMapping("/detail")
    public String detail(int boardNo, @ModelAttribute("s") Search search, Model model){
        log.info("feed detail GET");
        FeedDetailResponseDTO detail = feedService.getDetail(boardNo);
        log.info("detail : {}",detail);
        model.addAttribute("feed", feedService.getDetail(boardNo));
        return "";
    }
    // 게시물 등록 화면 요청
    @GetMapping("/write")
    public String write(){
        System.out.println("/feed/write : GET");
        return "";
    }

    // 게시물 등록 완료 처리
    @PostMapping("/write")
    public String write(FeedWriteRequestDTO dto, MultipartFile image){
        System.out.println("/feed/write : POST");

        String savePath = null;
        if(!image.isEmpty()){
            File root = new File(rootPath);
            if (!root.exists()) root.mkdirs();
            savePath = FileUtil.uploadFile(image, rootPath);
        }else {
            log.info("이미지 등록 실패");
        }
        System.out.println("dto = " + dto);
        boolean save = feedService.register(dto, savePath);
        if (save){
            log.info("파일 저장 성공");
            return "redirect:/feed/list" ;
        }
        return "redirect:/issue/write";
    }

    // 수정 요청
    @GetMapping("/modify")
    public String modify(FeedRewriteRequestDTO dto, @ModelAttribute("s") Search search, Model model){
        Feed feed = feedMapper.findOne(dto.getBoardNo());
        model.addAttribute("bno",feed.getFeedBoardNo());
        model.addAttribute("title", feed.getFeedTitle());
        model.addAttribute("content", feed.getFeedContent());
        model.addAttribute("modifyTime", feed.getFeedModify());
        return "";
    }
    // 수정 완료 처리
    @PostMapping("/modify")
    public String modify(FeedRewriteRequestDTO dto){
        feedService.modify(dto);
        return "";
    }

    // 삭제
    @GetMapping("/delete")
    public String delete(int boardNo){
        feedService.delete(boardNo);
        return  "";
    }



}
