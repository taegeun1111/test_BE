package com.mountain.doo.service;

import com.mountain.doo.dto.feed.FeedListResponseDTO;
import com.mountain.doo.dto.like.FeedLikeResponseDTO;
import com.mountain.doo.dto.like.ReviewLikeResponseDTO;
import com.mountain.doo.dto.page.Search;
import com.mountain.doo.dto.review.ReviewListResponseDTO;
import com.mountain.doo.repository.FeedMapper;
import com.mountain.doo.repository.ReviewMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class FeedServiceTest {

    @Autowired
    FeedService service;
    FeedMapper mapper;

    @Test
    @DisplayName("클릭시 좋아요가 있으면 -1 없으면 +1 , 좋아요 갯수 게시물 테이블에 수정")
    void clickLike(){

        Search page = new Search();
        page.setPageNo(1);
        page.setAmount(3);

        FeedLikeResponseDTO dto = new FeedLikeResponseDTO();
        dto.setClickLike(true);
        dto.setFeedBoardNo(1);
        dto.setAccountId("myblog0419");

        service.clickLike(dto);

        List<FeedListResponseDTO> list = service.getList(page);
        System.out.println("list = " + list);

    }

}