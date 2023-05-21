package com.mountain.doo.repository;

import com.mountain.doo.dto.like.ReviewLikeResponseDTO;
import com.mountain.doo.entity.Review;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

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

    @Test
    @DisplayName("아이디와 보드넘버가 같다면 좋아요 수 +1")
    void plusMinusLike(){
        //서비스에서는 동일 아이디가 동일 게시글에 좋아요 2번하게 하면 안된다

        ReviewLikeResponseDTO dto=new ReviewLikeResponseDTO();
        dto.setAccountId("sd");
        dto.setReviewBoardNo(2);
        dto.setClickLike(true);
        mapper.plusLike(dto);

    }

    @Test
    @DisplayName("아이디와 보드넘버 같은 LIKENO COUNT 구하기")
    void likeCount(){
        ReviewLikeResponseDTO dto=new ReviewLikeResponseDTO();
        dto.setAccountId("myblog0419");
        dto.setReviewBoardNo(1);
        dto.setClickLike(false);

        int i = mapper.likeCount(dto);
        System.out.println("i = " + i);

    }

    @Test
    @DisplayName("해당 게시글에 있는 좋아요 개수 확인")
    void updateLikeCount(){


        mapper.updateLikeCount(3);
        Review one = mapper.findOne(3);

        System.out.println("one = " + one);
    }


}