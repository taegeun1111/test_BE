package com.mountain.doo.dto;


import com.mountain.doo.dto.feed.FeedRewriteRequestDTO;
import lombok.*;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
public class ClubRewriteRequestDTO {
    private String id;
    private String title;
    private String content;
    private int boardNo;
    private LocalDateTime modifyTime;

    public ClubRewriteRequestDTO(ClubRewriteRequestDTO club) {
        this.id = club.getId();
        this.title = club.getTitle();
        this.content = club.getContent();
        this.boardNo = club.getBoardNo();
        this.modifyTime = LocalDateTime.now();
    }
}
