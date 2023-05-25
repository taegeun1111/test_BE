package com.mountain.doo.dto.feed;


import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode
public class FeedLikeUserResponseDTO {

    private String accountId;
    private int feedBoardNo;
}
