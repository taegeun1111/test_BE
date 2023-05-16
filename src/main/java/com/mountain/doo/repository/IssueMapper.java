package com.mountain.doo.repository;


import com.mountain.doo.dto.page.ClubSearch;
import com.mountain.doo.entity.Issue;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface IssueMapper {


    // CRUD 기능을 명시

    // 전체 게시글 조회
    List<Issue> findAll(ClubSearch page);

    // 게시글 상세 조회
    Issue findOne(long issueBoardNo);

    // 게시물 등록
    // 등록이 되었는가 안 됐는가
    boolean save(Issue issue);  // 게시물 정보 필요

    // 게시물 수정
    // 수정이 됐는가 안 됐는가
    boolean modifyIssue(Issue issue);

    // 삭제
    boolean deleteIssue(long issueBoardNo); // 게시물 번호로 찾아서 삭제

    // 게시물 세기
    int issueCount(ClubSearch clubSearch);
}
