package com.mountain.doo.dto.like;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class ReviewLikeResponseDTO {
    private String accountId;
    private int reviewBoardNo;
    private boolean clickLike;

}
