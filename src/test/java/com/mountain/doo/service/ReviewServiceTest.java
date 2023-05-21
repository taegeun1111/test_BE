package com.mountain.doo.service;

import com.mountain.doo.dto.like.ReviewLikeResponseDTO;
import com.mountain.doo.dto.page.Search;
import com.mountain.doo.dto.review.ReviewListResponseDTO;
import com.mountain.doo.entity.Review;
import com.mountain.doo.repository.ReviewMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReviewServiceTest {

    @Autowired
    ReviewService service;
    ReviewMapper mapper;

    @Test
    @DisplayName("클릭시 좋아요가 있으면 -1 없으면 +1 , 좋아요 갯수 게시물 테이블에 수정")
    void clickLike(){

        Search page = new Search();
        page.setPageNo(1);
        page.setAmount(3);

        ReviewLikeResponseDTO dto = new ReviewLikeResponseDTO();
        dto.setClickLike(true);
        dto.setReviewBoardNo(2);
        dto.setAccountId("asd");

       service.clickLike(dto);

        List<ReviewListResponseDTO> list = service.getList(page);
        System.out.println("list = " + list);

    }


}