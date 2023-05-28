package com.mountain.doo.service;

import com.mountain.doo.dto.issue.IssueListResponseDTO;
import com.mountain.doo.dto.like.IssueLikeResponseDTO;
import com.mountain.doo.dto.like.ReviewLikeResponseDTO;
import com.mountain.doo.dto.page.Search;
import com.mountain.doo.dto.review.ReviewListResponseDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Service;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest

class IssueServiceTest {
    @Autowired
    IssueService service;

    @Test
    @DisplayName("클릭시 좋아요가 있으면 -1 없으면 +1 , 좋아요 갯수 게시물 테이블에 수정")
    void clickLike(){

//        Search page = new Search();
//        page.setPageNo(1);
//        page.setAmount(3);
//
//        IssueLikeResponseDTO dto = new IssueLikeResponseDTO();
//        dto.setClickLike(true);
//        dto.setIssueLikeBoardNo(2);
//        dto.setAccountId("myblog0419");
//
//        service.clickLike(dto);
//
//        List<IssueListResponseDTO> list = service.getList(page);
//        System.out.println("list = " + list);

    }

}