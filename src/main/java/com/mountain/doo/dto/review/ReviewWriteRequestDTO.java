package com.mountain.doo.dto.review;


import lombok.*;

import java.time.LocalDateTime;


@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
public class ReviewWriteRequestDTO {

    private String id;
    private String title;
    private String content;
    private int boardNo;
    private LocalDateTime modifyTime;

    public ReviewWriteRequestDTO(ReviewWriteRequestDTO dto) {
        this.id = dto.getId();
        this.title = dto.getTitle();
        this.content = dto.getContent();
        this.boardNo = dto.getBoardNo();
        this.modifyTime = LocalDateTime.now();
    }
}
