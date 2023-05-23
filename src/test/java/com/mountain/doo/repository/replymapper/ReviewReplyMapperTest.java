package com.mountain.doo.repository.replymapper;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReviewReplyMapperTest {

    @Autowired
    ReviewReplyMapper mapper;

    @Test
    @DisplayName("댓글 번호를 입력하면 게시물이 지워져야 한다.")
    void removeTest(){
        boolean flag = mapper.remove(3);

        System.out.println("flag = " + flag);
    }
}