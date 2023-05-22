package com.mountain.doo.dto.reply.reviewreply;


import com.mountain.doo.entity.reply.ReviewReply;
import lombok.*;

import javax.validation.constraints.NotNull;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewReplyModifyRequestDTO {
    @NotNull
    private Long boardNo;
    @NotNull
    private Long replyNo;
    @NotNull
    private String content;

    public ReviewReply toEntity() {
        return ReviewReply.builder()
                .reviewReplyNo(this.replyNo)
                .reviewBoardNo(this.boardNo)
                .reviewReplyContent(this.content).build();
    }
}
