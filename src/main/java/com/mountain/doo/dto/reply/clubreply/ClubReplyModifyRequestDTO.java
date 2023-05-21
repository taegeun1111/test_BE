package com.mountain.doo.dto.reply.clubreply;


import com.mountain.doo.entity.reply.ClubReply;
import lombok.*;

import javax.validation.constraints.NotNull;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClubReplyModifyRequestDTO {
    @NotNull
    private Long boardNo;
    @NotNull
    private Long replyNo;
    @NotNull
    private String content;

    public ClubReply toEntity() {
        return ClubReply.builder()
                .clubReplyNo(this.replyNo)
                .clubBoardNo(this.boardNo)
                .clubReplyContent(this.content).build();
    }
}
