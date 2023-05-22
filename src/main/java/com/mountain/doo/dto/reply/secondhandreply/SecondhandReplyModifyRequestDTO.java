package com.mountain.doo.dto.reply.secondhandreply;


import com.mountain.doo.entity.reply.SecondhandReply;
import lombok.*;

import javax.validation.constraints.NotNull;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SecondhandReplyModifyRequestDTO {
    @NotNull
    private Long boardNo;
    @NotNull
    private Long replyNo;
    @NotNull
    private String content;

    public SecondhandReply toEntity() {
        return SecondhandReply.builder()
                .secondhandReplyNo(this.replyNo)
                .secondhandBoardNo(this.boardNo)
                .secondhandReplyContent(this.content).build();
    }
}
