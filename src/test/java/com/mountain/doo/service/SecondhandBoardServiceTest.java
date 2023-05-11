package com.mountain.doo.service;

import com.mountain.doo.entity.SecondhandBoard;
import com.mountain.doo.repository.SecondhandBoardMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class SecondhandBoardServiceTest {
    @Autowired
    SecondhandBoardMapper mapper;

    @Test
    @DisplayName("전체리스트 출력이 되어야 한다")
    void findAllTest(){
        //given

        //when
        List<SecondhandBoard> list = mapper.findAll();
        for (SecondhandBoard listall : list) {
            System.out.println("listall = " + listall);
        }
        //then
    }
}