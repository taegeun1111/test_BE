package com.mountain.doo.service;

import com.mountain.doo.dto.Page.Search;
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
    @DisplayName("거래타입별 필터링 후 게시물이 전체 출력되어야 한다")
    void findAllTest(){
        Search search =new Search();
        SecondhandType type = SecondhandType.BUY;
        List<SecondhandBoard> list = mapper.findAll(new Search());

        for (SecondhandBoard board : list) {
            if (board.getSecondhandDealType()==type){
                System.out.println("board = " + board);
            }
        }
    }

    @Test
    @DisplayName("게시글 번호 입력하면 board 하나를 출력하고 조회수를 +1 시킨다")
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