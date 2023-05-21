package com.mountain.doo.service;

import com.mountain.doo.dto.like.ReviewLikeResponseDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReviewServiceTest {

    @Autowired
    ReviewService service;

    @Test
    @DisplayName("클릭시 좋아요가 있으면 -1 없으면 +1")
    void clickLike(){
        ReviewLikeResponseDTO dto = new ReviewLikeResponseDTO();
        dto.setClickLike(true);
        dto.setReviewBoardNo(3);
        dto.setAccountId("myblog0419");
       service.clickLike(dto);



    }
}