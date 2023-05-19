package com.mountain.doo.dto;

import lombok.*;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDateTime;

@Setter @Getter
@ToString
@NoArgsConstructor @AllArgsConstructor
@EqualsAndHashCode
@Builder
public class ClubModifyDTO {
    private int clubBoardNo;
    private String accountId; //작성자 id
    private String clubTitle; //제목
    private String clubContent; //내용
    private String clubArea; //모임 장소
    private LocalDateTime clubRecruitDeadline; //마감 일자
    private String clubRecruitType; //모임 종류(정기모임인지 소모임인지)
    private int clubRecruitCount; //모집 인원
    private LocalDateTime clubModifyDate; // 수정일자


//    public ClubModifyDTO changeClub(ClubModifyDTO dto){
//        ClubModifyDTO build = ClubModifyDTO.builder()
//                .clubBoardNo(dto.getClubBoardNo())
//                .accountId(dto.getAccountId())
//                .clubTitle(dto.getClubTitle())
//                .clubContent(dto.getClubContent())
//                .clubArea(dto.getClubArea())
//                .clubRecruitDeadline(dto.getClubRecruitDeadline())
//                .clubRecruitType(dto.getClubRecruitType())
//                .clubRecruitCount(dto.getClubRecruitCount())
//                .build();
//        return build;
//    }

}
