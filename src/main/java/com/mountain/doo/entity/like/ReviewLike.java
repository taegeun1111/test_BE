package com.mountain.doo.entity.like;

import lombok.*;
import org.springframework.stereotype.Component;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Component
public class ReviewLike {
    private int reviewLikeNo;
    private String accountId;
    private int reviewBoardNo;
}
