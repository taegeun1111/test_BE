package com.mountain.doo.dto;


import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Service;

@Setter @RequiredArgsConstructor
public class ClubListResponseDTO {
    private final int clubBoardNo; //글번호
    private final String clubTitle; //제목
    private final String clubContent; //내용
    private final String clubRegdate; // 날짜패턴 yyyy-MM-dd HH:mm
    private final String clubArea; //모임 장소
    private final int deadline; //마감 일자
    private  final String clubRecruitType; //모임 종류(정기모임인지 소모임인지)

}
