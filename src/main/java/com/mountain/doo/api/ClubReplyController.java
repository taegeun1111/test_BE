package com.mountain.doo.api;


import com.mountain.doo.dto.page.Page;
import com.mountain.doo.dto.reply.clubreply.ClubReplyListResponseDTO;
import com.mountain.doo.dto.reply.clubreply.ClubReplyModifyRequestDTO;
import com.mountain.doo.dto.reply.clubreply.ClubReplyPostRequestDTO;
import com.mountain.doo.service.replyservice.ClubReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

@RestController
@RequiredArgsConstructor
@RequestMapping("/club-reply")
@Slf4j
public class ClubReplyController {

    private final ClubReplyService replyService;

    // 댓글 목록 조회
    @GetMapping("/{boardNo}/page/{pageNo}") //특정 게시물의 댓글 목록 중 특정 페이지 조회
    public ResponseEntity<?> list(
            @PathVariable long boardNo,
            @PathVariable int pageNo
    ) {
        Page page = new Page();
        page.setPageNo(pageNo);
        page.setAmount(5);
        ClubReplyListResponseDTO replyList = replyService.getList(boardNo, page);
        log.info("replyList: {}", replyList);
        return ResponseEntity.ok().body(replyList);
    }

    // 댓글 작성
    @PostMapping
    public ResponseEntity<?> register(
            @Validated @RequestBody ClubReplyPostRequestDTO dto // 요청 바디에 보내줌
            , BindingResult result
    ) {
        log.info("register 비동기 댓글 작성 POST!");
        if (result.hasErrors()) {
            return ResponseEntity.badRequest()
                    .body(result.toString());
        }


        try {
            ClubReplyListResponseDTO responseDTO = replyService.register(dto);

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

        try {
            ClubReplyListResponseDTO responseDTO = replyService.delete(replyNo);
            return ResponseEntity.ok().body(responseDTO);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());

        }
    }

    //댓글 수정
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<?> modify(
            @Validated @RequestBody ClubReplyModifyRequestDTO dto,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body(result.toString());
        }

        try {
            ClubReplyListResponseDTO responseDTO = replyService.edit(dto);
            return ResponseEntity.ok().body(responseDTO);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());

        }
    }
}
