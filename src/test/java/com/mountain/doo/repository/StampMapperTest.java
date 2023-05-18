package com.mountain.doo.repository;

import com.mountain.doo.dto.stamp.StampResponseDTO;
import jdk.jfr.StackTrace;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class StampMapperTest {

    @Autowired
    StampMapper mapper;
    @Test
    @DisplayName("아이디를 입력하면 스탬프 총 개수가 나와야 한다")
    void stampCount(){

        StampResponseDTO stampResponseDTO;
        stampResponseDTO.setAttendCount(1);
        stampResponseDTO.setBoardCount(3);
        stampResponseDTO.setBannerClickCount(6);
        stampResponseDTO.setTotalStampCount(2);




   }

   @Test
    @DisplayName("배너클릭이 3번이 되면 스탬프수 +1, id 값 들어와야 한다1")
    void checkBannerCount(){
        mapper.stampUpdate("이동우"){

       }
   }

}