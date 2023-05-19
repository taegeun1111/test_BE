package com.mountain.doo.dto;


import lombok.*;

import java.time.LocalDateTime;


@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
public class SecondhandRewriteRequestDTO {

    private String id;
    private String title;
    private String content;
    private int boardNo;
    private LocalDateTime modifyTime;

    public SecondhandRewriteRequestDTO(SecondhandRewriteRequestDTO secondhand) {
        this.id = secondhand.getId();
        this.title = secondhand.getTitle();
        this.content = secondhand.getContent();
        this.boardNo = secondhand.getBoardNo();
        this.modifyTime = secondhand.getModifyTime();
    }
}
