package com.mountain.doo.repository;

import com.mountain.doo.dto.OfferImageResponseDTO;
import com.mountain.doo.dto.OfferWriteRequestDTO;
import com.mountain.doo.dto.OfferResponseDTO;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class OfferMapperTest {
    @Autowired
    OfferMapper mapper;
    @Test
    public void save(){
        String accountId="aaa";
        OfferWriteRequestDTO dto = OfferWriteRequestDTO.builder()
                .offerTitle1("산추천제목아아아")
                .offerContent1("산추천글아아아")
                .build();
        System.out.println("test dto"+ dto);
        /*Offer c = new Offer(offer);*/

        //when
        boolean flag=mapper.save(dto,accountId);

        //then
        assertTrue(flag); //세이브가 성공했을 것이라고 단언

    }

    @Test
    public void findBoardNo(){
//        int boardNo = mapper.findBoardNo();
//        System.out.println("boardNo : "+boardNo);
    }

    @Test
    public void findRecentArticleTest(){
//        String offerType="산 추천";
//        OfferResponseDTO recentArticle = mapper.findRecentArticle(offerType);
//        System.out.println("recentArticle : "+recentArticle);
    }

    @Test
    public void findImageTest(){
        int offerBoardNo=13;
        List<OfferImageResponseDTO> image = mapper.findImage(13);
            System.out.println("image 경로 : "+ image);
        System.out.println("image.get(0) : "+image.get(0).getOfferImage());
    }

//    @Test
//    public void

}