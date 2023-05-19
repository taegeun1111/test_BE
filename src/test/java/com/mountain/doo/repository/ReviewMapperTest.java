package com.mountain.doo.repository;

import com.mountain.doo.entity.Issue;
import com.mountain.doo.entity.Review;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReviewMapperTest {

    @Autowired
    ReviewMapper mapper;

    @Test
    @DisplayName("게시물 300개 저장")
    void saveTest(){
        for (int i = 0; i < 50; i++) {
            Review review = Review.builder()
                    .accountId("test2")
                    .reviewContent("안녕하세요이슈다" + i)
                    .reviewTitle("테스트이슈입니다" + i)
                    .reviewViewCount(0)
                    .reviewLikeCount(0)
                    .build();

            mapper.save(review);
        }
    }
}