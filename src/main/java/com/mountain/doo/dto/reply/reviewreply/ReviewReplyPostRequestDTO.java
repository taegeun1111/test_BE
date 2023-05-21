package com.mountain.doo.dto.reply.reviewreply;


import com.mountain.doo.entity.reply.FeedReply;
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

    public FeedReply feedReplyEntity(){
        return FeedReply.builder()
                .feedReplyContent(this.replyContent)
                .feedReplyWriter(this.replyWriter)
                .feedBoardNo(this.boardNo)
                .build();
    }
}
