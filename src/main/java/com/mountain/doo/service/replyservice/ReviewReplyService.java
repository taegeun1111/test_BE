package com.mountain.doo.service.replyservice;


import com.mountain.doo.dto.page.Page;
import com.mountain.doo.dto.page.PageMaker;
import com.mountain.doo.dto.reply.clubreply.ClubReplyListResponseDTO;
import com.mountain.doo.dto.reply.clubreply.ClubReplyModifyRequestDTO;
import com.mountain.doo.dto.reply.clubreply.ClubReplyPostRequestDTO;
import com.mountain.doo.dto.reply.reviewreply.ReviewReplyDetailResponseDTO;
import com.mountain.doo.dto.reply.reviewreply.ReviewReplyListResponseDTO;
import com.mountain.doo.dto.reply.reviewreply.ReviewReplyModifyRequestDTO;
import com.mountain.doo.dto.reply.reviewreply.ReviewReplyPostRequestDTO;
import com.mountain.doo.entity.reply.ClubReply;
import com.mountain.doo.entity.reply.ReviewReply;
import com.mountain.doo.repository.replymapper.ReviewReplyMapper;
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
public class ReviewReplyService {

    private final ReviewReplyMapper replyMapper;

    // 댓글 목록 조회
    public ReviewReplyListResponseDTO getList(long reviewBoardNo, Page page){
        List<ReviewReplyDetailResponseDTO> reviewReplies = replyMapper.findAll(reviewBoardNo, page)
                .stream()
                .map(ReviewReplyDetailResponseDTO::new)
                .collect(Collectors.toList());

        int count = replyMapper.count(reviewBoardNo);
        return ReviewReplyListResponseDTO.builder()
                .replyCount(count)
                .replyPage(new PageMaker(page, count))
                .reviewReplies(reviewReplies)
                .build();
    }
    // 댓글 등록
    public ReviewReplyListResponseDTO register(ReviewReplyPostRequestDTO dto) throws SQLException {
        ReviewReply reviewReply = dto.reviewReplyEntity();
        boolean flag = replyMapper.register(reviewReply);

        if(!flag) throw new SQLException("댓글 저장 실패");


        return getList(dto.getBoardNo(), new Page(1,10));
    };
    // 댓글 삭제
    @Transactional
    public ReviewReplyListResponseDTO delete(final long replyNo) throws Exception{
        long reviewBoardNo = replyMapper.findOne(replyNo).getReviewBoardNo();
        replyMapper.remove(reviewBoardNo);
        return getList(reviewBoardNo, new Page(1,10));
    }
    // 댓글 수정
    @Transactional
    public ReviewReplyListResponseDTO edit(final ReviewReplyModifyRequestDTO dto) throws Exception {
        replyMapper.modify(dto.toEntity());
        return getList(dto.getBoardNo(), new Page(1,10));
    }

}
