package com.mountain.doo.repository;

import com.mountain.doo.dto.stamp.StampAddConditionDTO;
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
    @DisplayName("배너클릭이 3번이 되면 스탬프수 +1, id 값 들어와야 한다1")
    void checkBannerCount() {
        StampAddConditionDTO dto = new StampAddConditionDTO();
        dto.setBannerClickCount(6);
        dto.setAttendCount(6);
        dto.setBoardCount(6);
        dto.setAccountId("이동우");
        StampAddConditionDTO stampAddConditionDTO = mapper.stampAddCondition(dto);
        System.out.println("stampAddConditionDTO = " + stampAddConditionDTO);
    }

        @Test
        @DisplayName("배너가 3의 배수면 토탈 스탬프 개수 +1")
        void bannerPlus() {
            StampAddConditionDTO dto = new StampAddConditionDTO();
            dto.setBannerClickCount(6);
            dto.setAttendCount(6);
            dto.setBoardCount(6);
            dto.setAccountId("myblog0419");
            mapper.bannerPlus(dto);

            System.out.println("dto = " + dto);

        }

    }
