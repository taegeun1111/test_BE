package com.mountain.doo.service;

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
    @DisplayName("아이디를 입력하면 스탬프 총 개수가 나와야 한다")
    void stampCount(){
        int stampCount = service.stampCount("김주주");

        assertEquals(1,stampCount);

    }
}