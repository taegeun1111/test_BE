package com.mountain.doo.repository;

import com.mountain.doo.entity.Issue;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class IssueMapperTest {

    @Autowired
    IssueMapper mapper;

    @Test
    void saveTest(){
        //given
        for (int i = 0; i < 50; i++) {
            Issue build = Issue.builder()
                    .accountId("test2")
                    .issueContent("안녕하세요" + i)
                    .issueTitle("타이틀입니다" + i)
                    .issueViewCount(0)
                    .issueLikeCount(0)
                    .build();

            mapper.save(build);
        }

    }
}