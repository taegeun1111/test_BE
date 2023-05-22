package com.mountain.doo.service.replyservice;


import com.mountain.doo.dto.page.Page;
import com.mountain.doo.dto.page.PageMaker;
import com.mountain.doo.dto.reply.clubreply.ClubReplyDetailResponseDTO;
import com.mountain.doo.dto.reply.clubreply.ClubReplyListResponseDTO;
import com.mountain.doo.dto.reply.clubreply.ClubReplyModifyRequestDTO;
import com.mountain.doo.dto.reply.clubreply.ClubReplyPostRequestDTO;
import com.mountain.doo.entity.reply.ClubReply;
import com.mountain.doo.repository.replymapper.ClubReplyMapper;
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
public class ClubReplyService {

    private final ClubReplyMapper replyMapper;

    // 댓글 목록 조회
    public ClubReplyListResponseDTO getList(long clubBoardNo, Page page){
        List<ClubReplyDetailResponseDTO> clubReplies = replyMapper.findAll(clubBoardNo, page)
                .stream()
                .map(ClubReplyDetailResponseDTO::new)
                .collect(Collectors.toList());

        int count = replyMapper.count(clubBoardNo);
        return ClubReplyListResponseDTO.builder()
                .replyCount(count)
                .replyPage(new PageMaker(page, count))
                .clubReplies(clubReplies)
                .build();
    }
    // 댓글 등록
    public ClubReplyListResponseDTO register(ClubReplyPostRequestDTO dto) throws SQLException {
        ClubReply clubReply = dto.clubReplyEntity();
        boolean flag = replyMapper.register(clubReply);

        if(!flag) throw new SQLException("댓글 저장 실패");


        return getList(dto.getBoardNo(), new Page(1,5));
    };
    // 댓글 삭제
    @Transactional
    public ClubReplyListResponseDTO delete(final long replyNo) throws Exception{
        long clubBoardNo = replyMapper.findOne(replyNo).getClubBoardNo();
        System.out.println("clubBoardNo = " + clubBoardNo);
        replyMapper.remove(replyNo);
        System.out.println("서비스까지 도달");
        return getList(clubBoardNo, new Page(1,5));
    }
    // 댓글 수정
    @Transactional
    public ClubReplyListResponseDTO edit(final ClubReplyModifyRequestDTO dto) throws Exception {
        replyMapper.modify(dto.toEntity());
        return getList(dto.getBoardNo(), new Page(1,5));
    }

}
