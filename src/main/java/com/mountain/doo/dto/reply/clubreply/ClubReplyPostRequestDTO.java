package com.mountain.doo.dto.reply.clubreply;


import com.mountain.doo.entity.reply.ClubReply;
import com.mountain.doo.entity.reply.FeedReply;
import lombok.*;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClubReplyPostRequestDTO {

    private String replyContent;
    private String replyWriter;
    private long boardNo;

    public ClubReply clubReplyEntity(){
        return ClubReply.builder()
                .clubReplyContent(this.replyContent)
                .clubReplyWriter(this.replyWriter)
                .clubBoardNo(this.boardNo)
                .build();
    }
}
