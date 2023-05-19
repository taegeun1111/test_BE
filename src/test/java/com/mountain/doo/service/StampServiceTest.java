package com.mountain.doo.service;

import com.mountain.doo.dto.stamp.StampAddConditionDTO;
import com.mountain.doo.dto.stamp.StampResponseDTO;
import com.mountain.doo.repository.StampMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class StampServiceTest {
    @Autowired
    StampService service;


    @Test
    @DisplayName("배너, 게시물, 출석 db에 + 시키기")
    void stampAddCondition() {
        StampAddConditionDTO dto = new StampAddConditionDTO();
        dto.setBannerClickCount(1);
        dto.setAttendCount(1);
        dto.setBoardCount(1);
        dto.setAccountId("이동우");
        StampAddConditionDTO stampAddConditionDTO = service.stampAddCondition(dto);
        System.out.println("stampAddConditionDTO = " + stampAddConditionDTO);

    }

    @Test
    @DisplayName("사용자의 데이터를 가지고 도장개수 return")
    void stampCount(){
        StampAddConditionDTO dto=new StampAddConditionDTO();
        dto.setBannerClickCount(3);
        dto.setAttendCount(3);
        dto.setBoardCount(1);
        dto.setAccountId("이동우");
        StampResponseDTO stampAddConditionDTO = service.stampCount(dto);
        System.out.println("stampAddConditionDTO = " + stampAddConditionDTO);

    }
}