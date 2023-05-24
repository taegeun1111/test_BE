package com.mountain.doo.dto;

import com.mountain.doo.entity.SecondhandBoard;
import com.mountain.doo.entity.SecondhandType;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Setter
@Getter
@ToString
@NoArgsConstructor
@EqualsAndHashCode

public class SecondhandBoardListDTO {
    private int secondHandBoardNo;
    private String accountId;
    private String secondhandTitle;
    private int secondhandViewCount;
    private String secondhandArea;
    private String secondhandRegDate;
    private SecondhandType secondhandDealType;
    private String secondhandContent;

public SecondhandBoardListDTO(SecondhandBoard board){
    this.secondHandBoardNo=board.getSecondHandBoardNo();
    this.accountId=board.getAccountId();
    this.secondhandTitle=board.getSecondhandTitle();
    this.secondhandViewCount=board.getSecondhandViewCount();
    this.secondhandArea=board.getSecondhandArea();
    this.secondhandRegDate=timeSet(board.getSecondhandRegDate());
    this.secondhandDealType=board.getSecondhandDealType();
    this.secondhandContent = board.getSecondhandContent();
}

private String timeSet(LocalDateTime dt){
    DateTimeFormatter time = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    return time.format(dt);

}




}