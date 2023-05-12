package com.mountain.doo.repository;

import com.mountain.doo.dto.SecondhandBoardWriteDTO;
import com.mountain.doo.entity.SecondhandBoard;
import com.mountain.doo.entity.SecondhandType;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;


@SpringBootTest
class SecondhandBoardMapperTest {

    @Autowired
    SecondhandBoardMapper mapper;
    
    @Test
    @DisplayName("게시물이 전체 출력되어야 한다")

    void findAllTest(){
        List<SecondhandBoard> list = mapper.findAll();
        for (Object li : list) {
            System.out.println("li = " + li);
        }
    }
    
    @Test
    @DisplayName("boardNo가 들어오면 하나의 게시판이 출력되어야 한다")

    void findOne(){
        int boardNo = 1;
        SecondhandBoard one = mapper.findOne(boardNo);
        System.out.println("one = " + one);

    }

    @Test
    @DisplayName("아이디,제목,글,지역,글타입을 입력하면 하나의 게시글이 저장되어야 한다")
    void boardWrite(){

        SecondhandBoardWriteDTO sc=new SecondhandBoardWriteDTO();

        sc.setAccountId("propess031");
        sc.setSecondhandContent("나는 사람입니다");
        sc.setSecondhandArea("내용이죠");
        sc.setSecondhandTitle("서울") ;
        sc.setSecondhandDealType(SecondhandType.BUY);

        mapper.handWriteData(sc);

        System.out.println("sc = " + sc);
    }
}