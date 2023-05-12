package com.mountain.doo.entity;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Setter @RequiredArgsConstructor
public class Club {
    private int clubBoardNo; //글번호
    private String clubAccountId;
    private String clubTitle; //제목
    private String clubContent; //내용
    private String clubArea; //모임 장소
    private LocalDateTime regDateTime; // 작성일자시간
    private int deadline; //마감 일자
    private String clubRecruitType; //모임 종류(정기모임인지 소모임인지)
    private int clubRecruitCount; //모집 인원

}
