package com.mountain.doo.dto.review;


import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode
public class ReviewLikeUserResponseDTO {

    private String accountId;
    private int reviewBoardNo;
}
