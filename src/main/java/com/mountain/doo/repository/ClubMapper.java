package com.mountain.doo.repository;


import com.mountain.doo.dto.ClubModifyDTO;
import com.mountain.doo.dto.page.ClubSearch;
import com.mountain.doo.dto.page.Search;
import com.mountain.doo.entity.Club;
import com.mountain.doo.entity.Feed;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClubMapper {

    //게시물 목록 조회
//    List<Club> findAll();
    List<Club> findAll(ClubSearch page);

    //게시물 상세 조회
    Club findOne(int clubBoardNo);

    //게시물 등록
    boolean save(Club club);

    //게시물 삭제
    boolean deleteByNo(int clubBoardNo);

    // 게시물 수정
    // 수정이 됐는가 안 됐는가
    // boolean modifyClub(Club club);


    //전체 글 개수 count
    int count(ClubSearch search);


    //수정 처리
    boolean modify(ClubModifyDTO dto);
//    int count();

    // 조회수 상승
    void upViewCount(int clubBoardNo);
}
