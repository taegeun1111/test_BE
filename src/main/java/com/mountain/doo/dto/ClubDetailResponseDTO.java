package com.mountain.doo.dto;

import com.mountain.doo.entity.Club;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter
@ToString @EqualsAndHashCode
@RequiredArgsConstructor
public class ClubDetailResponseDTO {
    private final int clubBoardNo;
    private final String clubTitle;
    private final String clubContent;
    private final String clubRecruitDeadline;
    private final String clubArea;
    private final String clubRecruitType;
    private final int clubRecruitCount;
    //작성자 추가
    private final String accountId;

    public ClubDetailResponseDTO(Club club) {
        this.clubBoardNo = club.getClubBoardNo();
        this.clubTitle = club.getClubTitle();
        this.clubContent = club.getClubContent();
        this.clubRecruitDeadline = makePrettierDateString(club.getClubRegDate());
        this.clubArea = club.getClubArea();
        this.clubRecruitType = club.getClubRecruitType();
        this.clubRecruitCount = club.getClubRecruitCount();
        this.accountId = club.getAccountId();
    }

    static String makePrettierDateString(LocalDateTime regDateTime) {
        DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return pattern.format(regDateTime);
    }
}
