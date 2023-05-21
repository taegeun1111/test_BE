package com.mountain.doo.service.replyservice;


import com.mountain.doo.dto.page.Page;
import com.mountain.doo.dto.page.PageMaker;
import com.mountain.doo.dto.reply.feedreply.FeedReplyDetailResponseDTO;
import com.mountain.doo.dto.reply.feedreply.FeedReplyListResponseDTO;
import com.mountain.doo.dto.reply.feedreply.FeedReplyModifyRequestDTO;
import com.mountain.doo.dto.reply.feedreply.FeedReplyPostRequestDTO;
import com.mountain.doo.entity.reply.FeedReply;
import com.mountain.doo.repository.replymapper.FeedReplyMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;


@Service
@RequiredArgsConstructor
@Slf4j
public class FeedReplyService {

    private final FeedReplyMapper replyMapper; //repository에 의존

    // 댓글 목록 조회
    public FeedReplyListResponseDTO getList(long feedBoardNo, Page page){
        List<FeedReplyDetailResponseDTO> feedReplies = replyMapper.findAll(feedBoardNo, page)
                .stream()
                .map(FeedReplyDetailResponseDTO::new)
                .collect(Collectors.toList());

        int count = replyMapper.count(feedBoardNo);
        return FeedReplyListResponseDTO.builder()
                .replyCount(count)
                .replyPage(new PageMaker(page, count))
                .feedReplies(feedReplies)
                .build();
    }

    // 댓글 등록
    public FeedReplyListResponseDTO register(FeedReplyPostRequestDTO dto) throws SQLException {
        FeedReply feedReply = dto.feedReplyEntity();
        boolean flag = replyMapper.register(feedReply);

        if(!flag) throw new SQLException("댓글 저장 실패");


        return getList(dto.getBoardNo(), new Page(1,10));
    };

    // 댓글 삭제
    @Transactional
    public FeedReplyListResponseDTO delete(final long replyNo) throws Exception{
        long feedBoardNo = replyMapper.findOne(replyNo).getFeedBoardNo();
        replyMapper.remove(feedBoardNo);
        return getList(feedBoardNo, new Page(1,10));
    }

    // 댓글 수정
    @Transactional
    public FeedReplyListResponseDTO edit(final FeedReplyModifyRequestDTO dto) throws Exception {
        replyMapper.modify(dto.toEntity());
        return getList(dto.getBoardNo(), new Page(1,10));
    }
}
