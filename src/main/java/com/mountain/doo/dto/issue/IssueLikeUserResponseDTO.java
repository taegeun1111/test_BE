package com.mountain.doo.dto.issue;


import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode
public class IssueLikeUserResponseDTO {

    private String accountId;
    private int feedBoardNo;
}
