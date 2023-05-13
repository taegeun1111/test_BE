package com.mountain.doo.service;

import com.mountain.doo.dto.SecondhandBoardWriteDTO;
import com.mountain.doo.entity.SecondhandBoard;
import com.mountain.doo.entity.SecondhandType;
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
    void findAllTest() {
        //given

        //when
        List<SecondhandBoard> list = mapper.findAll();
        for (SecondhandBoard listall : list) {
            System.out.println("listall = " + listall);
        }
        //then
    }

    @Test
    @DisplayName("게시글 번호 입력하면 board 하나를 출력한다")
    void findOneTest() {

        SecondhandBoard one = mapper.findOne(3);
        mapper.plusViewCount(3);

        System.out.println("one = " + one);
        System.out.println("viewCount = "+one.getSecondhandView());

    }

    @Test
    @DisplayName("아이디,제목,글,지역,글타입을 입력하면 하나의 게시글이 저장되어야 한다")
    void boardWrite() {

        SecondhandBoardWriteDTO sc = new SecondhandBoardWriteDTO();

        sc.setAccountId("서비스테스트");
        sc.setSecondhandContent("나는 서비스");
        sc.setSecondhandArea("서비스");
        sc.setSecondhandTitle("서비스");
        sc.setSecondhandDealType(SecondhandType.SELL);

        mapper.handWriteData(sc);

        System.out.println("sc = " + sc);
    }
}