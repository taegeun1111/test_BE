package com.mountain.doo.dto.reply.reviewreply;


import com.mountain.doo.entity.reply.ReviewReply;
import lombok.*;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewReplyPostRequestDTO {

    private String replyContent;
    private String replyWriter;
    private long boardNo;

    public ReviewReply reviewReplyEntity(){
        return ReviewReply.builder()
                .reviewReplyContent(this.replyContent)
                .reviewReplyWriter(this.replyWriter)
                .reviewBoardNo(this.boardNo)
                .build();
    }
}
