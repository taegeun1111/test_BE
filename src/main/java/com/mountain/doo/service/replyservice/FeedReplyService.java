package com.mountain.doo.service.replyservice;


import com.mountain.doo.dto.page.Page;
import com.mountain.doo.entity.Feed;
import com.mountain.doo.entity.reply.FeedReply;
import com.mountain.doo.repository.replymapper.FeedReplyMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
@Slf4j
public class FeedReplyService {

    private final FeedReplyMapper replyMapper; //repository에 의존

    // 댓글 목록 조회
    public List<FeedReply> getList(long feedBoardNo, Page page){
//        List<FeedReply> replyList = replyMapper.findAll(feedBoardNo, page);
        return replyMapper.findAll(feedBoardNo, page);
    }

    // 댓글 등록

    // 댓글 삭제

    // 댓글 수정


}
