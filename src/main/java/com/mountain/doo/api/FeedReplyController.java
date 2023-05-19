package com.mountain.doo.api;


import com.mountain.doo.dto.page.Page;
import com.mountain.doo.entity.reply.FeedReply;
import com.mountain.doo.repository.replymapper.FeedReplyMapper;
import com.mountain.doo.service.replyservice.FeedReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequiredArgsConstructor
@RequestMapping("/feed-reply")
@Slf4j
public class FeedReplyController {

    private final FeedReplyService replyService;

//restcontroller는 jsp를 찾지 않는다

    // 댓글 목록 조회
    @GetMapping("/{boardNo}/page/{pageNo}")
    public ResponseEntity<?> list(
            @PathVariable long boardNo,
            @PathVariable int pageNo
    ){
        Page page = new Page();
        page.setPageNo(pageNo);
        page.setAmount(10);
        List<FeedReply> replyList = replyService.getList(boardNo, page);

        return ResponseEntity.ok().body(replyList);
    }



}
