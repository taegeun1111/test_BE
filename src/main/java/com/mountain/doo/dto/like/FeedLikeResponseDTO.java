package com.mountain.doo.dto.like;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class FeedLikeResponseDTO {
    private String accountId;
    private int feedBoardNo;
    private boolean clickLike;

}
