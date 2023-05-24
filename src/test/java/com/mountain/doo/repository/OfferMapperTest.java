package com.mountain.doo.repository;

import com.mountain.doo.dto.OfferWriteRequestDTO;
import com.mountain.doo.entity.Club;
import com.mountain.doo.entity.Offer;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

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


}