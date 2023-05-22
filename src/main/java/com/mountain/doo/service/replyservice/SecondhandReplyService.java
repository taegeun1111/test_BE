package com.mountain.doo.service.replyservice;


import com.mountain.doo.dto.page.Page;
import com.mountain.doo.dto.page.PageMaker;
import com.mountain.doo.dto.reply.feedreply.FeedReplyDetailResponseDTO;
import com.mountain.doo.dto.reply.feedreply.FeedReplyListResponseDTO;
import com.mountain.doo.dto.reply.feedreply.FeedReplyModifyRequestDTO;
import com.mountain.doo.dto.reply.feedreply.FeedReplyPostRequestDTO;
import com.mountain.doo.dto.reply.secondhandreply.SecondhandReplyDetailResponseDTO;
import com.mountain.doo.dto.reply.secondhandreply.SecondhandReplyListResponseDTO;
import com.mountain.doo.dto.reply.secondhandreply.SecondhandReplyModifyRequestDTO;
import com.mountain.doo.dto.reply.secondhandreply.SecondhandReplyPostRequestDTO;
import com.mountain.doo.entity.reply.FeedReply;
import com.mountain.doo.entity.reply.SecondhandReply;
import com.mountain.doo.repository.replymapper.SecondhandReplyMapper;
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
public class SecondhandReplyService {

    private final SecondhandReplyMapper replyMapper;

    // 댓글 목록 조회
    public SecondhandReplyListResponseDTO getList(long scBoardNo, Page page){
        List<SecondhandReplyDetailResponseDTO> scReplies = replyMapper.findAll(scBoardNo, page)
                .stream()
                .map(SecondhandReplyDetailResponseDTO::new)
                .collect(Collectors.toList());

        int count = replyMapper.count(scBoardNo);
        return SecondhandReplyListResponseDTO.builder()
                .replyCount(count)
                .replyPage(new PageMaker(page, count))
                .scReplies(scReplies)
                .build();
    }
    // 댓글 등록
    public SecondhandReplyListResponseDTO register(SecondhandReplyPostRequestDTO dto) throws SQLException {
        SecondhandReply scReply = dto.secondhandReplyEntity();
        boolean flag = replyMapper.register(scReply);

        if(!flag) throw new SQLException("댓글 저장 실패");


        return getList(dto.getBoardNo(), new Page(1,10));
    };
    // 댓글 삭제
    @Transactional
    public SecondhandReplyListResponseDTO delete(final long replyNo) throws Exception{
        long scBoardNo = replyMapper.findOne(replyNo).getSecondhandBoardNo();
        replyMapper.remove(scBoardNo);
        return getList(scBoardNo, new Page(1,10));
    }
    // 댓글 수정
    @Transactional
    public SecondhandReplyListResponseDTO edit(final SecondhandReplyModifyRequestDTO dto) throws Exception {
        replyMapper.modify(dto.toEntity());
        return getList(dto.getBoardNo(), new Page(1,10));
    }

}
