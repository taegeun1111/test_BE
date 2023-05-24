package com.mountain.doo.api;


import com.mountain.doo.dto.page.Page;
import com.mountain.doo.dto.reply.reviewreply.ReviewReplyListResponseDTO;
import com.mountain.doo.dto.reply.reviewreply.ReviewReplyModifyRequestDTO;
import com.mountain.doo.dto.reply.reviewreply.ReviewReplyPostRequestDTO;
import com.mountain.doo.service.replyservice.ReviewReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;


@RestController
@RequiredArgsConstructor
@RequestMapping("/review-reply")
@Slf4j
public class ReviewReplyController {

    private final ReviewReplyService replyService;

    // 댓글 목록 조회
    @GetMapping("/{boardNo}/page/{pageNo}") //특정 게시물의 댓글 목록 중 특정 페이지 조회
    public ResponseEntity<?> list(
            @PathVariable long boardNo,
            @PathVariable int pageNo
    ) {
        Page page = new Page();
        page.setPageNo(pageNo);
        page.setAmount(5);
        ReviewReplyListResponseDTO replyList = replyService.getList(boardNo, page);
        log.info("replyList: {}", replyList);
        return ResponseEntity.ok().body(replyList);
    }

    // 댓글 작성
    @PostMapping
    public ResponseEntity<?> register(
            @Validated @RequestBody ReviewReplyPostRequestDTO dto // 요청 바디에 보내줌
            , BindingResult result
    ) {
        log.info("register 비동기 댓글 작성 POST!");
        if (result.hasErrors()) {
            return ResponseEntity.badRequest()
                    .body(result.toString());
        }


        try {
            ReviewReplyListResponseDTO responseDTO = replyService.register(dto);

            return ResponseEntity.ok().body(responseDTO);
        } catch (SQLException e) {
            log.warn("server error status : {}", e.getMessage());
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }

    // 댓글 삭제
    // delete 요청 보내기
    @DeleteMapping("/{replyNo}")
    public ResponseEntity<?> delete(
            @PathVariable(required = false) Long replyNo
    ) {

        if (replyNo == null) {
            return ResponseEntity.badRequest().body("댓글 번호를 보내주세요");
        }
        log.info("DeleteMapping 발생 댓글 번호 : {}",replyNo);
        try {
            System.out.println("replyNo = " + replyNo);
            ReviewReplyListResponseDTO responseDTO = replyService.delete(replyNo);
            System.out.println("responseDTO = " + responseDTO);
            System.out.println("삭제 이벤트 발생");
            return ResponseEntity.ok().body(responseDTO);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());

        }
    }

    //댓글 수정
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<?> modify(
            @Validated @RequestBody ReviewReplyModifyRequestDTO dto,
            BindingResult result
    ) {
        log.info("review-reply PUT!");
        if (result.hasErrors()) {
            log.info("review-reply hasErrors");
            return ResponseEntity.badRequest().body(result.toString());
        }

        try {
            ReviewReplyListResponseDTO responseDTO = replyService.edit(dto);
            log.info("review-reply try까지");
            return ResponseEntity.ok().body(responseDTO);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());

        }
    }
}
