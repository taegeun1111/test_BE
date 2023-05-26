package com.mountain.doo.dto.like;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class IssueLikeResponseDTO {
    private String accountId;
    private int issueLikeBoardNo;
    private boolean clickLike;

}
