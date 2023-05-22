package com.mountain.doo.repository.replymapper;

import com.mountain.doo.dto.ClubWriteRequestDTO;
import com.mountain.doo.entity.Club;
import com.mountain.doo.entity.reply.ClubReply;
import com.mountain.doo.repository.ClubMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ClubReplyMapperTest {

    @Autowired
    ClubReplyMapper replyMapper;
    @Autowired
    ClubMapper clubMapper;
/*
    @Test
    @DisplayName("게시물 300개를 등록하고 " +
            "각 게시물에 랜덤으로 1000개의 " +
            "댓글을 나눠서 등록해야 한다.")
    void bulkInsertTest() {
        for (int i = 1; i <= 200; i++) {
            ClubWriteRequestDTO dto = ClubWriteRequestDTO.builder()
                    .accountId("먕먕먕" + i)
                    .clubTitle("매주 토요일 등산 같이해요" + i)
                    .clubContent("매주 토요일 정기적으로 같이 등산 하실 분 모집합니다. 어디 산이든 좋아요" + i)
                    .clubArea("원하는 산 입구" + i)
                    .clubRecruitDeadline(LocalDateTime.of(2023, 06, 30, 8, 00))
                    .clubRecruitType("정기모임")
                    .clubRecruitCount(i)
                    .build();
            Club c = new Club(dto);
            clubMapper.save(c);
        }


        for (int j = 1; j <= 500; j++) {
            ClubReply reply = ClubReply.builder()
                    .clubReplyWriter("test2")
                    .clubReplyContent("test2의 댓글이다" + j)
                    .clubBoardNo((long) (Math.random() * 200 + 1))
                    .build();

            replyMapper.register(reply);
        }
 }



 */
}